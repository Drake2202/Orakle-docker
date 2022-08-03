package com.smartfoxserver.redbox
{
	import com.smartfoxserver.redbox.utils.Logger;
	import com.smartfoxserver.redbox.utils.Constants;
	import com.smartfoxserver.redbox.events.RedBoxChatEvent;
	import com.smartfoxserver.redbox.data.ChatSession;
	import com.smartfoxserver.redbox.exceptions.*;
	
	import it.gotoandplay.smartfoxserver.SmartFoxClient;
	import it.gotoandplay.smartfoxserver.SFSEvent;
	
	import flash.events.EventDispatcher;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.events.NetStatusEvent;

	/**
	 * SmartFoxServer's RedBox Audio/Video Chat Manager.
	 * This class is responsible for audio/video chat implementation by means of the connection to the Red5 server.
	 * The AVChatManager handles the chat workflow (send request, accept or refuse it, establish or stop connection, etc.) and the live streaming to/from the Red5 server.
	 * 
	 * <b>NOTE</b>: in the provided examples, {@code avChatMan} always indicates an AVChatManager instance.
	 * 
	 * @usage	The <b>AVChatManager</b> class is useful to create one-on-one audio/video chats. Three chat modes are supported: receive-only, send-only or send-and-receive.
	 * 			In send-only and receive-only modes, the a/v chat requests are distinct: a user can watch a friend without sending his own stream, and vice versa (just like in Windows Live Messenger, when you click the webcam icons under the users' pictures).
	 * 			In send-and-receive mode, a single request includes both sending the user's own stream and receiving the friend's stream.
	 * 			The following workflow is suggested (to make it simpler the send-and-receive mode is considered; for the other modes the flow is the same, but two separate requests are needed).
	 * 			<ol>
	 * 				<li>The current user click on an interface element to send the a/v chat request to a friend; usually a button in a private chat window is used.</li>
	 * 				<li>An invitation is sent to the recipient user by means of the {@link #sendChatRequest} method; of course the recipient must be connected to SmartFoxServer (but not necessarily in the same room of the requester), otherwise the {@link RedBoxChatEvent#onRecipientMissing} event is fired on the requester's client.</li>
	 * 				<li>On the recipient's client the {@link RedBoxChatEvent#onChatRequest} event is fired: an invitation to send and receive the a/v stream is displayed, together with the interface elements to accept or decline it.
	 * 				If the recipient refuses the invitation, the {@link #refuseChatRequest} method is called, which causes the {@link RedBoxChatEvent#onChatRefused} event to be fired on the requester's client and the interface to be adjusted accordingly.</li>
	 * 				<li>The recipient accepts the invitation: the {@link #acceptChatRequest} method is called, which causes the {@link RedBoxChatEvent#onChatStarted} event to be fired on both the requester's and the recipient's clients.</li>
	 * 				<li>On both the requester's and the recipient's clients two Video objects are added to the stage to display the incoming stream and the user's own camera output.</li>
	 * 				<li>One of the two users involved in the chat clicks on an interface element to stop the a/v chat: the {@link #stopChat} method is called and the {@link RedBoxChatEvent#onChatStopped} event is fired on the connected user's client, so that the Video objects can be removed from stage.</li>
	 * 			</ol>
	 * 
	 * @version	1.0.0
	 * 
	 * @author	The gotoAndPlay() Team
	 * 			{@link http://www.smartfoxserver.com}
	 * 			{@link http://www.gotoandplay.it}
	 */
	public class AVChatManager extends EventDispatcher
	{
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		// Chat request types
		
		/**
		 * Audio/video chat request type: "stream from requester to recipient".
		 * The requester would like to send his own live a/v stream to the recipient.
		 * 
		 * @see	#sendChatRequest
		 */
		public static const REQ_TYPE_SEND:String = "send"
		
		/**
		 * Audio/video chat request type: "stream from recipient to requester".
		 * The requester would like to receive the recipient's live a/v stream.
		 * 
		 * @see	#sendChatRequest
		 */
		public static const REQ_TYPE_RECEIVE:String = "receive"
		
		/**
		 * Audio/video chat request type: "bi-directional stream".
		 * The requester would like to establish a mutual live a/v connection.
		 * 
		 * @see	#sendChatRequest
		 */
		public static const REQ_TYPE_SEND_RECEIVE:String = "send&rcv"
		
		// Outgoing extension commands
		private const CMD_REQUEST:String = "req"	// Send request to start an a/v chat session
		private const CMD_ACCEPT:String = "accept"	// Accept invitation to start an a/v chat session
		private const CMD_REFUSE:String = "refuse"	// Refuse invitation to start an a/v chat session
		private const CMD_STOP:String = "stop"		// Stop an a/v chat session
		
		// Incoming extension responses
		private const RES_REQUEST:String = "req"	// Incoming request to start an a/v chat session
		private const RES_START:String = "start"	// a/v chat session started
		private const RES_REFUSED:String = "refused"	// Invitation to start an a/v chat session refused
		private const RES_STOP:String = "stop"		// a/v chat session stopped
		
		// Incoming extension errors
		private const ERR_NO_RECIPIENT:String = "err_noRcp";
		private const ERR_DUPLICATE_REQUEST:String = "err_dup";
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var smartFox:SmartFoxClient
		private var red5IpAddress:String
		private var netConn:NetConnection
		private var chatSessions:Array
		
		//--------------------------------------
		//  GETTERS/SETTERS
		//--------------------------------------
		
		/**
		 * The status of the connection to the Red5 server.
		 * If {@code true}, the connection to Red5 is currently available.
		 */
		public function get isConnected():Boolean
		{
			return netConn.connected
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 * AVChatManager contructor.
		 * 
		 * @param	sfs:	the SmartFoxClient instance.
		 * @param	red5Ip:	the Red5 server IP address.
		 * @param	debug:	turn on the debug messages (optional, default is {@code false}).
		 * 
		 * @throws	MyUserPropsNotSetException if the <i>SmartFoxClient.myUserId</i> or <i>SmartFoxClient.myUserName</i> properties are not set.
		 *
		 * @example	The following example shows how to instantiate the AVChatManager class.
		 * 			<code>
		 * 			var smartFox:SmartFoxServer = new SmartFoxServer(true)
		 * 			var red5IpAddress:String = "127.0.0.1"
		 * 			
		 * 			var avChatMan:AVChatManager = new AVChatManager(smartFox, red5IpAddress)
		 * 			</code>
		 * 
		 * see		MyUserPropsNotSetException
		 */
		function AVChatManager(sfs:SmartFoxClient, red5Ip:String, debug:Boolean = false)
		{
			// Set reference to SmartFoxCLient instance
			smartFox = sfs
			
			// Check if "myUser" properties are set
			if (!myUserIsValid())
				throw new MyUserPropsNotSetException()
			
			//------------------------------
			
			// Initialize properties
			red5IpAddress = red5Ip
			Logger.enableLog = debug
			netConn = new NetConnection()
			chatSessions = new Array()
			
			// Add Red5 connection event listener
			netConn.addEventListener(NetStatusEvent.NET_STATUS, onRed5ConnectionStatus)
			
			// Add SmartFoxServer event listeners
			smartFox.addEventListener(SFSEvent.onExtensionResponse, onRedBoxExtensionResponse)
			smartFox.addEventListener(SFSEvent.onConnectionLost, onUserDisconnection)
			smartFox.addEventListener(SFSEvent.onLogout, onUserDisconnection)
			
			// Establish connection to Red5
			initAVConnection()
		}
		
		// -------------------------------------------------------
		// PUBLIC METHODS
		// -------------------------------------------------------
		
		/**
		 * Initialize the audio/video connection.
		 * Calling this method causes the connection to Red5 to be established and the {@link RedBoxChatEvent#onAVConnectionInited} event to be fired in response.
		 * If the connection can't be established, the {@link RedBoxChatEvent#onAVConnectionError} event is fired in response.
		 * <b>NOTE</b>: this method is called automatically when the AVChatManager is instantiated.
		 * 
		 * @sends	RedBoxChatEvent#onAVConnectionInited
		 * @sends	RedBoxChatEvent#onAVConnectionError
		 * 
		 * @example	The following example shows how to initialize the Red5 connection for the AVChatManager instance.
		 * 			<code>
		 * 			avChatMan.initAVConnection()
		 * 			</code>
		 * 
		 * @see		#isConnected
		 * @see		RedBoxClipEvent#onAVConnectionInited
		 * @see		RedBoxClipEvent#onAVConnectionError
		 */
		public function initAVConnection():void
		{
			// Connect to Red5 if a connection is not yet available
			if (!netConn.connected)
			{
				netConn.connect("rtmp://" + red5IpAddress + "/" + Constants.RED5_APPLICATION)
			}
			else
			{
				// Dispatch "onAVConnectionInited" event
				dispatchAVChatEvent(RedBoxChatEvent.onAVConnectionInited)
				
				Logger.log("Red5 connection initialized")
			}
		}
		
		/**
		 * Destroy the AVChatManager instance.
		 * Calling this method causes the interruption of all chat sessions currently in progress (if any) and the disconnection from Red5.
		 * This method should always be called before deleting the AVChatManager instance.
		 * 
		 * @example	The following example shows how to destroy the AVChatManager instance.
		 * 			<code>
		 * 			avChatMan.destroy()
		 * 			avChatMan = null
		 * 			</code>
		 */
		public function destroy():void
		{
			// Remove Red5 connection event listener
			netConn.removeEventListener(NetStatusEvent.NET_STATUS, onRed5ConnectionStatus)
			
			// Remove SmartFoxServer event listeners
			smartFox.removeEventListener(SFSEvent.onExtensionResponse, onRedBoxExtensionResponse)
			smartFox.removeEventListener(SFSEvent.onConnectionLost, onUserDisconnection)
			smartFox.removeEventListener(SFSEvent.onLogout, onUserDisconnection)
			
			// Stop all streams
			if (chatSessions != null)
			{
				for each (var session:ChatSession in chatSessions)
				{
					// Stop session and close its streams
					stopChat(session.id)
				}
				
				chatSessions = new Array()
			}
			
			// Disconnect from Red5 server
			if (netConn.connected)
				netConn.close()
			
			Logger.log("AVChatManager instance destroyed")
		}
		
		/**
		 * Retrieve a {@link ChatSession} object instance.
		 * 
		 * @param	sessionId:	the id of the chat session to be retrieved (see {@link ChatSession#id} property).
		 * 
		 * @return	The {@link ChatSession} object.
		 * 
		 * @example	The following example shows how to get a chat session.
		 * 			<code>
		 * 			var chatData:ChatSession = avChatMan.getChatSession(sessionId)
		 * 			
		 * 			if (chatData != null)
		 * 				trace (chatData.toString())
		 * 			</code>
		 * 
		 * @see		ChatSession
		 */
		public function getChatSession(sessionId:String):ChatSession
		{
			if (chatSessions != null)
				return chatSessions[sessionId]
			else
				return null
		}
		
		/**
		 * Send a request to start an audio/video chat.
		 * When this method is called, a "chat session" is created (see the {@link ChatSession} class description) and an invitation to start the a/v chat is sent to the selected user id, causing the {@link RedBoxChatEvent#onChatRequest} event to be fired on the recipient's client.
		 * If the recipient is not available (for example he disconnects while the request is being sent), the {@link RedBoxChatEvent#onRecipientMissing} event is fired in response.
		 * If the mutual request has already been sent by the recipient, the {@link RedBoxChatEvent#onDuplicateRequest} is fired in response.
		 * Audio and video recording mode/quality should be set before calling this method. In order to alter these settings, please refer to the flash.media.Microphone and flash.media.Camera classes documentation.
		 * 
		 * @param	type:				the request type; valid values are: {@link #REQ_TYPE_SEND}, {@link #REQ_TYPE_RECEIVE} and {@link #REQ_TYPE_SEND_RECEIVE}.
		 * @param	recipientId:		the SmartFoxServer's user id of the recipient.
		 * @param	enableCamera:		enable video live streaming; default value is {@code true}.
		 * @param	enableMicrophone:	enable audio live streaming; default value is {@code true}.
		 * 
		 * @return	The {@link ChatSession} object created, or {@code null} if the same request type has already been sent to the same recipient (and it's still pending or already accepted).
		 * 
		 * @sends	RedBoxChatEvent#onChatRequest
		 * @sends	RedBoxChatEvent#onRecipientMissing
		 * @sends	RedBoxChatEvent#onDuplicateRequest
		 * 
		 * @throws	NoAVConnectionException if the connection to Red5 is not available.
		 * @throws	InvalidParamsException if both <i>enableCamera</i> and <i>enableMicrophone</i> parameters are set to {@code false}.
		 * @throws	BadRequestException if the wrong request type is passed when calling this method.
		 * 
		 * @example	The following example shows how to send a request to start an a/v chat.
		 * 			<code>
		 * 			avChatMan.addEventListener(RedBoxChatEvent.onRecipientMissing, onRecipientMissing)
		 * 			avChatMan.addEventListener(RedBoxChatEvent.onDuplicateRequest, onDuplicateRequest)
		 * 			
		 * 			avChatMan.sendChatRequest(AVChatManager.REQ_TYPE_SEND_RECEIVE, buddyId, true, true)
		 * 			
		 * 			function onRecipientMissing(evt:RedBoxChatEvent):void
		 * 			{
		 * 				trace ("Request '" + evt.params.chatSession.id + "' error: the recipient is not available!")
		 * 			}
		 * 			
		 * 			function onDuplicateRequest(evt:RedBoxChatEvent):void
		 * 			{
		 * 				trace ("Request '" + evt.params.chatSession.id + "' error: a mutual request has already been sent by the recipient!")
		 * 			}
		 * 			</code>
		 * 
		 * @see		ChatSession
		 * @see		RedBoxChatEvent#onChatRequest
		 * @see		RedBoxChatEvent#onRecipientMissing
		 * @see		RedBoxChatEvent#onDuplicateRequest
		 * @see		NoAVConnectionException
		 * @see		InvalidParamsException
		 * @see		BadRequestException
		 * @see		flash.media.Camera
		 * @see		flash.media.Microphone
		 */
		public function sendChatRequest(type:String, recipientId:int, enableCamera:Boolean = true, enableMicrophone:Boolean = true):ChatSession
		{
			// If cam & mic are both null, why sending this type of request?
			if (!enableCamera && !enableMicrophone)
				throw new InvalidParamsException(Constants.ERROR_INVALID_PARAMS)
			
			// Check request type
			if (type != REQ_TYPE_SEND && type != REQ_TYPE_RECEIVE && type != REQ_TYPE_SEND_RECEIVE)
				throw new BadRequestException(Constants.ERROR_BAD_REQUEST + ": " + type)
			
			// Check Red5 connection availability
			if (!netConn.connected)
				throw new NoAVConnectionException(Constants.ERROR_NO_CONNECTION + " [sendChatRequest method]")
			
			//------------------------------
			
			// Set session id based on type, requesterId and recipientId parameters
			// NOTE: the RedBox server-side extension the same rule to validate the request id
			var id:String = type + "-" + smartFox.myUserId + "-" + recipientId
			
			// Check if the same request has already been submitted; if yes, discard the new request
			if (chatSessions[id] == null)
			{
				// Create new session
				var sParams:Object = new Object()
				sParams.id = id
				sParams.type = type
				sParams.cam = enableCamera
				sParams.mic = enableMicrophone
				sParams.uId = recipientId
				
				var chatSession:ChatSession = new ChatSession(sParams, true)
				chatSession.setStatus(ChatSession.STATUS_PENDING)
				
				// Send request to RedBox extension
				sendCommand(CMD_REQUEST, sParams)
				
				Logger.log("Chat request of type '" + type + "' sent to user id " + recipientId)
				
				// Add session to chat sessions' list
				chatSessions[id] = chatSession
				
				return chatSession
			}
			
			return null
		}
		
		/**
		 * Refuse an incoming request to start an audio/video chat.
		 * Calling this method causes the {@link RedBoxChatEvent#onChatRefused} event to be fired on the requester's client.
		 * 
		 * @param	sessionId:	the id of the chat session request to be refused (see {@link ChatSession#id} property).
		 * 
		 * @sends	RedBoxChatEvent#onChatRefused
		 * 
		 * @throws	InvalidChatSessionIdException if the passed session id is unknown or the chat session is not in a {@link ChatSession#STATUS_PENDING} status.
		 * 
		 * @example	The following example shows how to refuse a chat request.
		 * 			<code>
		 * 			bt_decline.addEventListener(MouseEvent.CLICK, onDeclineBtClick)
		 * 			
		 * 			// After receiving a chat request, its session id is saved and a "decline" button activated...
		 * 			
		 * 			function onDeclineBtClick(evt:MouseEvent):void
		 * 			{
		 * 				avChatMan.refuseChatRequest(chatSessionId)
		 * 			}
		 * 			</code>
		 * 
		 * @see		RedBoxChatEvent#onChatRefused
		 * @see		ChatSession
		 * @see		InvalidChatSessionIdException
		 */
		public function refuseChatRequest(sessionId:String):void
		{
			var session:ChatSession = chatSessions[sessionId]
			
			// Check if passed session id is valid
			if (session == null)
				throw new InvalidChatSessionIdException(Constants.ERROR_SESSION_UNKNOWN + " [refuseChatRequest method]")
			else
			{
				if (session.status != ChatSession.STATUS_PENDING)
					throw new InvalidChatSessionIdException(Constants.ERROR_SESSION_WRONG_STATUS + " [refuseChatRequest method]")
			}
			
			//------------------------------
			
			// Send refusal to requester
			var params:Object = {}
			params.id = session.id
			
			sendCommand(CMD_REFUSE, params)
			
			// Remove session
			delete chatSessions[session.id]
			
			Logger.log("Chat request refused:", session.id)
		}
		
		/**
		 * Accept an incoming request to start an audio/video chat.
		 * Calling this method causes the {@link RedBoxChatEvent#onChatStarted} event to be fired on both the requester and the recipient clients.
		 * 
		 * @param	sessionId:	the id of the chat session request to be accepted (see {@link ChatSession#id} property).
		 * 
		 * @sends	RedBoxChatEvent#onChatStarted
		 * 
		 * @throws	NoAVConnectionException if the connection to Red5 is not available.
		 * @throws	InvalidChatSessionIdException if the passed session id is unknown or the chat session is not in a {@link ChatSession#STATUS_PENDING} status.
		 * 
		 * @example	The following example shows how to accept a chat request.
		 * 			<code>
		 * 			bt_accept.addEventListener(MouseEvent.CLICK, onAcceptBtClick)
		 * 			
		 * 			// After receiving a chat request, its session id is saved and an "accept" button activated...
		 * 			
		 * 			function onAcceptBtClick(evt:MouseEvent):void
		 * 			{
		 * 				avChatMan.acceptChatRequest(chatSessionId)
		 * 			}
		 * 			</code>
		 * 
		 * @see		RedBoxChatEvent#onChatStarted
		 * @see		ChatSession
		 * @see		NoAVConnectionException
		 * @see		InvalidChatSessionIdException
		 */
		public function acceptChatRequest(sessionId:String):void
		{
			// Check Red5 connection availability
			if (!netConn.connected)
				throw new NoAVConnectionException(Constants.ERROR_NO_CONNECTION + " [acceptChatRequest method]")
			
			var session:ChatSession = chatSessions[sessionId]
			
			// Check if passed session id is valid
			if (session == null)
				throw new InvalidChatSessionIdException(Constants.ERROR_SESSION_UNKNOWN + " [acceptChatRequest method]")
			else
			{
				if (session.status != ChatSession.STATUS_PENDING)
					throw new InvalidChatSessionIdException(Constants.ERROR_SESSION_WRONG_STATUS + " [acceptChatRequest method]")
			}
			
			//------------------------------
			
			// Set session as accepted
			session.setStatus(ChatSession.STATUS_ACCEPTED)
			
			// Send acceptance to requester
			var params:Object = {}
			params.id = session.id
			
			sendCommand(CMD_ACCEPT, params)
			
			Logger.log("Chat request accepted:", session.id)
		}
		
		/**
		 * Stop an a/v chat session currently in progress.
		 * Calling this method causes the {@link RedBoxChatEvent#onChatStopped} event to be fired on the connected user (mate) clients.
		 * 
		 * @param	sessionId:	the id of the chat session to be stopped (see {@link ChatSession#id} property).
		 * 
		 * @sends	RedBoxChatEvent#onChatStopped
		 * 
		 * @example	The following example shows how to stop a chat session.
		 * 			<code>
		 * 			bt_stop.addEventListener(MouseEvent.CLICK, onStopBtClick)
		 * 			
		 * 			// After the chat session started, a "stop" button is activated...
		 * 			
		 * 			function onStopBtClick(evt:MouseEvent):void
		 * 			{
		 * 				avChatMan.stopChat(chatSessionId)
		 * 			}
		 * 			</code>
		 * 
		 * @see		RedBoxChatEvent#onChatStopped
		 * @see		ChatSession
		 */
		public function stopChat(sessionId:String):void
		{
			var session:ChatSession = chatSessions[sessionId]
			
			if (session != null)
			{
				// Close streams
				stopStreams(session)
				
				if (smartFox.isConnected)
				{
					// Send stop command
					var params:Object = {}
					params.id = session.id
					
					sendCommand(CMD_STOP, params)
				}
				
				// Remove session
				delete chatSessions[session.id]
				
				Logger.log("Chat stopped:", session.id)
			}
		}
		
		// -------------------------------------------------------
		// SMARTFOXSERVER & RED5 EVENT HANDLERS
		// -------------------------------------------------------
		
		/**
		 * Handle incoming server responses.
		 * 
		 * @exclude
		 */
		public function onRedBoxExtensionResponse(evt:SFSEvent):void
		{
			var dataObj:Object = evt.params.dataObj
			var cmdArray:Array = dataObj._cmd.split(":")
			
			// Retrieve extension key and manager key from the command string to filter responses addressed to the AVChatManager only
			var extensionKey:String = cmdArray[0]
			var managerKey:String = cmdArray[1]
			var responseKey:String = cmdArray[2]
			
			if (extensionKey == Constants.EXTENSION_KEY && managerKey == Constants.CHAT_MANAGER_KEY)
			{
				Logger.log("Extension response received:", responseKey)
				
				// Chat request error
				if (responseKey == ERR_NO_RECIPIENT || responseKey == ERR_DUPLICATE_REQUEST)
					handleChatRequestError(responseKey, dataObj)
				
				// Chat request received
				else if (responseKey == RES_REQUEST)
					handleChatRequest(dataObj)
				
				// Chat request refused by the recipient
				else if (responseKey == RES_REFUSED)
					handleChatRequestRefused(dataObj)
				
				// Chat startied
				else if (responseKey == RES_START)
					handleChatStarted(dataObj)
				
				// Chat stopped
				else if (responseKey == RES_STOP)
					handleChatStopped(dataObj)
			}
		}
		
		/**
		 * Handle user logout and disconnection events.
		 * 
		 * @exclude
		 */
		public function onUserDisconnection(evt:SFSEvent):void
		{
			// Reset AVChatManager instance
			destroy()
		}
		
		/**
		 * Handle Red5 connection status events.
		 * 
		 * @exclude
		 */
		public function onRed5ConnectionStatus(evt:NetStatusEvent):void
		{
			var code:String = evt.info.code
			var level:String = evt.info.level
			
			Logger.log("NetStatusEvent response received")
			Logger.log("Level: " + level, "| Code:" + code)
			
			switch (code)
			{
				case "NetConnection.Connect.Success":
					
					Logger.log("NetConnection successful")
					
					// Call the "initialize" method which will dispatch the "onAVConnectionInited" event
					initAVConnection()
					
					break
				
				case "NetConnection.Connect.Closed":
				case "NetConnection.Connect.Failed":
				case "NetConnection.Connect.Rejected":
				case "NetConnection.Connect.AppShutDown":
				case "NetConnection.Connect.InvalidApp":
					
					Logger.log("NetConnection error, dispatching event...")
					
					// Stop all streams
					if (chatSessions != null)
					{
						for each (var session:ChatSession in chatSessions)
							stopChat(session.id)
						
						chatSessions = new Array()
					}
					
					// Dispatch connection error event
					var params:Object = {}
					params.errorCode = code
					
					dispatchAVChatEvent(RedBoxChatEvent.onAVConnectionError, params)
					
					break
			}
		}
		
		// -------------------------------------------------------
		// PRIVATE METHODS
		// -------------------------------------------------------
		
		/**
		 * Send command to RedBox extension.
		 */
		private function sendCommand(commandKey:String, params:Object = null):void
		{
			var cmd:String = Constants.CHAT_MANAGER_KEY + ":" + commandKey
			
			if (params == null)
				params = {}
			
			smartFox.sendXtMessage(Constants.REDBOX_EXTENSION, cmd, params, SmartFoxClient.XTMSG_TYPE_JSON)
		}
		
		/**
		 * Dispatch AVChatManager events.
		 */
		private function dispatchAVChatEvent(type:String, params:Object = null):void
		{
			var event:RedBoxChatEvent = new RedBoxChatEvent(type, params)
			dispatchEvent(event)
		}
		
		/**
		 * Check if SmartFoxClient.myUserId and SmartFoxClient.myUserName are set.
		 */
		private function myUserIsValid():Boolean
		{
			return (smartFox.myUserId >= 0 && smartFox.myUserName != "" && smartFox.myUserName != null)
		}
		
		/**
		 * Handle a chat request error due to server-side validation.
		 */
		private function handleChatRequestError(error:String, data:Object):void
		{
			var session:ChatSession = chatSessions[data.id]
			
			if (session != null)
			{
				// Dispatch event
				var params:Object = {}
				params.chatSession = session
				
				var eventType:String = ""
				
				if (error == ERR_DUPLICATE_REQUEST)
					eventType = RedBoxChatEvent.onDuplicateRequest
				else if (error == ERR_NO_RECIPIENT)
					eventType = RedBoxChatEvent.onRecipientMissing
				
				if (eventType != "")
				{
					dispatchAVChatEvent(eventType, params)
					Logger.log("Chat request error, event dispatched")
				}
				else
					Logger.log("Unknown chat request error type!")
				
				// Remove session
				delete chatSessions[data.id]
			}
		}
		
		/**
		 * Handle an incoming chat request.
		 */
		private function handleChatRequest(data:Object):void
		{
			// Create new chat session
			var chatSession:ChatSession = new ChatSession(data, false)
			chatSession.setStatus(ChatSession.STATUS_PENDING)
			
			// Add session to chat sessions' list
			chatSessions[chatSession.id] = chatSession
			
			Logger.log("Chat request received -->", chatSession.toString())
			Logger.log("Session stored while waiting for acceptance or refusal; now dispatching event")
			
			// Dispatch event
			var params:Object = {}
			params.chatSession = chatSession
			
			dispatchAVChatEvent(RedBoxChatEvent.onChatRequest, params)
		}
		
		/**
		 * Handle an incoming chat request refusal.
		 */
		private function handleChatRequestRefused(data:Object):void
		{
			// Retrieve session
			var chatSession:ChatSession = chatSessions[data.id]
			
			if (chatSession != null)
			{
				Logger.log("Chat request refused:", chatSession.id)
				
				// Update mate name
				chatSession.setMateName(data.uName)
				
				// Dispatch event
				var params:Object = {}
				params.chatSession = chatSession
				
				dispatchAVChatEvent(RedBoxChatEvent.onChatRefused, params)
				
				// Remove pending session
				delete chatSessions[chatSession.id]
			}
		}
		
		/**
		 * Handle chat start.
		 */
		private function handleChatStarted(data:Object):void
		{
			// Retrieve session
			var chatSession:ChatSession = chatSessions[data.id]
			
			if (chatSession != null && netConn.connected)
			{
				Logger.log("Chat started:", chatSession.id)
				
				var myStreamId:String = (data.stream != undefined ? data.stream : null)
				var mateStreamId:String = (data.mStream != undefined ? data.mStream : null)
				
				// Publish user own stream
				var myStream:NetStream = null
				
				if (myStreamId != null)
				{
					myStream = new NetStream(netConn)
					
					// Attach cam and mic to the stream
					if (chatSession.enableCamera)
						myStream.attachCamera(Camera.getCamera())
					
					if (chatSession.enableMicrophone)
						myStream.attachAudio(Microphone.getMicrophone())
					
					// Publish stream for broadcasting
					myStream.publish(myStreamId, Constants.BROADCAST_TYPE_LIVE)
					
					Logger.log("User' stream published")
				}
				
				// Play mate' stream
				var mateStream:NetStream = null
				
				if (mateStreamId != null)
				{
					mateStream = new NetStream(netConn)
					mateStream.play(mateStreamId, -1)
					
					Logger.log("Mate' stream playing")
				}
				
				// Update session data
				chatSession.setStatus(ChatSession.STATUS_ACCEPTED)
				chatSession.setMateName(data.mName)
				chatSession.setMyStream(myStream)
				chatSession.setMateStream(mateStream)
				
				// Dispatch event
				var params:Object = {}
				params.chatSession = chatSession
				
				dispatchAVChatEvent(RedBoxChatEvent.onChatStarted, params)
			}
		}
		
		/**
		 * Handle chat stop.
		 */
		private function handleChatStopped(data:Object):void
		{
			// Retrieve session
			var chatSession:ChatSession = chatSessions[data.id]
			
			if (chatSession != null)
			{
				// Update session data
				if (chatSession.mateName == null)
					chatSession.setMateName(data.mName)
				
				// Close streams
				stopStreams(chatSession)
				
				// Dispatch event
				var params:Object = {}
				params.chatSession = chatSession
				
				dispatchAVChatEvent(RedBoxChatEvent.onChatStopped, params)
				
				// Remove session
				delete chatSessions[chatSession.id]
				
				Logger.log("Chat stopped:", chatSession.id)
			}
		}
		
		private function stopStreams(session:ChatSession):void
		{
			if (session.myStream != null)
			{
				session.myStream.attachCamera(null)
				session.myStream.attachAudio(null)
				session.myStream.close()
				session.setMyStream(null)
			}
			
			if (session.mateStream != null)
			{
				session.mateStream.close()
				session.setMateStream(null)
			}
		}
	}
}
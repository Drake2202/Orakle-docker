import it.gotoandplay.smartfoxbits.events.SFSEvent;

/**
 * RedBoxChatEvent is the class representing all events dispatched by the RedBox's {@link AVChatManager} instance.
 * The RedBoxChatEvent extends the it.gotoandplay.smartfoxbits.events.SFSEvent class, which in turn extends the it.gotoandplay.smartfoxbits.events.BaseEvent.
 * RedBoxChatEvent also provides a public property called {@code params} of type {@code Object} that can contain any number of parameters.
 * 
 * @usage	Please refer to the specific events for usage examples and {@code params} object content.
 * 
 * @author	The gotoAndPlay() Team
 * 			{@link http://www.smartfoxserver.com}
 * 			{@link http://www.gotoandplay.it}
 */
class com.smartfoxserver.redbox.events.RedBoxChatEvent extends SFSEvent
{
	/**
	 * Dispatched when the connection to Red5 server has been established.
	 * This event is dispatched after the {@link AVChatManager} is instantiated or when the {@link AVChatManager#initAVConnection} method is called.
	 * The connection to Red5 must be available before any method related to a/v streaming is called.
	 * 
	 * No parameters are provided.
	 * 
	 * @example	The following example shows how to handle the "onAVConnectionInited" event.
	 * 			<code>
	 * 			var red5IpAddress:String = "127.0.0.1"
	 * 			var avChatMan:AVChatManager = new AVChatManager(red5IpAddress)
	 * 			
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onAVConnectionInited, Delegate.create(this, onAVConnectionInited))
	 * 			
	 * 			function onAVConnectionInited(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				trace("Red5 connection established")
	 * 			}
	 * 			</code>
	 * 
	 * @see		AVChatManager#initAVConnection
	 */
	public static var onAVConnectionInited:String = "onAVConnectionInited"
	
	
	/**
	 * Dispatched when the connection to Red5 server can't be established.
	 * This event is dispatched when an error or special condition (like "connection closed") occurred in the NetConnection object used internally by the {@link AVChatManager} to handle the connection to Red5.
	 * This kind of error is always related to the Red5 server connection, so you should check if the server is running and reachable.
	 * Also check the Red5 logs or console output for more details.
	 * NOTE: when a connection error occurs, all the existing chat sessions (whatever their status is) are stopped.
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	errorCode:	(<b>String</b>) the description of the error condition; check the "code" property of the infoObject param of the NetConnection.onStatus handler in the <a href="http://livedocs.adobe.com/flashmediaserver/3.0/hpdocs/help.html?content=00000168.html#228975">Adobe Flash Media Server ActionScript 2.0 Language Reference</a>.
	 * 
	 * @example	The following example shows how to handle a Red5 connection error.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onAVConnectionError, Delegate.create(this, onAVConnectionError))
	 * 			
	 * 			function onAVConnectionError(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				trace("A connection error occurred: " + evt.params.errorCode)
	 * 			}
	 * 			</code>
	 */
	public static var onAVConnectionError:String = "onAVConnectionError"
	
	
	/**
	 * Dispatched when a chat request is sent, but the recipient is not available.
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	chatSession:	(<b>ChatSession</b>) the same {@link ChatSession} object returned by the AVChatManager instance when the {@link AVChatManager#sendChatRequest} method was called.
	 * 
	 * @example	The following example shows how to handle the "onRecipientMissing" event.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onRecipientMissing, Delegate.create(this, onRecipientMissing))
	 * 			
	 * 			avChatMan.sendChatRequest(AVChatManager.REQ_TYPE_SEND_RECEIVE, buddyId, true, true)
	 * 			
	 * 			function onRecipientMissing(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				trace ("Request '" + evt.params.chatSession.id + "' error: the recipient is not available!")
	 * 			}
	 * 			</code>
	 * 
	 * @see		ChatSession
	 * @see		AVChatManager#sendChatRequest
	 */
	public static var onRecipientMissing:String = "onRecipientMissing"
	
	
	/**
	 * Dispatched when a chat request is sent, but a mutual request has already been sent by the recipient.
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	chatSession:	(<b>ChatSession</b>) the same {@link ChatSession} object returned by the AVChatManager instance when the {@link AVChatManager#sendChatRequest} method was called.
	 * 
	 * @example	The following example shows how to handle the "onDuplicateRequest" event.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onDuplicateRequest, Delegate.create(this, onDuplicateRequest))
	 * 			
	 * 			avChatMan.sendChatRequest(AVChatManager.REQ_TYPE_SEND_RECEIVE, buddyId, true, true)
	 * 			
	 * 			function onDuplicateRequest(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				trace ("Request '" + evt.params.chatSession.id + "' error: a mutual request has already been sent by the recipient!")
	 * 			}
	 * 			</code>
	 * 
	 * @see		ChatSession
	 * @see		AVChatManager#sendChatRequest
	 */
	public static var onDuplicateRequest:String = "onDuplicateRequest"
	
	
	/**
	 * Dispatched when an a/v chat request is received.
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	chatSession:	(<b>ChatSession</b>) the {@link ChatSession} object created by the AVChatManager instance when the request is received.
	 * 
	 * @example	The following example shows how to handle an incoming chat request.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onChatRequest, Delegate.create(this, onChatRequest))
	 * 			
	 * 			// Another user sends a chat request...
	 * 			
	 * 			function onChatRequest(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				var chatData:ChatSession = evt.params.chatSession
	 * 				
	 * 				trace ("Chat request received ->" + chatData.toString())
	 * 				
	 * 				// Enable "accept" and "decline" buttons
	 * 				...
	 * 			}
	 * 			</code>
	 * 
	 * @see		ChatSession
	 * @see		AVChatManager#sendChatRequest
	 */
	public static var onChatRequest:String = "onChatRequest"
	
	
	/**
	 * Dispatched when an a/v chat request has been refused by the recipient.
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	chatSession:	(<b>ChatSession</b>) the {@link ChatSession} object created by the AVChatManager instance when the request was sent.
	 * 
	 * @example	The following example shows how to handle a chat request refusal.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onChatRefused, Delegate.create(this, onChatRefused))
	 * 			
	 * 			// The recipient refuses the chat request...
	 * 			
	 * 			function onChatRefused(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				var chatData:ChatSession = evt.params.chatSession
	 * 				
	 * 				trace ("Chat request refused by user" + chatData.mateName)
	 * 				
	 * 				// Show message and reset start/stop chat buttons states
	 * 				...
	 * 			}
	 * 			</code>
	 * 
	 * @see		ChatSession
	 * @see		AVChatManager#refuseChatRequest
	 */
	public static var onChatRefused:String = "onChatRefused"
	
	
	/**
	 * Dispatched when an a/v chat session is started, after the recipient accepted the requester's invitation.
	 * This event is fired on both the requester and the recipient clients.
	 * In order to display the connected users' a/v streams, the {@link ChatSession#myStream} and {@link ChatSession#mateStream} properties should be used. These two properties are set depending on the request type and on who is the requester.
	 * Check the following table:
	 * <img src="../img/img1.jpg"/>
	 * 
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	chatSession:	(<b>ChatSession</b>) the {@link ChatSession} object created by the AVChatManager instance when the request was sent/received.
	 * 
	 * @example	The following example shows how to handle a chat starting.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onChatStarted, Delegate.create(this, onChatStarted))
	 * 			
	 * 			// I'm the recipient accepting the chat request...
	 * 			avChatMan.acceptChatRequest(chatSessionId)
	 * 			
	 * 			function onChatStarted(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				var chatData:ChatSession = evt.params.chatSession
	 * 				
	 * 				var myStream:NetStream = chatData.myStream
	 * 				var mateStream:NetStream = chatData.mateStream
	 * 				
	 * 				// Attach streams to Video objects on stage
	 * 				...
	 * 			}
	 * 			</code>
	 * 
	 * @see		ChatSession
	 * @see		AVChatManager#acceptChatRequest
	 */
	public static var onChatStarted:String = "onChatStarted"
	
	
	/**
	 * Dispatched when an a/v chat session is stopped.
	 * This event is not fired on the client of the user who stopped the chat session, but only on his/her mate's client.
	 * 
	 * The {@code params} object contains the following parameters.
	 * @param	chatSession:	(<b>ChatSession</b>) the {@link ChatSession} object created by the AVChatManager instance when the request was sent/received.
	 * 
	 * @example	The following example shows how to handle a chat being stopped.
	 * 			<code>
	 * 			avChatMan.addEventListener(RedBoxChatEvent.onChatStopped, Delegate.create(this, onChatStopped))
	 * 			
	 * 			avChatMan.stopChat(chatSessionId)
	 * 			
	 * 			function onChatStopped(evt:RedBoxChatEvent):Void
	 * 			{
	 * 				var chatData:ChatSession = evt.params.chatSession
	 * 				
	 * 				// Detach streams from Video objects on stage
	 * 				...
	 * 			}
	 * 			</code>
	 * 
	 * @see		ChatSession
	 * @see		AVChatManager#stopChat
	 */
	public static var onChatStopped:String = "onChatStopped"
	
	//-----------------------------------------------------------------------------------------------------
	
	/**
	 * The parameters for this event.
	 *
	 * @exclude
	 */
	var params:Object;
	
	/**
	 *	RedBoxChatEvent class constructor.
	 *
	 *	@param target: the event's target.
	 *	@param type: the event's type.
	 *	@param params: an object containing the event's parameters.
	 *	
	 *	@exclude
	 */
	public function RedBoxChatEvent(target:Object, type:String, params:Object)
	{
		super(target, type)
		this.params = params;
	}
}
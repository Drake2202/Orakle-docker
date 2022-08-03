import com.smartfoxserver.redbox.utils.Logger;
import com.smartfoxserver.redbox.utils.Constants;
import com.smartfoxserver.redbox.events.RedBoxCastEvent;
import com.smartfoxserver.redbox.data.LiveCast;
import com.smartfoxserver.redbox.exceptions.*;

import it.gotoandplay.smartfoxbits.bits.Connector;
import it.gotoandplay.smartfoxbits.events.SFSEvent;
import it.gotoandplay.smartfoxbits.events.EventDispatcher;

import it.gotoandplay.smartfoxserver.SmartFoxClient;
import it.gotoandplay.smartfoxserver.Room;
import it.gotoandplay.smartfoxserver.User;

import mx.utils.Delegate


/**
 * SmartFoxServer's RedBox Audio/Video Broadcast Manager.
 * This class is responsible for managing audio/video live casts inside the room joined by the user, making it possible to create live web events or a/v conferences.
 * The AVCastManager handles the live cast publishing/playing to/from the Red5 server.
 * Unlike the other RedBox classes, the AVCastManager works on a room basis to leverage the access control and moderation features of SmartFoxServer rooms.
 * 
 * <b>NOTE</b>: in the provided examples, {@code avCastMan} always indicates an AVCastManager instance.
 * 
 * @usage	The most common usages for the <b>AVCastManager</b> class are video conference applications and live webcast applications (for example live online seminars).
 * 			
 * 			<i>Video conference</i>
 * 			In this kind of application, each user publishes his own live stream and subscribes the streams coming from the other users in the same room (in the SmartFoxServer meaning). The following workflow is suggested.
 * 			<ol>
 * 				<li>The current user joins the room where the video conference takes place.</li>
 * 				<li>The list of currently available streams (or "live casts") is retrieved by means of the {@link #getAvailableCasts} method (in case the conference is already in progress).
 * 				Calling this method also enables the reception of the {@link RedBoxCastEvent#onLiveCastPublished} and {@link RedBoxCastEvent#onLiveCastUnpublished} events which notify that another user started or stopped his own stream.</li>
 * 				<li>Each live cast is subscribed by means of the {@link #subscribeLiveCast} method and a Video object is displayed on the stage to attach the stream to.
 * 				When a live cast is published (a new user joins the conference) or stopped (a user leaves the conference), a notification is received by means of the above mentioned events: the stream is subscribed / unsubscribed and displayed on / removed from the stage.</li>
 * 				<li>The a/v stream for the current user is published by means of the {@link #publishLiveCast} method and an additional Video object showing the user own camera stream is added on the stage; when the current user publishes his own stream, the other users receive the above mentioned events.</li>
 * 				<li>To make the current user leave the conference, the {@link #unpublishLiveCast} method is called. Also changing SmartFoxServer room causes the user to leave the conference and the other users to be notified.</li>
 * 			</ol>
 * 			<hr />
 * 			<i>Live webcast</i>
 * 			In this kind of application, a single user publishes his own live stream and all the other users in the same room subscribe it. The following workflow is suggested.
 * 			<ol>
 * 				<li>The publisher joins the room where the live webcast takes place.</li>
 * 				<li>The a/v stream for the user is published by means of the {@link #publishLiveCast} method and a Video object showing the user own camera stream is added on the stage; when the current user publishes his own stream, the other users already in the room receive the {@link RedBoxCastEvent#onLiveCastPublished} event and the stream can be subscribed (see step 4).</li>
 * 				<li>The webcast spectators join the room and retrieve the list of available streams (one item only if the publisher is already streaming, otherwise the list will be empty).</li>
 * 				<li>If the live webcast is already started, it can be subscribed by means of the {@link #subscribeLiveCast} method; otherwise the {@link RedBoxCastEvent#onLiveCastPublished} event must be waited for before calling this method.</li>
 * 				<li>On all the subscribers clients a Video object is displayed on the stage to attach the stream to.</li>
 * 			</ol>
 * 
 * @version	1.0.0
 * 
 * @author	The gotoAndPlay() Team
 * 			{@link http://www.smartfoxserver.com}
 * 			{@link http://www.gotoandplay.it}
 */
class com.smartfoxserver.redbox.AVCastManager
{
	//--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------
	
	private var CAST_USER_VAR:String = "$RB_castId"
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	
	private var connector:Connector
	private var dispatcher:EventDispatcher
	private var smartFox:SmartFoxClient
	private var red5IpAddress:String
	private var netConn:NetConnection
	private var castList:Array = null
	private var castListByUser:Array
	private var myLiveCast:NetStream
	private var castListRequested:Boolean
	
	//--------------------------------------
	//  GETTERS/SETTERS
	//--------------------------------------
	
	/**
	 * The status of the connection to the Red5 server.
	 * If {@code true}, the connection to Red5 is currently available.
	 */
	public function get isConnected():Boolean
	{
		return netConn.isConnected
	}
	
	//--------------------------------------
	//  COSTRUCTOR
	//--------------------------------------
	
	/**
	 * AVCastManager contructor.
 	 * The RedBox classes make an extensive use of the SmartFoxBits Connector's s event handler in order to communicate with SmartFoxServer.
	 * To achieve this you should place the Connector on a frame before you use RedBox classes on the following frame(s) or to make sure that the Connector is on the lowest layer of the timeline, and set the "Load order" option in the Flash Publish Settings to "Bottom up".
	 * 
	 * @param	sfs:	the SmartFoxClient instance.
	 * @param	red5Ip:	the Red5 server IP address.
	 * @param	debug:	turn on the debug messages (optional, default is {@code false}).
	 * 
	 * @throws	ConnectorNotFoundException if the SmartFoxBits Connector is not placed on the Stage.
	 * @throws	MyUserPropsNotSetException if the <i>SmartFoxClient.myUserId</i> or <i>SmartFoxClient.myUserName</i> properties are not set.
	 * @throws  InvalidParamsException if the {@code red5Ip} is not well formated IP address.
	 *
	 * @example	The following example shows how to instantiate the AVCastManager class.
	 * 			<code>
	 * 			var red5IpAddress:String = "127.0.0.1"
	 * 			
	 * 			var avCastMan:AVCastManager = new AVCastManager(red5IpAddress)
	 * 			</code>
	 * 
	 * see		MyUserPropsNotSetException
	 */
	function AVCastManager(red5Ip:String, debug:Boolean)
	{
		//Gets the SmartFoxBits Connector instance
		connector = _global.__$F$SmartFoxBitsConnector__
		//Shows error if doesn't found an Connector instance
		if(connector == undefined || connector == null)
		{
			throw new ConnectorNotFoundException()
		}
		
		//Creates new event dispatcher instanse
		dispatcher = new EventDispatcher()
		// Set reference to SmartFoxClient instance
		smartFox = connector.connection
		
		// Check if "myUser" properties are set
		if (!myUserIsValid())
			throw new MyUserPropsNotSetException()
		
		//------------------------------
		
		// Initialize properties
		red5IpAddress = red5Ip
		debug = Boolean(debug)
		Logger.enableLog = debug
		netConn = new NetConnection()
		
		// Initialize casts list for the current room
		if (smartFox.getActiveRoom() != null)
			initCastList()
		
		// Add Red5 connection event listener
		netConn.onStatus = Delegate.create(this, onRed5ConnectionStatus)
		
		// Add SmartFoxServer event listeners
		connector.addEventListener(SFSEvent.onJoinRoom, Delegate.create(this, onJoinRoom))
		connector.addEventListener(SFSEvent.onUserVariablesUpdate, Delegate.create(this, onUserVariablesUpdate))
		connector.addEventListener(SFSEvent.onUserLeaveRoom, Delegate.create(this, onUserLeaveRoom))
		connector.addEventListener(SFSEvent.onConnectionLost, Delegate.create(this, onUserDisconnection))
		connector.addEventListener(SFSEvent.onLogout, Delegate.create(this, onUserDisconnection))
		
		// Establish connection to Red5
		initAVConnection()
	}
	
	// -------------------------------------------------------
	// PUBLIC METHODS
	// -------------------------------------------------------
	
	/**
	 * Initialize the audio/video connection.
	 * Calling this method causes the connection to Red5 to be established and the {@link RedBoxCastEvent#onAVConnectionInited} event to be fired in response.
	 * If the connection can't be established, the {@link RedBoxCastEvent#onAVConnectionError} event is fired in response.
	 * <b>NOTE</b>: this method is called automatically when the AVCastManager is instantiated.
	 * 
	 * @throws  InvalidParamsException if the {@code red5IpAddress} is not well formated IP address.
	 *	 
	 * @sends	RedBoxCastEvent#onAVConnectionInited
	 * @sends	RedBoxCastEvent#onAVConnectionError
	 * 
	 * @example	The following example shows how to initialize the Red5 connection for the AVCastManager instance.
	 * 			<code>
	 * 			avCastMan.initAVConnection()
	 * 			</code>
	 * 
	 * @see		#isConnected
	 * @see		RedBoxCastEvent#onAVConnectionInited
	 * @see		RedBoxCastEvent#onAVConnectionError
	 */
	public function initAVConnection():Void
	{
		// Connect to Red5 if a connection is not yet available
		if (!netConn.isConnected)
		{
			if(!netConn.connect("rtmp://" + red5IpAddress + "/" + Constants.RED5_APPLICATION))
			{
				throw new InvalidParamsException("Bad URI")
			}
		}
		else
		{
			// Dispatch "onAVConnectionInited" event
			dispatchAVCastEvent(RedBoxCastEvent.onAVConnectionInited)
			
			Logger.log("Red5 connection initialized")
		}
	}
	
	/**
	 * Destroy the AVCastManager instance.
	 * Calling this method causes the interruption of all the playing streams (if any) and the disconnection from Red5.
	 * This method should always be called before deleting the AVCastManager instance.
	 * 
	 * @example	The following example shows how to destroy the AVCastManager instance.
	 * 			<code>
	 * 			avCastMan.destroy()
	 * 			avCastMan = null
	 * 			</code>
	 */
	public function destroy():Void
	{
		// Remove Red5 connection event listener
		netConn.onStatus = null
		
		// Remove SmartFoxServer event listeners
		connector.removeEventListener(SFSEvent.onJoinRoom, onJoinRoom)
		connector.removeEventListener(SFSEvent.onUserVariablesUpdate, onUserVariablesUpdate)
		connector.removeEventListener(SFSEvent.onUserLeaveRoom, onUserLeaveRoom)
		connector.removeEventListener(SFSEvent.onConnectionLost, onUserDisconnection)
		connector.removeEventListener(SFSEvent.onLogout, onUserDisconnection)
		
		// Unpublish outgoing stream
		unpublishLiveCast()
		
		// Unsubscribe all incoming streams
		unsubscribeAllLiveCasts()
		
		castListRequested = false
		castList = null
		castListByUser = null
		
		// Disconnect from Red5 server
		if (netConn.isConnected)
			netConn.close()
		
		Logger.log("AVCastManager instance destroyed")
	}
	
	/**
	 * Retrieve the list of available live broadcasts for the current room.
	 * The list is populated by the {@link AVCastManager} class as soon as it is instantiated and each time a new room is joined.
	 * When this method is called, the {@link RedBoxCastEvent#onLiveCastPublished} and {@link RedBoxCastEvent#onLiveCastUnpublished} events dispatching is enabled, in order to be notified when users in the current room start/stop streaming.
	 * In order to turn off events notification, the {@link #stopPublishNotification} method should be called.
	 * 
	 * @return	An array of {@link LiveCast} objects.
	 * 
	 * @example	The following example shows how to loop through the list of live casts available for the current room.
	 * 			<code>
	 *          var liveCasts:Array = avCastMan.getAvailableCasts()
	 * 			for(var i in avCastMan.getAvailableCasts())
	 * 			{
	 *              var liveCast:LiveCast = liveCasts[i]
	 * 				// Subscribe live cast
	 * 				var stream:NetStream = avCastMan.subscribeLiveCast(liveCast.id)
	 * 				
	 * 				// Display a/v stream on stage
	 * 				...
	 * 			}
	 * 			</code>
	 * 
	 * @see		LiveCast
	 * @see		#stopPublishNotification
	 */
	public function getAvailableCasts():Array
	{
		castListRequested = true
		
		return castList
	}
	
	/**
	 * Stop receiving live cast published/unpublished events.
	 * 
	 * @see		#getAvailableCasts
	 */
	public function stopPublishNotification():Void
	{
		castListRequested = false
	}
	
	/**
	 * Subscribe a live cast to receive its audio/video stream.
	 * 
	 * @param	castId:	(<b>String</b>) the id of the {@link LiveCast} object to be subscribed.
	 * 
	 * @return	A NetStream object.
	 * 
	 * @throws	NoAVConnectionException if the connection to Red5 is not available.
	 * 
	 * @example	The following example shows how to subscribe a live cast when a publishing notification is received.
	 * 			<code>
	 * 			avCastMan.addEventListener(RedBoxCastEvent.onLiveCastPublished, Delegate.create(this, onLiveCastPublished))
	 * 			
	 * 			// A user publishes his own live cast...
	 * 			
	 * 			function onLiveCastPublished(evt:RedBoxCastEvent):Void
	 * 			{
	 * 				var liveCast:LiveCast = evt.params.liveCast
	 * 				
	 * 				// Subscribe live cast
	 * 				var stream:NetStream = avCastMan.subscribeLiveCast(liveCast.id)
	 * 				
	 * 				// Display a/v stream on stage
	 * 				...
	 * 			}
	 * 			</code>
	 * 
	 * @see		#unsubscribeLiveCast
	 * @see		NoAVConnectionException
	 * @see		NetStream
	 */
	public function subscribeLiveCast(castId:String):NetStream
	{
		// Check Red5 connection availability
		if (!netConn.isConnected)
			throw new NoAVConnectionException(Constants.ERROR_NO_CONNECTION + " [subscribeLiveCast method]")
		
		//------------------------------
		
		if (castList != null && !(castList[castId] == null || castList[castId] == undefined))
		{
			var liveCast:LiveCast = castList[castId]
			
			var stream:NetStream = new NetStream(netConn)
			stream.play(liveCast.id)
			
			liveCast.setStream(stream)
			
			return liveCast.stream
		}
		
		return null
	}
	
	/**
	 * Unsubscribe a live cast to stop receiving its audio/video stream.
	 * <b>NOTE</b>: when a user stops his own stream or leaves the current room / disconnects from SmartFoxServer while his stream is in progress, the {@link AVCastManager} class automatically unsubscribes the live cast before dispatching the {@link RedBoxCastEvent#onLiveCastUnpublished} event.
	 * 
	 * @param	castId:	(<b>String</b>) the id of the {@link LiveCast} object to be unsubscribed.
	 * 
	 * @example	The following example shows how to unsubscribe a live cast.
	 * 			<code>
	 * 			avCastMan.unsubscribeLiveCast(liveCast.id)
	 * 			</code>
	 * 
	 * @see		#subscribeLiveCast
	 */
	public function unsubscribeLiveCast(castId:String):Void
	{
		if (castList != null && !(castList[castId] == null || castList[castId] == undefined))
		{
			var liveCast:LiveCast = castList[castId]
			
			// Close incoming stream
			if (liveCast.stream != null && liveCast.stream != undefined)
			{
				liveCast.stream.close()
				liveCast.setStream(null)
			}
		}
	}
	
	/**
	 * Unsubscribe all currently subscribed live casts.
	 * 
	 * @see		#unsubscribeLiveCast
	 */
	public function unsubscribeAllLiveCasts():Void
	{
		if (castList != null)
		{
			for(var i in castList)
				unsubscribeLiveCast(castList[i].id)
		}
	}
	
	/**
	 * Start broadcasting the current user's live stream.
	 * Calling this method causes the {@link RedBoxCastEvent#onLiveCastPublished} event to be fired on the other users clients.
	 * Audio and video recording mode/quality should be set before calling this method. In order to alter these settings, please refer to the Microphone and Camera classes documentation.
	 * 
	 * @param	enableCamera:		enable video live streaming; default value is {@code true}.
	 * @param	enableMicrophone:	enable audio live streaming; default value is {@code true}.
	 * 
	 * @return	The NetStream object representing the user's outgoing stream.
	 * 
	 * @sends	RedBoxCastEvent#onLiveCastPublished
	 * 
	 * @throws	NoAVConnectionException if the connection to Red5 is not available.
	 * @throws	InvalidParamsException if both <i>enableCamera</i> and <i>enableMicrophone</i> parameters are set to {@code false}.
	 * 
	 * @example	The following example shows how to publish the current user's live stream.
	 * 			<code>
	 * 			avCastman.publishLiveCast(true, true)
	 * 			</code>
	 * 
	 * @see		#unpublishLiveCast
	 * @see		RedBoxCastEvent#onLiveCastPublished
	 * @see		NoAVConnectionException
	 * @see		InvalidParamsException
	 * @see		Camera
	 * @see		Microphone
	 * @see		NetStream
	 */
	public function publishLiveCast(enableCamera:Boolean, enableMicrophone:Boolean):NetStream
	{
		if(enableCamera == undefined)
		{
			enableCamera = true;
		}
		if(enableMicrophone == undefined)
		{
			enableMicrophone = true;
		}
		
		// If cam & mic are both null, why sending this type of request?
		if (!enableCamera && !enableMicrophone)
			throw new InvalidParamsException(Constants.ERROR_INVALID_PARAMS)
		
		// Check Red5 connection availability
		if (!netConn.isConnected)
			throw new NoAVConnectionException(Constants.ERROR_NO_CONNECTION + " [publishLiveCast method]")
		
		//------------------------------
		
		if (myLiveCast == null || myLiveCast == undefined)
		{
			myLiveCast = new NetStream(netConn)
			
			// Attach cam and mic to the stream
			if (enableCamera)
				myLiveCast.attachVideo(Camera.get())
			
			if (enableMicrophone)
				myLiveCast.attachAudio(Microphone.get())
			
			// Generate stream id
			var now:Date = new Date()
			var month:Number = now.getUTCMonth() + 1
			var dateString:String = now.getUTCFullYear().toString() + (month < 10 ? "0" : "") + month.toString() + now.getUTCDate().toString()
			var timeString:String = now.getUTCHours().toString() + now.getUTCMinutes().toString() + now.getUTCSeconds().toString() + now.getUTCMilliseconds().toString()
			var roomId:Number = smartFox.activeRoomId
			var userId:Number = smartFox.myUserId
			
			var liveCastId:String = roomId + "_" + dateString + timeString + "_" + userId
			
			// Publish live stream
			myLiveCast.publish(liveCastId, Constants.BROADCAST_TYPE_LIVE)
			
			// Set user variable
			var userVar:Object = {}
			userVar[CAST_USER_VAR] = liveCastId
			smartFox.setUserVariables(userVar)
			
			Logger.log("User own live cast published; id:", liveCastId)
			
			return myLiveCast
		}
		
		return null
	}
	
	/**
	 * Stop broadcasting the current user's live stream.
	 * Calling this method causes the {@link RedBoxCastEvent#onLiveCastUnpublished} event to be fired on the other users clients.
	 * 
	 * @sends	RedBoxCastEvent#onLiveCastUnpublished
	 * 
	 * @example	The following example shows how to unpublish a live cast.
	 * 			<code>
	 * 			avCastMan.unpublishLiveCast()
	 * 			</code>
	 * 
	 * @see		#publishLiveCast
	 * @see		RedBoxCastEvent#onLiveCastUnpublished
	 */
	public function unpublishLiveCast():Void
	{
		// Stop outgoing stream
		if (myLiveCast != null && myLiveCast != undefined)
		{
			myLiveCast.close()
			myLiveCast = null
			
			// Reset user variable
			if (smartFox.connected())
			{
				var userVar:Object = {}
				userVar[CAST_USER_VAR] = null
				
				smartFox.setUserVariables(userVar)
			}
		}
	}

	/**
	 * Register a listener function in order to receive notification of a RedBox event.
	 * 
	 * If you no longer need an event listener, remove it by calling the removeEventListener method.
	 *
	 * <b>NOTE</b>: use the Delegate.create() method when registering a listener, to keep right scope in your application.
	 *
	 * @usage	To register to an event:
	 *			<code>
     *			import com.smartfoxserver.redbox.events.*
	 *			import mx.utils.Delegate
	 * 
	 *			avCastMan.addEventListener(RedBoxCastEvent.onLiveCastPublished, Delegate.create(this, myListener))
	 * 
	 *			private function myListener(evt:RedBoxCastEvent):Void
	 *			{
	 *				trace("Got the event!")
	 *				trace("Event type: " + evt.type)
	 *				trace("Event target: " + evt.target)
	 *				trace("Additional parameters:")
 	 *
	 *				for (var i in evt.params)
	 *					trace("\t" + i + " -> " + evt.params[i])
	 *			}
	 *			</code>
	 *
	 * @param	type		The event type you want to be notified of.
	 * @param	listener	The listener function in your application that processes the event. This function must accept an RedBoxCastEvent object as its only parameter and must return nothing, as in the example above. 
	 *
	 * @see		#removeEventListener
	 * @see		RedBoxCastEvent
	 */
	public function addEventListener(type:String, listener:Function):Void
	{
		dispatcher.addListener(type, listener)
	}
	
	/**
	 * Remove a listener from the event dispatcher, to stop receiving notification of an event. 
	 *
	 * @usage	To remove a listener:
	 *			<code>
	 *			avCastMan.removeEventListener(RedBoxCastEvent.onLiveCastPublished, myListener)
	 *			</code>
	 *			<b>NOTE</b>: the Delegate.create() is not required to remove a listener.
	 *
	 * @param	type		The event type you registered your listener to.
	 * @param	listener	The listener function to remove.
	 *
	 * @see 	#addEventListener
	 * @see		RedBoxCastEvent
	 */
	public function removeEventListener(type:String, listener:Function):Void
	{
		dispatcher.removeListener(type, listener)
	}
	
	// -------------------------------------------------------
	// SMARTFOXSERVER & RED5 EVENT HANDLERS
	// -------------------------------------------------------
	
	/**
	 * Handle room joined event.
	 * 
	 * @exclude
	 */
	public function onJoinRoom(evt:SFSEvent):Void
	{
		// Unpublish outgoing stream
		unpublishLiveCast()
		
		// Unsubscribe all incoming streams
		unsubscribeAllLiveCasts()
		
		// Re-initialize live casts list
		initCastList()
	}
	
	/**
	 * Handle user variables update event.
	 * 
	 * @exclude
	 */
	public function onUserVariablesUpdate(evt:SFSEvent):Void
	{
		// Check if the proper variable has changed
		if (evt.params.changedVars[CAST_USER_VAR] != null && castList != null)
	    {
	    	var castId:String = evt.params.user.getVariable(CAST_USER_VAR)
	    	var userId:Number = evt.params.user.getId()
	    	var userName:String = evt.params.user.getName()
	    	
	    	if (castId != null)
	    	{
	    		Logger.log("User '" + userName + "' published his live cast:", castId)
	    		
	    		// Add new live cast to list
	    		addLiveCast(castId, userId, userName, true)
	    	}
	    	else
	    	{
	    		Logger.log("User '" + userName + "' unpublished his live cast")
	    		
	    		// Remove live cast from list
	    		removeLiveCast(userId)
	    	}
	    }
	}
	
	/**
	 * Handle user leaving current room.
	 * 
	 * @exclude
	 */
	public function onUserLeaveRoom(evt:SFSEvent):Void
	{
		var userId:Number = evt.params.userId
		
		// Remove live cast from list
	    var removed:Boolean = removeLiveCast(userId)
	    
	    if (removed)
	    	Logger.log("User '" + evt.params.userName + "' left the room; live cast removed")
	}
	
	/**
	 * Handle user logout and disconnection events.
	 * 
	 * @exclude
	 */
	public function onUserDisconnection(evt:SFSEvent):Void
	{
		// Reset AVCastManager instance
		destroy()
	}
	
	/**
	 * Handle Red5 connection status events.
	 * 
	 * @exclude
	 */
	public function onRed5ConnectionStatus(info:Object):Void
	{
		var code:String = info.code
		var level:String = info.level
		
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
				
				// Unpublish outgoing stream
				unpublishLiveCast()
				
				// Unsubscribe all incoming streams
				unsubscribeAllLiveCasts()
				
				// Dispatch connection error event
				var params:Object = {}
				params.errorCode = code
				
				dispatchAVCastEvent(RedBoxCastEvent.onAVConnectionError, params)
				
				break
		}
	}
	
	// -------------------------------------------------------
	// PRIVATE METHODS
	// -------------------------------------------------------
	
	/**
	 * Dispatch AVCastManager events.
	 */
	private function dispatchAVCastEvent(type:String, params:Object):Void
	{
		if(params == undefined)
		{
			params = null
		}
		var event:RedBoxCastEvent = new RedBoxCastEvent(this, type, params)
		dispatcher.dispatchEvent(event)
	}
	
	/**
	 * Check if SmartFoxClient.myUserId and SmartFoxClient.myUserName are set.
	 */
	private function myUserIsValid():Boolean
	{
		return (smartFox.myUserId >= 0 && smartFox.myUserName != undefined && smartFox.myUserName != "" && smartFox.myUserName != null)
	}

	
	/**
	 * Initialize the available live casts list for the current room.
	 */
	private function initCastList():Void
	{
		Logger.log("Initializing Live Casts list for current room...")
		
		castListRequested = false
		
		castList = new Array()
		castListByUser = new Array()
		
		var currRoom:Room = smartFox.getActiveRoom()
		var userList = currRoom.getUserList()
		for (var i in userList)
		{
			var user:User = userList[i]
			// Exclude my own cast
			if (user.getId() != smartFox.myUserId)
			{
				var castId:String = (user.getVariable(CAST_USER_VAR) != undefined ? user.getVariable(CAST_USER_VAR) : "")
				
				if (castId != null && castId != "")
				{
					Logger.log("Live cast found for user", user.getName())
					
					// Add live cast to list
					addLiveCast(castId, user.getId(), user.getName(), false)
				}
			}
		}
	}
	
	/**
	 * Add live cast to list.
	 */
	private function addLiveCast(id:String, userId:Number, userName:String, fireEvent:Boolean):Void
	{
		if(fireEvent == undefined)
		{
			fireEvent = true
		}
		// Create new live cast
		var params:Object = {}
		params.id = id
		params.uId = userId
		params.uName = userName
		
		var liveCast:LiveCast = new LiveCast(params)
		
		// Add cast to list
		castList[id] = liveCast
		castListByUser[userId] = liveCast
		
		// Dispatch event (only if the cast list has already been requested)
   		if (fireEvent && castListRequested)
   		{
    		params = {}
			params.liveCast = liveCast
			
			dispatchAVCastEvent(RedBoxCastEvent.onLiveCastPublished, params)
		}
	}
	
	/**
	 * Remove live cast from list.
	 */
	private function removeLiveCast(userId:Number):Boolean
	{
		if (castListByUser != undefined && castListByUser != null && castListByUser[userId] != undefined && castListByUser[userId] != null)
		{
			var liveCast:LiveCast = castListByUser[userId]
			
			// Unsubscribe live cast
    		unsubscribeLiveCast(liveCast.id)
    		
    		// Dispatch event (only if the cast list has already been requested)
    		if (castListRequested)
    		{
    			var params:Object = {}
				params.liveCast = liveCast
				
				dispatchAVCastEvent(RedBoxCastEvent.onLiveCastUnpublished, params)
    		}
    		
    		// Remove cast from casts list
			delete castList[liveCast.id]
			delete castListByUser[userId]
			
			return true
  		}
  		
  		return false
	}
}
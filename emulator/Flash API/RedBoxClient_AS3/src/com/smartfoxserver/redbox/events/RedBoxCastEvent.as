package com.smartfoxserver.redbox.events
{
	import it.gotoandplay.smartfoxserver.SFSEvent;
	
	/**
	 * RedBoxCastEvent is the class representing all events dispatched by the RedBox's {@link AVCastManager} instance.
	 * The RedBoxCastEvent extends the SFSEvent class, which in turn extends the flash.events.Event class.
	 * SFSEvent also provides a public property called {@code params} of type {@code Object} that can contain any number of parameters.
	 * 
	 * @usage	Please refer to the specific events for usage examples and {@code params} object content.
	 * 
	 * @author	The gotoAndPlay() Team
	 * 			{@link http://www.smartfoxserver.com}
	 * 			{@link http://www.gotoandplay.it}
	 */
	public class RedBoxCastEvent extends SFSEvent
	{
		/**
		 * Dispatched when the connection to Red5 server has been established.
		 * This event is dispatched after the {@link AVCastManager} is instantiated or when the {@link AVCastManager#initAVConnection} method is called.
		 * The connection to Red5 must be available before any method related to a/v streaming is called.
		 * 
		 * No parameters are provided.
		 * 
		 * @example	The following example shows how to handle the "onAVConnectionInited" event.
		 * 			<code>
		 * 			var red5IpAddress:String = "127.0.0.1"
		 * 			var avCastMan:AVCastManager = new AVCastManager(smartFox, red5IpAddress)
		 * 			
		 * 			avCastMan.addEventListener(RedBoxCastEvent.onAVConnectionInited, onAVConnectionInited)
		 * 			
		 * 			function onAVConnectionInited(evt:RedBoxCastEvent):void
		 * 			{
		 * 				trace("Red5 connection established")
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVCastManager#initAVConnection
		 */
		public static const onAVConnectionInited:String = "onAVConnectionInited"
		
		
		/**
		 * Dispatched when the connection to Red5 server can't be established.
		 * This event is dispatched when an error or special condition (like "connection closed") occurred in the flash.net.NetConnection object used internally by the {@link AVCastManager} to handle the connection to Red5.
		 * This kind of error is always related to the Red5 server connection, so you should check if the server is running and reachable.
		 * Also check the Red5 logs or console output for more details.
		 * NOTE: when a connection error occurs, all the playing streams are stopped.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	errorCode:	(<b>String</b>) the description of the error condition; check the "code" property of the NetStatusEvent.info object in the Actionscript 3 Language Reference.
		 * 
		 * @example	The following example shows how to handle a Red5 connection error.
		 * 			<code>
		 * 			avCastMan.addEventListener(RedBoxCastEvent.onAVConnectionError, onAVConnectionError)
		 * 			
		 * 			function onAVConnectionError(evt:RedBoxCastEvent):void
		 * 			{
		 * 				trace("A connection error occurred: " + evt.params.errorCode)
		 * 			}
		 * 			</code>
		 */
		public static const onAVConnectionError:String = "onAVConnectionError"
		
		
		/**
		 * Dispatched when a user in the current room published his own live stream.
		 * This event is fired only if the {@link AVCastManager#getAvailableCasts} method has already been called.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	liveCast:	(<b>LiveCast</b>) the LiveCast instance representing the live stream published.
		 * 
		 * @example	The following example shows how to handle a live cast published event.
		 * 			<code>
		 * 			avCastMan.addEventListener(RedBoxCastEvent.onLiveCastPublished, onLiveCastPublished)
		 * 			
		 * 			// A user publishes his own live cast...
		 * 			
		 * 			function onLiveCastPublished(evt:RedBoxCastEvent):void
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
		 * @see		AVCastManager#subscribeLiveCast
		 * @see		LiveCast
		 */
		 public static const onLiveCastPublished:String = "onLiveCastPublished"
		
		
		/**
		 * Dispatched when a user in the current room stops his own live stream.
		 * This event is fired only if the {@link AVCastManager#getAvailableCasts} method has already been called.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	liveCast:	(<b>LiveCast</b>) the LiveCast instance representing the stopped live stream.
		 * 
		 * @example	The following example shows how to handle a live cast stopped event.
		 * 			<code>
		 * 			avCastMan.addEventListener(RedBoxCastEvent.onLiveCastUnpublished, onLiveCastUnpublished)
		 * 			
		 * 			// A user stops streaming...
		 * 			
		 * 			function onLiveCastUnpublished(evt:RedBoxCastEvent):void
		 * 			{
		 * 				var liveCast:LiveCast = evt.params.liveCast
		 * 				
		 * 				// Remove Video object from stage
		 * 				...
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVCastManager#subscribeLiveCast
		 * @see		LiveCast
		 */
		 public static const onLiveCastUnpublished:String = "onLiveCastUnpublished"
		
		
		//-----------------------------------------------------------------------------------------------------
		
		
		/**
		 *	RedBoxCastEvent class constructor.
		 *
		 *	@param type: the event's type.
		 *	@param params: an object containing the event's parameters.
		 *	
		 *	@exclude
		 */
		public function RedBoxCastEvent(type:String, params:Object = null)
		{
			super(type, params)
		}
	}
}
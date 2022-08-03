package com.smartfoxserver.redbox.events
{
	import it.gotoandplay.smartfoxserver.SFSEvent;
	
	/**
	 * RedBoxClipEvent is the class representing all events dispatched by the RedBox's {@link AVClipManager} instance.
	 * The RedBoxClipEvent extends the SFSEvent class, which in turn extends the flash.events.Event class.
	 * SFSEvent also provides a public property called {@code params} of type {@code Object} that can contain any number of parameters.
	 * 
	 * @usage	Please refer to the specific events for usage examples and {@code params} object content.
	 * 
	 * @author	The gotoAndPlay() Team
	 * 			{@link http://www.smartfoxserver.com}
	 * 			{@link http://www.gotoandplay.it}
	 */
	public class RedBoxClipEvent extends SFSEvent
	{
		/**
		 * Dispatched when the connection to Red5 server has been established.
		 * This event is dispatched after the {@link AVClipManager} is instantiated or when the {@link AVClipManager#initAVConnection} method is called.
		 * The connection to Red5 must be available before any method related to a/v streaming is called.
		 * 
		 * No parameters are provided.
		 * 
		 * @example	The following example shows how to handle the "onAVConnectionInited" event.
		 * 			<code>
		 * 			var red5IpAddress:String = "127.0.0.1"
		 * 			var avClipMan:AVClipManager = new AVClipManager(smartFox, red5IpAddress)
		 * 			
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onAVConnectionInited, onAVConnectionInited)
		 * 			
		 * 			function onAVConnectionInited(evt:RedBoxClipEvent):void
		 * 			{
		 * 				trace("Red5 connection established")
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#initAVConnection
		 */
		public static const onAVConnectionInited:String = "onAVConnectionInited"
		
		
		/**
		 * Dispatched when the connection to Red5 server can't be established.
		 * This event is dispatched when an error or special condition (like "connection closed") occurred in the flash.net.NetConnection object used internally by the {@link AVClipManager} to handle the connection to Red5.
		 * This kind of error is always related to the Red5 server connection, so you should check if the server is running and reachable.
		 * Also check the Red5 logs or console output for more details.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	errorCode:	(<b>String</b>) the description of the error condition; check the "code" property of the NetStatusEvent.info object in the Actionscript 3 Language Reference.
		 * 
		 * @example	The following example shows how to handle a Red5 connection error.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onAVConnectionError, onAVConnectionError)
		 * 			
		 * 			function onAVConnectionError(evt:RedBoxClipEvent):void
		 * 			{
		 * 				trace("A connection error occurred: " + evt.params.errorCode)
		 * 			}
		 * 			</code>
		 */
		public static const onAVConnectionError:String = "onAVConnectionError"
		
		
		/**
		 * Dispatched when clips list is returned, in response to a {@link AVClipManager#getClipList} request.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	clipList:	(<b>Array</b>) a list of {@link Clip} objects for the zone logged in by the user.
		 * 
		 * @example	The following example shows how to request the available clips list.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onClipList, onClipList)
		 * 			
		 * 			avClipMan.getClipList()
		 * 			
		 * 			function onClipList(evt:RedBoxClipEvent):void
		 * 			{
		 * 				for each (var clip:Clip in evt.params.clipList)
		 *				{
		 * 					trace ("Clip id:", clip.id)
		 * 					trace ("Clip submitter:", clip.username)
		 * 					trace ("Clip size:", clip.size + " bytes")
		 * 					trace ("Clip last modified date:", clip.lastModified)
		 * 					trace ("Clip properties:")
		 * 					for (var s:String in clip.properties)
		 * 						trace (s, "-->", clip.properties[s])
		 * 				}
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#getClipList
		 * @see		#onClipAdded
		 * @see		#onClipDeleted
		 * @see		#onClipUpdated
		 * @see		Clip
		 */
		public static const onClipList:String = "onClipList"
		
		
		/**
		 * Dispatched when the recording af an a/v clip starts, in response to a {@link AVClipManager#startClipRecording} request.
		 * 
		 * No parameters are provided.
		 * 
		 * @example	The following example shows how to handle the "onClipRecordingStarted" event.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onClipRecordingStarted, onClipRecordingStarted)
		 * 			
		 * 			avClipMan.startClipRecording(true, true)
		 * 			
		 * 			function onClipRecordingStarted(evt:RedBoxClipEvent):void
		 * 			{
		 * 				// Attach camera output to video instance on stage to see what I'm recording
		 * 				video.attachCamera(Camera.getCamera())
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#startClipRecording
		 */
		public static const onClipRecordingStarted:String = "onClipRecordingStarted"
		
		
		/**
		 * Dispatched when an error occurs in the RedBox server-side extension after submitting an a/v clip.
		 * This event is used when either a recorded or an uploaded clip is submitted.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	error:	(<b>String</b>) the error message sent by the RedBox extension.
		 * 
		 * @example	The following example shows how to handle a clip submission error.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onClipSubmissionFailed, onClipSubmissionFailed)
		 * 			
		 * 			var clipProperties:Object = {}
		 * 			clipProperties.author = "jack"
		 * 			
		 * 			avClipMan.submitRecordedClip(clipProperties)
		 * 			
		 * 			function onClipSubmissionFailed(evt:RedBoxClipEvent):void
		 * 			{
		 * 				trace("An error occurred during clip submission:", evt.params.error)
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#submitRecordedClip
		 */
		public static const onClipSubmissionFailed:String = "onClipSubmissionFailed"
		
		
		/**
		 * Dispatched when a new a/v clip has been submitted by one of the users in the current zone.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	clip:	(<b>Clip</b>) the Clip instance representing the added a/v clip.
		 * 
		 * @example	The following example shows how to handle a clip added event.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onClipAdded, onClipAdded)
		 * 			
		 * 			function onClipAdded(evt:RedBoxClipEvent):void
		 * 			{
		 * 				var clip:Clip = evt.params.clip
		 * 				
		 * 				trace("A new clip was submitted")
		 * 				trace ("Clip id:", clip.id)
		 * 				trace ("Clip submitter:", clip.username)
		 * 				trace ("Clip size:", clip.size + " bytes")
		 * 				trace ("Clip last modified date:", clip.lastModified)
		 * 				trace ("Clip properties:")
		 * 				for (var s:String in clip.properties)
		 * 					trace (s, "-->", clip.properties[s])
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#submitRecordedClip
		 * @see		AVClipManager#submitUploadedClip
		 * @see		Clip
		 */
		public static const onClipAdded:String = "onClipAdded"
		
		
		/**
		 * Dispatched when an a/v clip has been deleted by one of the users in the current zone.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	clip:	(<b>Clip</b>) the Clip instance representing the deleted a/v clip.
		 * 
		 * @example	The following example shows how to handle a clip deletion event.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onClipDeleted, onClipDeleted)
		 * 			
		 * 			avClipMan.deleteClip(clipId)
		 * 			
		 * 			function onClipDeleted(evt:RedBoxClipEvent):void
		 * 			{
		 * 				trace("The clip " + evt.params.clip.id + " was deleted")
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#deleteClip
		 * @see		Clip
		 */
		public static const onClipDeleted:String = "onClipDeleted"
		
		
		/**
		 * Dispatched when the properties of an a/v clip have been updated by one of the users in the current zone.
		 * 
		 * The {@code params} object contains the following parameters.
		 * @param	clip:	(<b>Clip</b>) the Clip instance representing the updated a/v clip.
		 * 
		 * @example	The following example shows how to handle an update in clip properties.
		 * 			<code>
		 * 			avClipMan.addEventListener(RedBoxClipEvent.onClipUpdated, onClipUpdated)
		 * 			
		 * 			var newClipProperties:Object = {}
		 * 			newClipProperties.title = "Batman - The Dark Knight"
		 * 			newClipProperties.author = "Warner Bros."
		 * 			
		 * 			avClipMan.updateClipProperties(clipId, newClipProperties)
		 * 			
		 * 			function onClipUpdated(evt:RedBoxClipEvent):void
		 * 			{
		 * 				trace("Clip properties have been updated")
		 * 				var clip:Clip = evt.params.clip
		 * 				
		 * 				// Update the clip list
		 * 				...
		 * 			}
		 * 			</code>
		 * 
		 * @see		AVClipManager#updateClipProperties
		 * @see		Clip
		 */
		public static const onClipUpdated:String = "onClipUpdated"
		
		
		//-----------------------------------------------------------------------------------------------------
		
		
		/**
		 *	RedBoxClipEvent class constructor.
		 *
		 *	@param type: the event's type.
		 *	@param params: an object containing the event's parameters.
		 *	
		 *	@exclude
		 */
		public function RedBoxClipEvent(type:String, params:Object = null)
		{
			super(type, params)
		}
	}
}
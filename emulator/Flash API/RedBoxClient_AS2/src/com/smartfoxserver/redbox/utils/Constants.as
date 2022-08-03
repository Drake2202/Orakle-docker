/**
 * RedBox constants.
 * 
 * @author	The gotoAndPlay() Team
 * 			{@link http://www.smartfoxserver.com}
 * 			{@link http://www.gotoandplay.it}
 * 
 * @exclude
 */
class com.smartfoxserver.redbox.utils.Constants
{
	public static var RED5_APPLICATION:String = "SFS_RedBox"		// Red5 application to connect to, for streaming purposes
	public static var REDBOX_EXTENSION:String = "__$RedBox$__"	// RedBox server-side extension
	
	public static var EXTENSION_KEY:String = "$RB"		// Required to filter extension responses coming from the RedBox extension only
	public static var CLIP_MANAGER_KEY:String = "clip"	// Required to filter extension responses addressed to the AVClipManager class only
	public static var CHAT_MANAGER_KEY:String = "chat"	// Required to filter extension responses addressed to the AVChatManager class only
	public static var CAST_MANAGER_KEY:String = "cast"	// Required to filter extension responses addressed to the AVCastManager class only
	
	public static var BROADCAST_TYPE_LIVE:String = "live"
	public static var BROADCAST_TYPE_RECORD:String = "record"
	
	public static var ERROR_INVALID_PARAMS:String = "'enableCamera' and 'enableMicrophone' parameters can't be both false"
	public static var ERROR_NO_CONNECTION:String = "Red5 connection not available"
	public static var ERROR_DELETE_NOT_ALLOWED:String = "User not allowed to delete the selected clip"
	public static var ERROR_UPDATE_NOT_ALLOWED:String = "User not allowed to update clip's properties for the selected clip"
	public static var ERROR_BAD_REQUEST:String = "Unknown request type"
	public static var ERROR_SESSION_UNKNOWN:String = "Invalid chat session id: session unknown"
	public static var ERROR_SESSION_WRONG_STATUS:String = "Invalid chat session id: session status not matching"
}

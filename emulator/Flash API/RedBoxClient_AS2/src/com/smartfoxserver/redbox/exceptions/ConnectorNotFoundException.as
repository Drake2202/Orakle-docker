/**
 * A RedBox exception.
 * 
 * @author	The gotoAndPlay() Team
 * 			{@link http://www.smartfoxserver.com}
 * 			{@link http://www.gotoandplay.it}
 */
class com.smartfoxserver.redbox.exceptions.ConnectorNotFoundException extends Error
{
	/**
	 * Thrown when SmartFoxBits Connector is not placed on the Stage.
	 * The RedBox classes make an extensive use of the SmartFoxBits Connector's s event handler in order to communicate with SmartFoxServer.
	 * To achieve this you should place the Connector on a frame before you use RedBox classes on the following frame(s) or to make sure that the Connector is on the lowest layer of the timeline, and set the "Load order" option in the Flash Publish Settings to "Bottom up".
	 * 
	 * @example	The following example shows how to handle the "ConnectorNotFoundException" exception.
	 * 			<code>
	 * 			try
	 * 			{
	 * 				var avClipMan:AVClipManager = new AVChatManager(smartFox, "127.0.0.1", true)
	 * 			}
	 * 			catch (err:ConnectorNotFoundException)
	 * 			{
	 * 				trace (err.message)
	 * 			}
	 * 			</code>
	 */
	public function ConnectorNotFoundException()
	{
		super("The RedBox AS2 API require an instance of the SmartFoxBits Connector to work properly.")
	}
}
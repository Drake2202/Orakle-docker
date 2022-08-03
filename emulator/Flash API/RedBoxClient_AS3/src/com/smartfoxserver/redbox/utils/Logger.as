package com.smartfoxserver.redbox.utils
{
	/**
	 * RedBox internal logger.
	 * 
	 * @author	The gotoAndPlay() Team
	 * 			{@link http://www.smartfoxserver.com}
	 * 			{@link http://www.gotoandplay.it}
	 * 
	 * @exclude
	 */
	public class Logger
	{
		public static var enableLog:Boolean = false
		
		public static function log(...params):void
		{
			if (enableLog)
				trace("[RedBox]", params.join(" "))
		}
	}
}
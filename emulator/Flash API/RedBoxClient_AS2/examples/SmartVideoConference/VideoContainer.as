class VideoContainer extends MovieClip
{
	//The horizontal padding between the video items
	private static var HORIZONTAL_PADDING:Number = 10
	//The vertical padding between the video conference items
	private static var VERTICAL_PADDING:Number = 10
	//The video item width
	private static var VIDEO_ITEM_WIDTH:Number = 140
	//The video item height
	private static var VIDEO_ITEM_HEIGHT:Number = 130
	//Contains list with all casts
	private var castsList:Array = []
	
	/**
	 * Sets the name that is displayed below the current user video
	 */
	public function setMyName(name:String):Void
	{
		this["mc_scrollPane"].content.mc_me.lb_title.text = name
	}
	
	/**
	 * Attachs a camera to the current user video
	 */
	public function addMyCamera(camera:Camera):Void
	{
		this["mc_scrollPane"].content.mc_me.mc_video.attachVideo(camera)
	}
	
	/**
	 * Remove the camera from the current user video.
	 */
	public function removeMyCamera():Void
	{
		this["mc_scrollPane"].content.mc_me.mc_video.attachVideo(null)
		this["mc_scrollPane"].content.mc_me.mc_video.clear()
	}
	
	/**
	 * Adds a new cast to the container
	 */
	public function addLiveCast(userId:Number, castName:String, stream:NetStream):Void
	{
		//Crates a new video item and places it on the stage
		var container:MovieClip = this["mc_scrollPane"].content
		var lastIndex:Number = castsList.push({userId: userId, castName: castName, stream: stream}) - 1
		var mcName:String = "cast" + lastIndex
		var mcX:Number
		var mcY:Number
		if(lastIndex == 0)
		{
			mcX = container["mc_me"]._x + VIDEO_ITEM_WIDTH + HORIZONTAL_PADDING
			mcY = container["mc_me"]._y
		}
		else
		{
			var previousIndex:Number = lastIndex - 1
			var previousMcName:String = "cast" + previousIndex
			mcX = container[previousMcName]._x + VIDEO_ITEM_WIDTH + HORIZONTAL_PADDING
			mcY = container[previousMcName]._y
		}
		if(mcX + VIDEO_ITEM_WIDTH > this["mc_scrollPane"]._width - HORIZONTAL_PADDING)
		{
			mcX = HORIZONTAL_PADDING
			mcY += VIDEO_ITEM_HEIGHT + VERTICAL_PADDING
		}
		container.attachMovie("VideoConferenceItem", mcName, container.getNextHighestDepth(),
							{_x: mcX, _y: mcY, _width: VIDEO_ITEM_WIDTH, _height: VIDEO_ITEM_HEIGHT})
		//Refresh the video items
		refreshCasts()
		//Forces the redraw of the scroll pane that contains the video items.
		this["mc_scrollPane"].invalidate()
	}

	/**
	 * Removes a cast from the container.
	 */
	public function removeLiveCast(userId:Number):Void
	{
		//Finds if a cast with the given id exist
		for(var i:Number = 0; i < castsList.length; i++)
		{
			//Removes a video item and refresh the video items
			if(castsList[i].userId == userId)
			{
				var lastIndex:Number = castsList.length - 1
				var mcName:String = "cast" + lastIndex
				castsList = castsList.slice(0, i).concat(castsList.slice(i + 1))
				var container:MovieClip = this["mc_scrollPane"].content
				container[mcName].mc_video.attachVideo(null)
				container[mcName].mc_video.clear()
				container[mcName].removeMovieClip()
				trace("Removing " + mcName)
				refreshCasts()
				break
			}
		}
	}
	
	/**
	 * Updates the video displays so each of them shows a one cast
	 */
	private function refreshCasts():Void
	{
		var container:MovieClip = this["mc_scrollPane"].content
		for(var i:Number = 0; i < castsList.length; i++)
		{
			var mcName:String = "cast" + i
			container[mcName].mc_video.attachVideo(castsList[i].stream)
			container[mcName].lb_title.text = castsList[i].castName
		}
	}
}
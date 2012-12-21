package  
{
	
	import flash.display.Scene;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	
	/**
	 * ...
	 * @author Huel
	 */
	public class Player extends Sprite
	{
		
		
		public function Player() 
		{
			
	
			var crosshairs:Image = new Image(Assets.getTexture("crosshairs"));
			crosshairs.x = 100;
            crosshairs.y = -60;
			addChild(crosshairs);
		
		}
		
	}

}
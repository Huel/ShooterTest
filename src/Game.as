package  
{
import flash.geom.Point;	
	
import starling.display.Sprite;
import starling.text.TextField;
import starling.textures.Texture;
import starling.display.Image;
import starling.display.BlendMode;
import starling.display.MovieClip;
import starling.core.Starling;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.display.DisplayObject;
import starling.events.Event;
import starling.display.Quad;

	/**
	 * ...
	 * @author Huel
	 */
	public class Game extends Sprite
	{
		
		private const squareCount:uint = 1;
		private var q:Player;
		
		var birdArray:Array = [];
		var player:Player = new Player();
		
		public function Game() 
		{
			
		var bg:Image = new Image(Assets.getTexture("Background"));
            bg.blendMode = BlendMode.NONE;
			bg.scaleX = 2.0;
			bg.scaleY = 2.0;
            addChild(bg);
			
		var bird:Bird = new Bird(200,150);
		addChild(bird);
		 
		while ( birdArray.length < 10)
		{
			
		var bird:Bird = new Bird(Math.random()*500,Math.random()*200);
		addChild(bird);
		
		birdArray.push(bird);
		
		addChild(player);
		
		}

		var textField:TextField = new TextField(400, 50, "Welcome to SHOOT THE FUCKING BIRDS!");
        addChild(textField);
		
		addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			stage.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage, TouchPhase.BEGAN);
			if (touch == null) return;
			
			var pos:Point = touch.getLocation(stage);
			
			var q : Player = new Player();
			q.x = pos.x-100;
			q.y = pos.y+65;
 
			q.pivotX = q.width / 2;
			q.pivotY = q.height / 2;
			addChild(q);
 
 
			if (q.x > stage.stageWidth + 200) removeChild(q);
		
		}

		
	}

}
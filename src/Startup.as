package
{
import flash.display.Sprite;
import flash.events.Event;
import starling.core.Starling;


[SWF(width="800", height="600", frameRate="60", backgroundColor="#ffffff")]


	/**
	 * ...
	 * @author Huel
	 */
	public class Startup extends Sprite
	{
		
		private var mstarling:Starling;
		
		public function Startup()
		{
			mstarling = new Starling(Game, stage);
			mstarling.start();
		}
		
	}

}
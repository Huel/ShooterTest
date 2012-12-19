package  
{
import starling.display.Sprite;
import starling.text.TextField;

	/**
	 * ...
	 * @author Huel
	 */
	public class Game extends Sprite
	{
		
		public function Game() 
		{
		var textField:TextField = new TextField(400, 300, "Welcome to Starling!");
        addChild(textField);
		}
		
	}

}
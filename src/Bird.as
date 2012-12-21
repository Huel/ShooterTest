package  
{
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.BlendMode;
	import starling.display.MovieClip;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Huel
	 */
	public class Bird extends Sprite
	{
		private var mMovie:MovieClip;
		
		public function Bird( x:int, y:int) 
		{
			
			
			var frames:Vector.<Texture> = Assets.createAtlasAnim("Bird",5,5,22).getTextures("Bird");
            mMovie = new MovieClip(frames, 15);
            addChild(mMovie);
			
			mMovie.x = x - int(mMovie.width / 2);
            mMovie.y = y - int(mMovie.height / 2);
			
			Starling.juggler.add(mMovie);
		}
		
	}

}
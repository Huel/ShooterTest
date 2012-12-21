package
{
    import flash.display.Bitmap;
	import flash.geom.Rectangle;
    import flash.media.Sound;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import starling.text.BitmapFont;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Assets
    {
        // If you're developing a game for the Flash Player / browser plugin, you can directly
        // embed all textures directly in this class. This demo, however, provides two sets of
        // textures for different resolutions. That's useful especially for mobile development,
        // where you have to support devices with different resolutions.
        //
        // For that reason, the actual embed statements are in separate files; one for each
        // set of textures. The correct set is chosen depending on the "contentScaleFactor".
        
        // TTF-Fonts
        
        // The 'embedAsCFF'-part IS REQUIRED!!!!
		
        [Embed(source="../assets/fonts/Ubuntu-R.ttf", embedAsCFF="false", fontFamily="Ubuntu")]        
        private static const UbuntuRegular:Class;
		
		[Embed(source = "../assets/textures/background.jpg")]
        public static const Background:Class;
        
		[Embed(source = "../assets/textures/bird.png")]
        public static const Bird:Class;
		
		[Embed(source = "../assets/textures/crosshairs.png")]
        public static const crosshairs:Class;
        
        
        // Texture cache
        
        private static var sContentScaleFactor:int = 1;
        private static var sTextures:Dictionary = new Dictionary();
        private static var sTextureAtlas:TextureAtlas;
        private static var sBitmapFontsLoaded:Boolean;
		
		public static function createAtlasAnim(name:String,w:int,h:int,frames:int):TextureAtlas
		{
			var texture:Texture = getTexture(name);
			
			var atlas:TextureAtlas = new TextureAtlas (texture);
			var hNew:int = texture.height / h;
			var wNew:int = texture.width / w;
		
			
			for (var i:int = 0; i < frames; i++)
			{
				var x:int = i%w;
				var y:int = i/w;
			
				var nameNew:String = String(i);
				while ( nameNew.length < 3 )
				{
					nameNew = "0" + nameNew;
				}
				atlas.addRegion(name+nameNew, new Rectangle(x*wNew,y*hNew, wNew, hNew));
				
				
			}
			
			return atlas;
			
		}
        
        public static function getTexture(name:String):Texture
        {
            if (sTextures[name] == undefined)
            {
                var data:Object = create(name);
                
                if (data is Bitmap)
                    sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false, sContentScaleFactor);
                else if (data is ByteArray)
                    sTextures[name] = Texture.fromAtfData(data as ByteArray, sContentScaleFactor);
            }
            
            return sTextures[name];
        }
		
        
		
        public static function getTextureAtlas():TextureAtlas
        {
            if (sTextureAtlas == null)
            {
                var texture:Texture = getTexture("AtlasTexture");
                var xml:XML = XML(create("AtlasXml"));
                sTextureAtlas = new TextureAtlas(texture, xml);
            }
            
            return sTextureAtlas;
        }
        
        public static function loadBitmapFonts():void
        {
            if (!sBitmapFontsLoaded)
            {
                var texture:Texture = getTexture("DesyrelTexture");
                var xml:XML = XML(create("DesyrelXml"));
                TextField.registerBitmapFont(new BitmapFont(texture, xml));
                sBitmapFontsLoaded = true;
            }
        }
		
		 private static function create(name:String):Object
        {
            var textureClass:Class = Assets;
            return new textureClass[name];
        }
     
    }
}
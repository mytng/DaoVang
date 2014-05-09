package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import utils.Constant;
	import view.GameScreen;
	import view.SelectionScreen;
	import view.ToolBar;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Main extends MovieClip
	{
		var gs:GameScreen;
		var toolBar:ToolBar;
		var myLoader:URLLoader;
		
		public function Main()
		{
			/*var gs:GameScreen = new GameScreen();
			addChild(gs);
			
			var toolBar:ToolBar = new ToolBar(gs);
			//addChild(toolBar);
			gs.addChild(toolBar);
			toolBar.initDefaultTool();
			
			gs.mapContainer.toolBar = toolBar;*/
			
			var ss:SelectionScreen = new SelectionScreen();
			ss.addEventListener(SelectionScreen.NORMAL_THEME_SELECTED, normalThemeSelected);
			ss.addEventListener(SelectionScreen.ICE_THEME_SELECTED, iceThemeSelected);
			ss.addEventListener(SelectionScreen.VOLCANO_THEME_SELECTED, volcanoThemeSelected);
			addChild(ss);
		}
		
		private function onload(e:Event):void 
		{
			var myData:Object = JSON.parse(myLoader.data);
			trace("onload" + myData.tile[0].x + "," + myData.tile[0].y + "," + myData.tile[0].type);
			gs.mapDict = new Dictionary();
			for (var i:int = 0; i < myData.tile.length; i++) 
			{
				//trace("test first");
				var temp:Dictionary = new Dictionary;
				temp[myData.tile[i].y] = myData.tile[i].type;
				gs.mapDict[myData.tile[i].x] = temp;
			}
			
			/*for (var k:Object in gs.mapDict) {
				var temp:Dictionary = gs.mapDict[k];
				//trace(k + "," + temp);
			}*/
			
			//for each (var value:Dictionary in gs.mapDict) {
				//for each (var v2:Number in value)
				//{
					//trace(v2);
				//}
			//}
			
			//TEMP
			//gs.initMap();
		}
		
		private function volcanoThemeSelected(e:Event):void 
		{
			initGame(Constant.VOLCANO_THEME);
		}
		
		private function iceThemeSelected(e:Event):void 
		{
			initGame(Constant.ICE_THEME);
		}
		
		private function normalThemeSelected(e:Event):void 
		{
			initGame(Constant.NORMAL_THEME);
		}
		
		private function initGame(theme:Number):void 
		{
			gs = new GameScreen();
			addChild(gs);
			
			toolBar = new ToolBar(gs);
			//addChild(toolBar);
			gs.addChild(toolBar);
			toolBar.x = 400;
			toolBar.y = 10;
			toolBar.initDefaultTool();
			
			gs.mapContainer.toolBar = toolBar
			gs.mapContainer.currentTheme = theme; 
			
			//loadJSONMap();
			gs.initMap();
		}
		
		private function loadJSONMap():void 
		{
			var myRequest:URLRequest = new URLRequest("testJSON.txt");
			myLoader = new URLLoader();
			myLoader.addEventListener(Event.COMPLETE, onload);
			myLoader.load(myRequest);
		}
	}
}
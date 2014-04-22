package
{
	import flash.display.MovieClip;
	import utils.Constant;
	import view.GameScreen;
	import view.ToolBar;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Main extends MovieClip
	{
		public function Main()
		{
			var gs:GameScreen = new GameScreen();
			addChild(gs);
			
			var toolBar:ToolBar = new ToolBar();
			addChild(toolBar);
			
			gs.mapContainer.toolBar = toolBar;
			
			//toolBar.x = Constant.SCREEN_WIDTH * Constant.TILE_WIDTH - toolBar.width - 30;
			//toolBar.y = 20;
		}
	}
}
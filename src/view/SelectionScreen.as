package view 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import utils.CustomEvent;
	/**
	 * ...
	 * @author Tung
	 */
	public class SelectionScreen extends MovieClip
	{
		private var normalThemeButton:ThemeButton;
		private var iceThemeButton:ThemeButton;
		private var volcanoThemeButton:ThemeButton;
		
		public static const NORMAL_THEME_SELECTED:String = "normal.theme.selected";
		public static const ICE_THEME_SELECTED:String = "ice.theme.selected";
		public static const VOLCANO_THEME_SELECTED:String = "volcano.theme.selected";
		
		public function SelectionScreen() 
		{
			initThemeButtons();
		}
		
		private function initThemeButtons():void 
		{
			normalThemeButton = new NormalThemeButton();
			normalThemeButton.x = 100;
			normalThemeButton.y = 400;
			normalThemeButton.addEventListener(MouseEvent.CLICK, normalThemeButtonClicked);
			addChild(normalThemeButton);
			
			iceThemeButton = new IceThemeButton();
			iceThemeButton.x = normalThemeButton.x + normalThemeButton.width + 50;
			iceThemeButton.y = 400;
			iceThemeButton.addEventListener(MouseEvent.CLICK, iceThemeButtonClicked);
			addChild(iceThemeButton);
			
			volcanoThemeButton = new VolcanoThemeButton();
			volcanoThemeButton.x = iceThemeButton.x + iceThemeButton.width + 50;
			volcanoThemeButton.y = 400;
			volcanoThemeButton.addEventListener(MouseEvent.CLICK, volcanoThemeButtonClicked);
			addChild(volcanoThemeButton);
		}
		
		private function volcanoThemeButtonClicked(e:MouseEvent):void 
		{
			dispatchEvent(new CustomEvent(VOLCANO_THEME_SELECTED, false, false));
		}
		
		private function iceThemeButtonClicked(e:MouseEvent):void 
		{
			dispatchEvent(new CustomEvent(ICE_THEME_SELECTED, false, false));
		}
		
		private function normalThemeButtonClicked(e:MouseEvent):void 
		{
			dispatchEvent(new CustomEvent(NORMAL_THEME_SELECTED, false, false));
		}
		
	}

}
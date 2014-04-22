package view 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import utils.Constant;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class ToolBar extends MovieClip 
	{
		//công cụ đang được chọn
		public var currentTool:Tool;
		
		var toolArray:Array;
		//var toolbar_mc:MovieClip;
		
		public function ToolBar() 
		{
			//toolbar_mc = new MovieClip();
			//addChild(toolbar_mc);
			
			initToolbar();
			initDefaultTool();
			
			addEventListener(Event.ADDED_TO_STAGE, initEvent);
		}
		
		private function initEvent(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, initEvent);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, updateToolPosition);
		}
		
		private function updateToolPosition(e:MouseEvent):void 
		{
			if (currentTool) {
				currentTool.x = mouseX;
				currentTool.y = mouseY;
			}
		}
			
		//khởi tạo tool lúc bắt đầu chơi
		private function initDefaultTool():void
		{
			currentTool = new SmallShovel();
			addChild(currentTool);
			currentTool.x = mouseX;
			currentTool.y = mouseY;
			currentTool.type = Constant.SMALL_SHOVEL;
			currentTool.mouseEnabled = false;
			currentTool.enabled = false;
			//Mouse.hide();
		}
		
		//thêm các công cụ
		private function initToolbar():void
		{
			var toolBoxWidth:Number;
			var toolBoxHeight:Number;
			toolArray = new Array();
			
			for (var i:int = 0; i < 4; i++) 
			{
				var toolBox:ToolBox = new ToolBox();
				addChild(toolBox);
				toolBox.x = 60 * i;
				toolBox.y = 0;
				toolBox.name = i.toString();
				toolBox.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
				toolBox.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
				toolBox.addEventListener(MouseEvent.CLICK, onClickTools);
				toolArray.push(toolBox);
			}
			
			//toolBar.x = Constant.SCREEN_WIDTH * Constant.TILE_WIDTH - toolBar.width - 30;
			//toolBar.y = 20;
			
			toolBoxWidth = toolArray[0].width;
			toolBoxHeight = toolArray[0].height;
			
			var smallBomb:SmallBomb = new SmallBomb();
			smallBomb.remains = 20;
			toolArray[3].addChild(smallBomb);
			toolArray[3].txtNumberLeft.visible = false;
			toolArray[3].txtNumberRight.text = "x" + smallBomb.remains;
			smallBomb.x = toolBoxWidth / 2-5;
			smallBomb.y = toolBoxHeight / 2+5;
			
			var pickAxe:PickAxe = new PickAxe();
			pickAxe.remains = 20;
			toolArray[2].addChild(pickAxe);
			toolArray[2].txtNumberRight.visible = false;
			toolArray[2].txtNumberLeft.text = "x" + pickAxe.remains;
			pickAxe.x = toolBoxWidth / 2-20;
			pickAxe.y = toolBoxHeight / 2 - 5;
			
			var shovel:Shovel = new Shovel();
			shovel.remains = 20;
			toolArray[1].addChild(shovel);
			toolArray[1].txtNumberRight.visible = false;
			toolArray[1].txtNumberLeft.text = "x" + shovel.remains;
			shovel.x = shovel.width+3;
			shovel.y = shovel.height + 3;
			
			var smallShovel:SmallShovel = new SmallShovel();
			smallShovel.remains = 20;
			toolArray[0].addChild(smallShovel);
			toolArray[0].txtNumberRight.visible = false;
			toolArray[0].txtNumberLeft.text = "x" + smallShovel.remains;
			smallShovel.x = smallShovel.width + 7;
			smallShovel.y = smallShovel.height + 3;
			
			x = Constant.SCREEN_WIDTH * Constant.TILE_WIDTH - width - 30;
			y = 20;
		}
		
		private function onClickTools(e:MouseEvent):void 
		{
			removeChild(currentTool);
			switch(int(e.currentTarget.name))
			{
				case Constant.SMALL_BOMB:
					currentTool = new SmallBomb();
					currentTool.type = Constant.SMALL_BOMB;
					break;
				case Constant.PICK_AXE:
					currentTool = new PickAxe();
					currentTool.type = Constant.PICK_AXE;
					break;
				case Constant.SHOVEL:
					currentTool = new Shovel();
					currentTool.type = Constant.SHOVEL;
					break;
				case Constant.SMALL_SHOVEL:
					currentTool = new SmallShovel();
					currentTool.type = Constant.SMALL_SHOVEL;
					break;
			}
			addChild(currentTool);
			currentTool.x = mouseX;
			currentTool.y = mouseY;
			currentTool.mouseEnabled = false;
		}
		
		private function mouseOutTools(e:MouseEvent):void 
		{
			e.currentTarget.gotoAndStop(1);
		}
		
		private function mouseOverTools(e:MouseEvent):void 
		{
			//if (!isDraggin)
			//{
				e.currentTarget.gotoAndStop(2);
			//}
		}
	}

}
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
		
		private var gameScreen:GameScreen;
		var toolArray:Array;
		//var toolbar_mc:MovieClip;
		
		public function ToolBar(gs:GameScreen) 
		{
			//toolbar_mc = new MovieClip();
			//addChild(toolbar_mc);
			gameScreen = gs;
			
			initToolbar();
			//initDefaultTool();
			
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
				currentTool.x = mouseX + x;
				currentTool.y = mouseY + y;
			}
		}
			
		//khởi tạo tool lúc bắt đầu chơi
		public function initDefaultTool():void
		{
			//currentTool = new SmallShovel();
			currentTool = new SmallBomb();
			//addChild(currentTool);
			gameScreen.addChild(currentTool);
			//mouseChildren = false;
			currentTool.x = mouseX + x;
			currentTool.y = mouseY + y;
			//currentTool.type = Constant.SMALL_SHOVEL;
			currentTool.type = Constant.SMALL_BOMB;
			currentTool.mouseEnabled = false;
			currentTool.enabled = false;
			currentTool.mouseChildren = false;
			//Mouse.hide();
		}
		
		//thêm các công cụ
		private function initToolbar():void
		{
			var toolBoxWidth:Number;
			var toolBoxHeight:Number;
			toolArray = new Array();
			
			/*for (var i:int = 0; i < 4; i++) 
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
			}*/
			
			var smallShovel:SmallShovelTool = new SmallShovelTool();
			addChild(smallShovel);
			smallShovel.x = 50;
			smallShovel.y = 0;
			smallShovel.name = Constant.SMALL_SHOVEL.toString();
			smallShovel.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
			smallShovel.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
			smallShovel.addEventListener(MouseEvent.CLICK, onClickTools);
			toolArray.push(smallShovel);
			
			var shovel:ShovelTool = new ShovelTool();
			addChild(shovel);
			shovel.x = 100;
			shovel.y = 0;
			shovel.name = Constant.SHOVEL.toString();
			shovel.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
			shovel.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
			shovel.addEventListener(MouseEvent.CLICK, onClickTools);
			toolArray.push(shovel);
			
			var pickAxeTool:PickAxeTool = new PickAxeTool();
			addChild(pickAxeTool);
			pickAxeTool.x = 150;
			pickAxeTool.y = 0;
			pickAxeTool.name = Constant.PICK_AXE.toString();
			pickAxeTool.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
			pickAxeTool.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
			pickAxeTool.addEventListener(MouseEvent.CLICK, onClickTools);
			toolArray.push(pickAxeTool);
			
			var smallBomb:SmallBombTool = new SmallBombTool();
			addChild(smallBomb);
			smallBomb.x = 200;
			smallBomb.y = 0;
			smallBomb.name = Constant.SMALL_BOMB.toString();
			smallBomb.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
			smallBomb.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
			smallBomb.addEventListener(MouseEvent.CLICK, onClickTools);
			toolArray.push(smallBomb);
			
			var bigBomb:BigBombTool = new BigBombTool();
			addChild(bigBomb);
			bigBomb.x = 250;
			bigBomb.y = 0;
			bigBomb.name = Constant.BIG_BOMB.toString();
			bigBomb.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
			bigBomb.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
			bigBomb.addEventListener(MouseEvent.CLICK, onClickTools);
			toolArray.push(bigBomb);
			
			//toolBar.x = Constant.SCREEN_WIDTH * Constant.TILE_WIDTH - toolBar.width - 30;
			//toolBar.y = 20;
			
			toolBoxWidth = toolArray[0].width;
			toolBoxHeight = toolArray[0].height;
			
			/*var smallBomb:SmallBomb = new SmallBomb();
			smallBomb.remains = 20;
			toolArray[3].addChild(smallBomb);
			smallBomb.x = toolBoxWidth / 2-5;
			smallBomb.y = toolBoxHeight / 2+5;
			
			var pickAxe:PickAxe = new PickAxe();
			pickAxe.remains = 20;
			toolArray[2].addChild(pickAxe);
			pickAxe.x = toolBoxWidth / 2-20;
			pickAxe.y = toolBoxHeight / 2 - 5;
			
			var shovel:Shovel = new Shovel();
			shovel.remains = 20;
			toolArray[1].addChild(shovel);
			shovel.x = shovel.width+3;
			shovel.y = shovel.height + 3;
			
			var smallShovel:SmallShovel = new SmallShovel();
			smallShovel.remains = 20;
			toolArray[0].addChild(smallShovel);
			smallShovel.x = smallShovel.width + 7;
			smallShovel.y = smallShovel.height + 3;*/
			
			x = Constant.SCREEN_WIDTH * Constant.TILE_WIDTH - width - 60;
			y = 20;
		}
		
		private function onClickTools(e:MouseEvent):void 
		{
			gameScreen.removeChild(currentTool);
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
				case Constant.BIG_BOMB:
					currentTool = new BigBomb();
					currentTool.type = Constant.BIG_BOMB;
					break;
			}
			//addChild(currentTool);
			gameScreen.addChild(currentTool);
			currentTool.x = mouseX + x;
			currentTool.y = mouseY + y;
			currentTool.mouseEnabled = false;
			currentTool.enabled = false;
			currentTool.mouseChildren = false;
		}
		
		private function mouseOutTools(e:MouseEvent):void 
		{
			e.currentTarget.gotoAndStop(1);
		}
		
		private function mouseOverTools(e:MouseEvent):void 
		{
			//if (!isDraggin)
			e.currentTarget.gotoAndStop(2);
		}
	}

}
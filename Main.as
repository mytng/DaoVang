package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Main extends MovieClip
	{
		var mapArr:Array = 
		[ [42,52,12,22,32,42,52,12,22,32,42,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,42],
		  [42,52,12,22,32,42,52,12,22,32,42,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,42],
		  [42,50,12,22,32,42,52,12,22,32,42,52,52,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,42],
		  [42,50,12,22,32,42,52,12,22,32,42,52,52,22,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,32],
		  [42,52,10,22,32,42,52,12,22,32,42,52,52,12,52,52,52,52,32,32,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,22],
		  [40,50,10,22,32,42,52,12,22,32,42,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,12],
		  [40,50,10,22,32,42,52,12,22,32,42,52,52,42,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,52],
		  [42,50,12,22,32,42,52,12,22,32,42,52,52,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,42],
		  [42,50,12,22,32,42,52,12,22,32,42,52,52,22,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,12,22,32,42,50,51,32],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,12,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,40,11,22],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,30,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,42,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,20,11,52],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,10,11,42],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,22,52,52,52,22,22,22,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,22,32,50,11,32],
		  [32,52,52,52,52,52,52,52,52,52,52,52,52,12,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,40,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,30,11,12],
		  [32,30,52,52,52,52,52,52,32,32,52,52,52,42,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,20,11,12],
		  [32,32,20,52,52,52,52,52,52,52,52,52,52,32,52,52,52,52,32,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,10,11,12],
		  [30,50,30,32,32,32,52,52,52,52,52,52,52,22,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,50,11,12],
		  [20,40,40,52,52,52,32,52,52,52,52,52,52,12,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,40,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,30,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,42,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,20,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,10,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,22,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,50,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,12,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,40,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,30,11,12],
		  [32,20,32,52,52,52,52,52,52,52,52,52,52,42,52,52,52,22,22,22,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,22,32,20,11,12],
		  [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,32,32,10,11,12] ];
		
		// chiều dài và chiều rộng của map
		var mapW:Number = mapArr[0].length;
		var mapH:Number = mapArr.length;
		
		// chiều dài và chiều rộng của map được hiển thị
		var screenW:Number = 25;
		var screenH:Number = 15;
		
		// chỉ số index hiện tại của map được hiển thị
		var curMapArrX:Number = 10;
		var curMapArrY:Number = 0;
		
		// chỉ số index X của map lúc bắt đầu
		var initArrX:Number = 10;
		
		// vùng map được vẽ
		const SPACE_HEIGHT:Number = 2; //SPACE_HEIGHT chiều cao của không gian trên mặt đất tính theo ô
		var visAreaX:Number = screenW;
		var visAreaY:Number = screenH - SPACE_HEIGHT; 
		
		// chiều rộng và chiều cao của 1 ô đất theo pixel
		var tileW:Number = 40;
		var tileH:Number = 40;
		
		// vị trí của movieclip chứa map
		var startX:Number = 0;
		var startY:Number = SPACE_HEIGHT * tileW;
		
		// biến kiểm tra khoảng scroll
		var majorX:Number = 0;
		var majorY:Number = 0;
		
		// movieclip chứa map
		var mapContainer:MovieClip;
		
		//biến kiểm tra đang rê chuột hay không
		var isDraggin:Boolean = false;
		
		//khoảng cách từ tọa độ chuốt tới vị trí của movieclip chứa map
		var diffX:Number;
		var diffY:Number;
		
		//công cụ đang được chọn
		var currentTool:MovieClip;
		var toolArray:Array;
		
		public function Main()
		{
			mapContainer = new Empty();
			addChild(mapContainer);
			mapContainer.x = 0;
			mapContainer.y = 0;
			
			buildMap();
			addTool();
			initDefaultTool();
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			isDraggin = false;
			//majorX = 0;
			//majorY = 0;
			//prevMousePoint = null;
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			isDraggin = true;
			diffX = e.stageX - mapContainer.x;
			diffY = e.stageY - mapContainer.y;
			//prevMousePoint = new Point(e.stageX, e.stageY);
		}
		
		private function onMouseMove(e:MouseEvent):void
		{
			currentTool.x = mouseX;
			currentTool.y = mouseY;
			
			if (isDraggin)
			{
				//vị trí của map container khi bắt đầu di chuột
				var preMapPosX:Number = mapContainer.x;
				var preMapPosY:Number = mapContainer.y;
				
				mapContainer.x = e.stageX - diffX;
				mapContainer.y = e.stageY - diffY;
				
				if (mapContainer.y > 0)
				{
					mapContainer.y = 0;
					diffY = e.stageY - mapContainer.y;
				}
				if (mapContainer.x > initArrX * tileW)
				{
					mapContainer.x = preMapPosX;
					diffX = e.stageX - mapContainer.x;
					//movedX = 0;
					majorX = 0;
				}
				if (mapContainer.x < -(mapW - initArrX - visAreaX) * tileW)
				{
					mapContainer.x = preMapPosX;
					diffX = e.stageX - mapContainer.x;
					//movedX = 0;
					majorX = -tileW;
				}
				if (mapContainer.y < -(mapH - visAreaY) * tileH)
				{
					mapContainer.y = preMapPosY;
					diffY = e.stageY - mapContainer.y;
					majorY = -tileH;
				}
				
				var movedX:Number = mapContainer.x - preMapPosX;
				var movedY:Number = mapContainer.y - preMapPosY;
				majorX += movedX;
				majorY += movedY;
				//move right
				if (curMapArrX > 0 && movedX > 0)
				{
					if (majorX >= 0)
					{
						--curMapArrX;
						for (var lasti:Number = curMapArrY; lasti < (SPACE_HEIGHT + curMapArrY + visAreaY + 1); ++lasti)
						{
							for (var lastj:Number = curMapArrX; lastj < (curMapArrX + 1); ++lastj)
							{
								var tempTile:MovieClip = createTile(int(mapArr[lasti][lastj] / 10));
								tempTile.name = "t_" + lasti + "_" + (lastj);
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - initArrX) * tileW + startX;
								tempTile.y = lasti * tileH + startY;

								mapContainer.removeChild(mapContainer.getChildByName("t_" + lasti + "_" + (lastj + visAreaX + 1)));
							}
						}
						majorX -= tileW;
					}
				}
				//move left
				if ((visAreaX + 1 + curMapArrX + 1) <= mapW && movedX < 0)
				{
					if (majorX <= -tileW)
					{
						for (var lasti = curMapArrY; lasti < (visAreaY + 1 + curMapArrY+2); ++lasti)
						{
							for (var lastj = curMapArrX + visAreaX + 1; lastj < (visAreaX + 1 + curMapArrX + 1); ++lastj)
							{
								var tempTile:MovieClip = createTile(int(mapArr[lasti][lastj] / 10));
								tempTile.name = "t_" + lasti + "_" + lastj;
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - initArrX) * tileW + startX;
								tempTile.y = lasti * tileH + startY;
								
								mapContainer.removeChild(mapContainer.getChildByName("t_" + lasti + "_" + (lastj - visAreaX - 1)));
							}
						}
						++curMapArrX;
						majorX += tileW;
						
					}
				}
				//move down
				if (visAreaY + 1 + curMapArrY +SPACE_HEIGHT<= mapH && movedY < 0)
				{
					if (majorY <= -tileH && mapContainer.y < - (1+SPACE_HEIGHT)*tileW)
					{
						for (var lasti = visAreaY + curMapArrY+1+2; lasti < (visAreaY + 1+curMapArrY+1+2); ++lasti)
						{
							for (var lastj = curMapArrX; lastj < (visAreaX + 1 + curMapArrX); ++lastj)
							{
								var tempTile:MovieClip = createTile(int(mapArr[lasti][lastj] / 10));
								tempTile.name = "t_" + lasti + "_" + lastj;
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - curMapArrX) * tileW + startX-(initArrX-curMapArrX)*tileW;
								tempTile.y = lasti * tileH + startY;
								
								mapContainer.removeChild(mapContainer.getChildByName("t_" + (lasti - visAreaY - 1-2) + "_" + (lastj)));
							}
						}
						++curMapArrY;
						majorY += tileH;
					}
					if (majorY <= -tileH && mapContainer.y > -(1+SPACE_HEIGHT)*tileW)
					{
						majorY += tileH;
					}
				}
				//move up
				if (curMapArrY > 0 && movedY > 0)
				{
					if (majorY >= 0)
					{
						--curMapArrY;
						for (var lasti:Number = curMapArrY; lasti < (curMapArrY + 1); ++lasti)
						{
							for (var lastj:Number = curMapArrX; lastj < (curMapArrX + visAreaX + 1); ++lastj)
							{
								var tempTile:MovieClip = createTile(int(mapArr[lasti][lastj] / 10));
								tempTile.name = "t_" + lasti + "_" + (lastj);
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - curMapArrX) * tileW + startX-(initArrX-curMapArrX)*tileW;
								tempTile.y = lasti * tileH + startY;
								
								mapContainer.removeChild(mapContainer.getChildByName("t_" + (lasti + visAreaY + 1+2) + "_" + (lastj)));
							}
						}
						majorY -= tileW;
					}
				}
			}
		}
		
		// vẽ map
		private function buildMap():void
		{
			for (var i:Number = 0; i < visAreaY + 1 + SPACE_HEIGHT; ++i) //+ 1 hàng tile được vẽ trước ở dưới
			{
				for (var j:Number = curMapArrX; j < visAreaX + curMapArrX + 1; ++j)  //+ 1 cột tile được vẽ trước ở bên phải
				{
					var tempTile:MovieClip = createTile(int(mapArr[i][j] / 10));  
					tempTile.name = "t_" + i + "_" + j;
					mapContainer.addChild(tempTile);
					tempTile.x = (j - curMapArrX) * tileW + startX;
					tempTile.y = i * tileH + startY;
				}
			}
		}
		
		// tạo tile theo tham số tương ứng từ mảng 2 chiều
		private function createTile(i:Number):MovieClip
		{
			var tile:MovieClip;
			switch (i)
			{
				case 1: 
					tile = new Tile1();
					break;
				case 2: 
					tile = new Tile2();
					break;
				case 3: 
					tile = new Tile3();
					break;
				case 4: 
					tile = new Tile4();
					break;
				case 5: 
					tile = new Tile5();
					break;
			}
			return tile;
		}
	
		private function initDefaultTool():void
		{
			currentTool = new SmallShovel();
			addChild(currentTool);
			currentTool.x = mouseX;
			currentTool.y = mouseY;
			currentTool.mouseEnabled = false;
			Mouse.hide();
		}
		
		//thêm các công cụ
		private function addTool():void
		{
			var toolBoxWidth:Number;
			var toolBoxHeight:Number;
			toolArray = new Array();
			for (var i:int = 0; i < 4; i++) 
			{
				var toolBox:ToolBox = new ToolBox();
				addChild(toolBox);
				toolBox.x = screenW * tileW - 60 * i - toolBox.width - 30;
				toolBox.y = 20;
				toolBox.name = i.toString();
				toolBox.addEventListener(MouseEvent.MOUSE_OVER, mouseOverTools);
				toolBox.addEventListener(MouseEvent.MOUSE_OUT, mouseOutTools);
				toolBox.addEventListener(MouseEvent.CLICK, onClickTools);
				toolArray.push(toolBox);
			}
			toolBoxWidth = toolArray[0].width;
			toolBoxHeight = toolArray[0].height;
			
			var smallBomb:SmallBomb = new SmallBomb();
			toolArray[0].addChild(smallBomb);
			smallBomb.x = toolBoxWidth / 2-5;
			smallBomb.y = toolBoxHeight / 2+5;
			
			var pickAxe:PickAxe = new PickAxe();
			toolArray[1].addChild(pickAxe);
			pickAxe.x = toolBoxWidth / 2-20;
			pickAxe.y = toolBoxHeight / 2 - 5;
			
			var shovel:Shovel = new Shovel();
			toolArray[2].addChild(shovel);
			shovel.x = shovel.width+3;
			shovel.y = shovel.height + 3;
			
			var smallShovel:SmallShovel = new SmallShovel();
			toolArray[3].addChild(smallShovel);
			smallShovel.x = smallShovel.width + 7;
			smallShovel.y = smallShovel.height + 3;
		}
		
		private function onClickTools(e:MouseEvent):void 
		{
			removeChild(currentTool);
			switch(e.currentTarget.name)
			{
				case "0":
					currentTool = new SmallBomb();
					break;
				case "1":
					currentTool = new PickAxe();
					break;
				case "2":
					currentTool = new Shovel();
					break;
				case "3":
					currentTool = new SmallShovel();
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
			if (!isDraggin)
			{
				e.currentTarget.gotoAndStop(2);
			}
		}
	}

}
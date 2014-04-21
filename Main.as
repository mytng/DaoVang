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
		//số hàng trăm là loại của ô đất, số hàng chục là phần thưởng có thể đào được, số hàng đơn vị chỉ định ô đất đã đc nhìn thấy hay chưa
		public var mapArr:Array = 
		[ [420,520,120,220,320,420,520,120,220,320,420,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,520,120,220,320,420,500,510,420],
		  [421,321,121,221,321,421,521,121,221,321,421,521,521,521,521,521,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,421],
		  [421,501,121,221,321,421,521,121,221,321,421,521,521,321,521,521,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,421],
		  [421,501,121,221,321,421,521,121,221,321,421,521,521,221,321,521,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,321],
		  [421,521,101,221,321,421,521,121,221,321,421,521,521,121,521,521,621,521,321,321,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,221],
		  [401,501,101,221,321,421,521,121,221,321,421,521,521,521,521,521,621,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,121],
		  [401,501,101,221,321,421,521,121,221,321,421,521,521,421,521,521,521,621,521,621,621,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,521],
		  [421,501,121,221,321,421,521,121,221,321,421,521,521,321,521,521,521,621,521,621,621,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,421],
		  [421,501,121,221,321,421,521,121,221,321,421,521,521,221,521,521,521,621,621,621,621,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,321],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,121,521,521,521,521,521,621,621,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,401,111,221],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,301,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,421,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,201,111,521],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,101,111,421],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,221,521,521,521,221,221,221,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,221,321,501,111,321],
		  [321,521,521,521,521,521,521,521,521,521,521,521,521,121,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,401,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,301,111,121],
		  [321,301,521,521,521,521,521,521,321,321,521,521,521,421,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,201,111,121],
		  [321,321,201,521,521,521,521,521,521,521,521,521,521,321,521,521,521,521,321,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,101,111,121],
		  [301,501,301,321,321,321,521,521,521,521,521,521,521,221,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,501,111,121],
		  [201,401,401,521,521,521,321,521,521,521,521,521,521,121,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,401,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,521,521,521,151,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,301,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,421,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,201,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,101,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,221,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,501,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,121,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,401,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,301,111,121],
		  [321,201,321,521,521,521,521,521,521,521,521,521,521,421,521,521,521,221,221,221,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,221,321,201,111,121],
		  [321,321,321,321,321,321,321,321,321,321,321,321,321,321,321,321,321,321,321,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,321,321,101,111,121] ];
		
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
		var tileW:Number = Constant.TILE_WIDTH;
		var tileH:Number = Constant.TILE_HEIGHT;
		
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
		public var currentTool:Tool;

		var toolArray:Array;
		
		public function Main()
		{
			mapContainer = new Container();
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
								var tempTile:MovieClip;
								if (mapArr[lasti][lastj] % 10 == 1)
								{
									tempTile = new Fog();
									Fog(tempTile).i = lasti;
									Fog(tempTile).j = lastj;
								}
								else
								{
									tempTile = createTile(int(mapArr[lasti][lastj] / 100));  
								}
								tempTile.name = "t_" + lasti + "_" + (lastj);
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - initArrX) * tileW + startX;
								tempTile.y = lasti * tileH + startY;
								Tile(tempTile).i = lasti;
								Tile(tempTile).j = lastj;

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
								var tempTile:MovieClip;
								if (mapArr[lasti][lastj] % 10 == 1)
								{
									tempTile = new Fog();
									Fog(tempTile).i = lasti;
									Fog(tempTile).j = lastj;
								}
								else
								{
									tempTile = createTile(int(mapArr[lasti][lastj] / 100));  
								}
								tempTile.name = "t_" + lasti + "_" + lastj;
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - initArrX) * tileW + startX;
								tempTile.y = lasti * tileH + startY;
								Tile(tempTile).i = lasti;
								Tile(tempTile).j = lastj;
								trace("t_" + lasti + "_" + (lastj - visAreaX - 1));
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
								var tempTile:MovieClip;
								if (mapArr[lasti][lastj] % 10 == 1)
								{
									tempTile = new Fog();
									Fog(tempTile).i = lasti;
									Fog(tempTile).j = lastj;
								}
								else
								{
									tempTile = createTile(int(mapArr[lasti][lastj] / 100));  
								}
								tempTile.name = "t_" + lasti + "_" + lastj;
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - curMapArrX) * tileW + startX-(initArrX-curMapArrX)*tileW;
								tempTile.y = lasti * tileH + startY;
								Tile(tempTile).i = lasti;
								Tile(tempTile).j = lastj;
								
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
								var tempTile:MovieClip;
								if (mapArr[lasti][lastj] % 10 == 1)
								{
									tempTile = new Fog();
									Fog(tempTile).i = lasti;
									Fog(tempTile).j = lastj;
								}
								else
								{
									tempTile = createTile(int(mapArr[lasti][lastj] / 100));  
								}
								tempTile.name = "t_" + lasti + "_" + (lastj);
								mapContainer.addChild(tempTile);
								
								tempTile.x = (lastj - curMapArrX) * tileW + startX-(initArrX-curMapArrX)*tileW;
								tempTile.y = lasti * tileH + startY;
								Tile(tempTile).i = lasti;
								Tile(tempTile).j = lastj;
								
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
					var tempTile:MovieClip;
					if (mapArr[i][j] % 10 == 1)
					{
						tempTile = new Fog();
						Fog(tempTile).i = i;
						Fog(tempTile).j = j;
					}
					else
					{
						tempTile = createTile(int(mapArr[i][j] / 100));  
					}
					tempTile.name = "t_" + i + "_" + j;
					mapContainer.addChild(tempTile);
					tempTile.x = (j - curMapArrX) * tileW + startX;
					tempTile.y = i * tileH + startY;
					Tile(tempTile).i = i;
					Tile(tempTile).j = j;
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
					Tile(tile).type = 1;
					break;
				case 2: 
					tile = new Tile2();
					Tile(tile).type = 2;
					break;
				case 3: 
					tile = new Tile3();
					Tile(tile).type = 3;
					break;
				case 4: 
					tile = new Tile4();
					Tile(tile).type = 4;
					break;
				case 5: 
					tile = new Tile5();
					Tile(tile).type = 5;
					break;
				case 6:
					tile = new Tile6();
					Tile(tile).type = 6;
					break;
				case 7:
					tile = new Ladder();
					Tile(tile).type = 7;
					break;
			}
			return tile;
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
			toolArray[0].txtNumberLeft.visible = false;
			toolArray[0].txtNumberRight.text = "x" + smallBomb.remains;
			smallBomb.x = toolBoxWidth / 2-5;
			smallBomb.y = toolBoxHeight / 2+5;
			
			var pickAxe:PickAxe = new PickAxe();
			toolArray[1].addChild(pickAxe);
			toolArray[1].txtNumberRight.visible = false;
			toolArray[1].txtNumberLeft.text = "x" + pickAxe.remains;
			pickAxe.x = toolBoxWidth / 2-20;
			pickAxe.y = toolBoxHeight / 2 - 5;
			
			var shovel:Shovel = new Shovel();
			toolArray[2].addChild(shovel);
			toolArray[2].txtNumberRight.visible = false;
			toolArray[2].txtNumberLeft.text = "x" + shovel.remains;
			shovel.x = shovel.width+3;
			shovel.y = shovel.height + 3;
			
			var smallShovel:SmallShovel = new SmallShovel();
			toolArray[3].addChild(smallShovel);
			toolArray[3].txtNumberRight.visible = false;
			toolArray[3].txtNumberLeft.text = "x" + smallShovel.remains;
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
					currentTool.type = Constant.SMALL_BOMB;
					break;
				case "1":
					currentTool = new PickAxe();
					currentTool.type = Constant.PICK_AXE;
					break;
				case "2":
					currentTool = new Shovel();
					currentTool.type = Constant.SHOVEL;
					break;
				case "3":
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
			if (!isDraggin)
			{
				e.currentTarget.gotoAndStop(2);
			}
		}
	}

}
package view 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.globalization.LocaleID;
	import flash.globalization.NumberFormatter;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import utils.Constant;
	import view.Container;
	/**
	 * ...
	 * @author Tung
	 */
	public class GameScreen extends MovieClip
	{
		//số hàng trăm là loại của ô đất, số hàng chục là phần thưởng có thể đào được, số hàng đơn vị chỉ định ô đất đã đc nhìn thấy hay chưa
		public var mapArr:Array = 
		[ [220,220,220,220,220,220,220,620,220,220,220,220,220,420,520,120,520,520,420,520,520,520,520,520,520,520,520,520,520,520,520,520,520,120,220,320,420,500,510,420],
		  [420,521,120,220,320,420,521,121,221,321,421,521,521,521,521,521,621,321,321,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,421],
		  [421,501,121,221,321,421,521,121,221,321,421,521,521,321,521,521,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,421],
		  [421,501,121,221,321,421,521,121,221,321,421,521,521,221,321,521,621,321,521,521,521,521,521,221,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,321],
		  [421,521,101,221,321,421,521,121,221,321,421,521,521,121,521,521,621,521,321,321,521,521,521,521,121,521,521,521,521,521,521,521,521,121,221,321,421,501,511,221],
		  [401,501,101,221,321,421,521,121,221,321,421,521,521,521,521,521,621,621,521,521,521,521,521,521,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,121],
		  [401,501,101,221,321,421,521,121,221,321,421,521,521,421,521,521,521,621,521,621,621,521,521,421,521,521,521,521,521,521,521,521,521,121,221,321,421,501,511,521],
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
		
		private var _mapDict:Dictionary;
		public var tile_arr:Array;
		private var _tileMapArr:Array;
		
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
		public static const SPACE_HEIGHT:Number = 2; //SPACE_HEIGHT chiều cao của không gian trên mặt đất tính theo ô
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
		private var _mapContainer:Container;
		private var gui:GUI;
		private var _userInfo:UserInfo;
		
		//biến kiểm tra đang rê chuột hay không
		var isDraggin:Boolean = false;
		
		//khoảng cách từ tọa độ chuốt tới vị trí của movieclip chứa map
		var diffX:Number;
		var diffY:Number;		
		
		public function GameScreen() 
		{
			mapContainer = new Container(this);
			
			addChild(mapContainer);
			
			addUserInfo();
			
			gui = new GUI();
			gui.mouseEnabled = false;
			addChild(gui);
			//initMap();
		}
		
		private function addUserInfo():void 
		{
			_userInfo = new UserInfo();
			_userInfo.txtUsername.text = "Elsa";
			trace(userInfo.width);
			_userInfo.txtUsername.autoSize = TextFieldAutoSize.LEFT;
			trace(userInfo.width);
			_userInfo.txtGold.x = userInfo.txtUsername.x + userInfo.txtUsername.width + 10;
			addChild(_userInfo);
			_userInfo.x = 20;
			_userInfo.y = 20;
			_userInfo.currentGold = 50000;
			_userInfo.updateGold();
		}
		
		public function getTileType(i:Number, j:Number):Number
		{
			if (mapDict[i][j])
			{
				return mapDict[i][j];
			}
			return -1;
		}
		
		private function buildMap():void
		{
			mapContainer.x = -curMapArrX * tileW;
			mapContainer.y = startY;
			
			tile_arr = new Array();
			tileMapArr = new Array();
			//trace("GameScreen 108 " + mapDict.length);
			var mapLength:Number = Constant.PRELOAD_SIZE * 2 + Constant.SCREEN_WIDTH;
			for (var k:int = 0; k < mapArr.length; k++) 
			{
				tileMapArr[k] = new Array();
				for (var l:int = 0; l < mapArr[0].length; l++) 
				{
					tileMapArr[k][l] = new Array();
				}
			}
			var tmp_arr:Array;
			
			var tempTile:Tile;
			for (var i:Number = 0; i < visAreaY + 1 + SPACE_HEIGHT; ++i) //+ 1 hàng tile được vẽ trước ở dưới
			{
				tmp_arr = new Array();
				tile_arr[tile_arr.length] = tmp_arr;
				for (var j:Number = curMapArrX; j < visAreaX + curMapArrX + 1; ++j)  //+ 1 cột tile được vẽ trước ở bên phải
				{
					if (mapArr[i][j] % 10 == 1)
					{
						tempTile = mapContainer.createTile(Constant.TILE_TYPE_FOG, j * tileW, i * tileH, i, j);
					}
					else
					{
						tempTile = mapContainer.createTile(int(mapArr[i][j] / 100), j * tileW, i * tileH, i, j);  
						if (i == 0) 
						{
							tempTile.removeChildAt(0);
							var new_graphic:MovieClip;
							if (int(mapArr[i][j] / 100) == Constant.TILE_TYPE_TYPE6)
							{
								new_graphic = mapContainer.createTileGraphic(int(mapArr[i][j] / 100), 2);
							}
							else
							{
								new_graphic = mapContainer.createTileGraphic(int(mapArr[i][j] / 100), 1);
							}
							tempTile.addChild(new_graphic);
						}
					}
					
					tmp_arr[tmp_arr.length] = tempTile;
					tileMapArr[i][j] = tempTile;
					
					mapContainer.addChild(tempTile);
				}
			}
			mapContainer.initListener();
			mapContainer.addHighLight();
		}
		
		private function onMouseOut(e:Event):void 
		{
			mapContainer.onMouseOut(e);
		}
		
		private function onMouseOver(e:Event):void 
		{
			trace("??");
			mapContainer.onMouseOver(e);
		}
		
		private function onClick(e:Event):void 
		{
			mapContainer.onClick(e);
		}
		
		
		
		private function onMouseMove(e:MouseEvent):void
		{
			mapContainer.x = e.stageX - diffX;
			mapContainer.y = e.stageY - diffY;
			
			if (mapContainer.y > startY)
			{
				mapContainer.y = startY;
				mapContainer.addHighLight();
			}
			if (mapContainer.x > 0)
			{
				mapContainer.x = 0;
				mapContainer.addHighLight();
			}
			if (mapContainer.x < -(mapW - visAreaX) * tileW)
			{
				mapContainer.x = -(mapW - visAreaX) * tileW;
				mapContainer.addHighLight();
			}
			if (mapContainer.y < startY - (mapH - visAreaY) * tileH)
			{
				mapContainer.y = startY - (mapH - visAreaY) * tileH;
				mapContainer.addHighLight();
			}
			
			var col_arr:Array;
			var tempTile:Tile;
			var new_graphic:MovieClip;
			
			var i:Number, j:Number;
			
			//move right
			for (j = 0; j < tile_arr[0].length; j++) // search each column
			{
				if (mapContainer.x + tile_arr[0][j].x < visAreaX * tileW) {
					continue;
				}
				for (i = 0; i < tile_arr.length; i++)
				{
					tempTile = tile_arr[i][j];
					if (tempTile.j - visAreaX - 1 >= 0) {
						// move this tile to the new pos
						if (mapArr[tempTile.i][tempTile.j - visAreaX - 1] % 10 == 1)
						{
							new_graphic = mapContainer.createTileGraphic(Constant.TILE_TYPE_FOG);
							tempTile.type = 8;
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j - visAreaX - 1] / 100)); 
							if (i == 0) 
							{
								if (int(mapArr[tempTile.i][tempTile.j - visAreaX - 1] / 100) == Constant.TILE_TYPE_TYPE6)
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j - visAreaX - 1] / 100), 2);
								}
								else
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j - visAreaX - 1] / 100), 1);
								}
							}
							tempTile.type = int(mapArr[tempTile.i][tempTile.j - visAreaX - 1] / 100);
						}
						tempTile.removeChildAt(0);
						tempTile.addChild(new_graphic);
						//mapContainer.addChild(newTile);
						
						tempTile.i = tempTile.i;
						tempTile.j = tempTile.j - visAreaX - 1;
						
						tileMapArr[tempTile.i][tempTile.j] = tempTile;
						
						//tile_arr[i][j] = newTile;
						
						//mapContainer.removeChild(tempTile);
						//tempTile = null;
						
						tempTile.x = tempTile.j * tileW;
						tempTile.y = tempTile.i * tileH;
					}
				}
			}
			//move left
			for (j = 0; j < tile_arr[0].length; j++) // search each column
			{
				//trace(tile_arr[0][j].x);
				if (mapContainer.x + tile_arr[0][j].x > -tileW) {
					continue;
				}
				for (i = 0; i < tile_arr.length; i++)
				{
					tempTile = tile_arr[i][j];
					if (tempTile.j + visAreaX + 1 < mapArr[0].length) {
						// move this tile to the new pos
						if (mapArr[tempTile.i][tempTile.j + visAreaX + 1] % 10 == 1)
						{
							new_graphic = mapContainer.createTileGraphic(Constant.TILE_TYPE_FOG);
							tempTile.type = 8;
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j + visAreaX + 1] / 100));
							if (i == 0) 
							{
								if (int(mapArr[tempTile.i][tempTile.j + visAreaX + 1] / 100) == Constant.TILE_TYPE_TYPE6)
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j + visAreaX + 1] / 100), 2);
								}
								else
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j + visAreaX + 1] / 100), 1);
								}
							}
							tempTile.type = int(mapArr[tempTile.i][tempTile.j + visAreaX + 1] / 100);
						}
						tempTile.removeChildAt(0);
						tempTile.addChild(new_graphic);
						//mapContainer.addChild(newTile);
						
						tempTile.i = tempTile.i;
						tempTile.j = tempTile.j + visAreaX + 1;
						
						tileMapArr[tempTile.i][tempTile.j] = tempTile;
						
						//tile_arr[i][j] = newTile;
						//
						//mapContainer.removeChild(tempTile);
						//tempTile = null;
						
						tempTile.x = tempTile.j * tileW;
						tempTile.y = tempTile.i * tileH;
					}
				}
			}
			//move up
			for (i = 0; i < tile_arr.length; i++) // search each row
			{
				if (mapContainer.y + tile_arr[i][0].y > -tileH) {
					continue;
				}
				for (j = 0; j < tile_arr[i].length; j++)
				{
					tempTile = tile_arr[i][j];
					if (tempTile.i + screenH + 1 < mapArr.length) {
						// move this tile to the new pos
						if (mapArr[tempTile.i + screenH + 1][tempTile.j] % 10 == 1)
						{
							new_graphic = mapContainer.createTileGraphic(Constant.TILE_TYPE_FOG);
							tempTile.type = 8;
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i + screenH + 1][tempTile.j] / 100)); 
							if (i == 0) 
							{
								if (int(mapArr[tempTile.i + screenH + 1][tempTile.j] / 100) == Constant.TILE_TYPE_TYPE6)
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i + screenH + 1][tempTile.j] / 100), 2);
								}
								else
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i + screenH + 1][tempTile.j] / 100), 1);
								}
							}
							tempTile.type = int(mapArr[tempTile.i + screenH + 1][tempTile.j] / 100);
						}
						tempTile.removeChildAt(0);
						tempTile.addChild(new_graphic);
						//mapContainer.addChild(newTile);
						
						tempTile.i = tempTile.i + screenH + 1;
						tempTile.j = tempTile.j;
						
						tileMapArr[tempTile.i][tempTile.j] = tempTile;
						
						//tile_arr[i][j] = newTile;
						//
						//mapContainer.removeChild(tempTile);
						//tempTile = null;
						
						tempTile.x = tempTile.j * tileW;
						tempTile.y = tempTile.i * tileH;
					}
				}
			}
			//move down
			for (i = 0; i < tile_arr.length; i++) // search each row
			{
				if (mapContainer.y + tile_arr[i][0].y < screenH * tileH) {
					continue;
				}
				for (j = 0; j < tile_arr[i].length; j++)
				{
					tempTile = tile_arr[i][j];
					if (tempTile.i - screenH - 1 >= 0) {
						// move this tile to the new pos
						if (mapArr[tempTile.i - screenH - 1][tempTile.j] % 10 == 1)
						{
							new_graphic = mapContainer.createTileGraphic(Constant.TILE_TYPE_FOG);
							tempTile.type = 8;
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i - screenH - 1][tempTile.j] / 100));  
							if (i == 0) 
							{
								if (int(mapArr[tempTile.i - screenH - 1][tempTile.j] / 100) == Constant.TILE_TYPE_TYPE6)
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i - screenH - 1][tempTile.j] / 100), 2);
								}
								else
								{
									new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i - screenH - 1][tempTile.j] / 100), 1);
								}
							}
							tempTile.type = int(mapArr[tempTile.i - screenH - 1][tempTile.j] / 100);
						}
						tempTile.removeChildAt(0);
						tempTile.addChild(new_graphic);
						//mapContainer.addChild(newTile);
						
						tempTile.i = tempTile.i - screenH - 1;
						tempTile.j = tempTile.j;
						
						tileMapArr[tempTile.i][tempTile.j] = tempTile;
						
						//tile_arr[i][j] = newTile;
						//
						//mapContainer.removeChild(tempTile);
						//tempTile = null;
						
						tempTile.x = tempTile.j * tileW;
						tempTile.y = tempTile.i * tileH;
					}
				}
			}
			
			e.updateAfterEvent();
			//trace(mapContainer.x + "," + mapContainer.y);
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			//mapContainer.stopDrag();
			isDraggin = false;
			this.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			//majorX = 0;
			//majorY = 0;
			//prevMousePoint = null;
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			//mapContainer.startDrag(false);
			isDraggin = true;
			diffX = e.stageX - mapContainer.x;
			diffY = e.stageY - mapContainer.y;
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			//prevMousePoint = new Point(e.stageX, e.stageY);
		}
		
		public function initMap():void 
		{
			buildMap();
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		public function get mapContainer():Container 
		{
			return _mapContainer;
		}
		
		public function set mapContainer(value:Container):void 
		{
			_mapContainer = value;
		}
		
		public function get tileMapArr():Array 
		{
			return _tileMapArr;
		}
		
		public function set tileMapArr(value:Array):void 
		{
			_tileMapArr = value;
		}
		
		public function get mapDict():Dictionary 
		{
			return _mapDict;
		}
		
		public function set mapDict(value:Dictionary):void 
		{
			_mapDict = value;
		}
		
		public function get userInfo():UserInfo 
		{
			return _userInfo;
		}
		
		public function set userInfo(value:UserInfo):void 
		{
			_userInfo = value;
		}
		
	}

}
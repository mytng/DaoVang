package view 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
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
		private var _mapContainer:Container;
		
		//biến kiểm tra đang rê chuột hay không
		var isDraggin:Boolean = false;
		
		//khoảng cách từ tọa độ chuốt tới vị trí của movieclip chứa map
		var diffX:Number;
		var diffY:Number;		
		
		public function GameScreen() 
		{
			mapContainer = new Container(this);
			
			addChild(mapContainer);
			
			buildMap();
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function buildMap():void
		{
			mapContainer.x = -curMapArrX * tileW;
			mapContainer.y = startY;
			
			tile_arr = new Array();
			tileMapArr = new Array();
			for (var k:int = 0; k < mapArr.length; k++) 
			{
				tileMapArr[k] = new Array();
			}
			var tmp_arr:Array;
			
			var tempTile:Tile;
			for (var i:Number = 0; i < visAreaY + 1 + SPACE_HEIGHT; ++i) //+ 1 hàng tile được vẽ trước ở dưới
			{
				tmp_arr = new Array();
				tile_arr[tile_arr.length] = tmp_arr;
				for (var j:Number = curMapArrX; j < visAreaX + curMapArrX + 1; ++j)  //+ 1 cột tile được vẽ trước ở bên phải
				{
					//tempTile = new Tile();
					//var new_graphic:MovieClip;
					if (mapArr[i][j] % 10 == 1)
					{
						//new_graphic = createTileGraphic(Constant.TILE_TYPE_FOG);
						tempTile = mapContainer.createTile(Constant.TILE_TYPE_FOG, j * tileW, i * tileH, i, j);
					}
					else
					{
						//new_graphic = createTileGraphic(int(mapArr[i][j] / 100));
						tempTile = mapContainer.createTile(int(mapArr[i][j] / 100), j * tileW, i * tileH, i, j);  
					}
					//tempTile.addChild(new_graphic);
					
					tmp_arr[tmp_arr.length] = tempTile;
					tileMapArr[i][j] = tempTile;
					
					mapContainer.addChild(tempTile);
					//tempTile.x = j * tileW;
					//tempTile.y = i * tileH;
					//tempTile.i = i;
					//tempTile.j = j;
				}
			}
			mapContainer.initListener();
			mapContainer.addHighLight();
			//trace(tileMapArr);
		}
		
		// tạo tile theo tham số tương ứng từ mảng 2 chiều
		/*private function createTile(i:Number):Tile
		{
			var tile:Tile;
			switch (i)
			{
				case 1: 
					tile = new Tile1();
					//tile.container = mapContainer;
					tile.type = 1;
					break;
				case 2: 
					tile = new Tile2();
					//tile.container = mapContainer;
					tile.type = 2;
					break;
				case 3: 
					tile = new Tile3();
					//tile.container = mapContainer;
					tile.type = 3;
					break;
				case 4: 
					tile = new Tile4();
					//tile.container = mapContainer;
					tile.type = 4;
					break;
				case 5: 
					tile = new Tile5();
					//tile.container = mapContainer;
					tile.type = 5;
					break;
				case 6:
					tile = new Tile6();
					//tile.container = mapContainer;
					tile.type = 6;
					break;
				case 7:
					tile = new Ladder();
					//tile.container = mapContainer;
					tile.type = 7;
					break;
			}
			tile.addEventListener(Tile.CLICK, onClick);
			tile.addEventListener(Tile.ROLL_OVER, onRollOver);
			tile.addEventListener(Tile.ROLL_OUT, onRollOut);
			mapContainer.addHighLight();
			return tile;
		}*/
		
		private function onRollOut(e:Event):void 
		{
			mapContainer.onRollOut(e);
		}
		
		private function onRollOver(e:Event):void 
		{
			mapContainer.onRollOver(e);
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
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j - visAreaX - 1] / 100));  
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
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i][tempTile.j + visAreaX + 1] / 100));  
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
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i + screenH + 1][tempTile.j] / 100));  
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
						}
						else
						{
							new_graphic = mapContainer.createTileGraphic(int(mapArr[tempTile.i - screenH - 1][tempTile.j] / 100));  
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
		
	}

}
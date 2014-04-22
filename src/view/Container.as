package view
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.engine.CFFHinting;
	import utils.Constant;
	import utils.CustomEvent;
	import view.Tile;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Container extends MovieClip 
	{
		private var _main:Main;
		private var _toolBar:ToolBar;
		private var _gameScreen:GameScreen;
		private var highLight:HighLight = new HighLight();
		
		public function Container(gs:GameScreen) 
		{
			super();
			gameScreen = gs;
		}
		
		public function addHighLight():void
		{
			highLight.mouseEnabled = false;
			highLight.visible = false;
			addChild(highLight);
		}
		
		public function onClick(e:Event):void 
		{
			var toolType:Number = toolBar.currentTool.type;
			var targetTile:Tile = Tile(e.currentTarget);
			switch(e.currentTarget.type)
			{
				case Constant.TILE_TYPE_TYPE1: //loại đá
					if (toolType == Constant.SMALL_SHOVEL || toolType == Constant.SHOVEL)
					{
						trace("unbreakable");
						return;
					}
					breakTile(targetTile);
					break;
				case Constant.TILE_TYPE_TYPE2:  //đất đá cấp 3
					if (toolType == Constant.PICK_AXE)
					{
						replaceTile(Constant.TILE_TYPE_TYPE5, targetTile);
					}
					if (toolType == Constant.SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE4, targetTile);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE3, targetTile);
					}
					break;
				case Constant.TILE_TYPE_TYPE3: //đất đá cấp 2
					if (toolType == Constant.PICK_AXE)
					{
						breakTile(targetTile);
					}
					if (toolType == Constant.SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE5, targetTile);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE4, targetTile);
					}
					break;
				case Constant.TILE_TYPE_TYPE4: //đất đá cấp 1
					if (toolType == Constant.PICK_AXE)
					{
						breakTile(targetTile);
					}
					if (toolType == Constant.SHOVEL)
					{
						breakTile(targetTile);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE5, targetTile);
					}
					break;
				case Constant.TILE_TYPE_TYPE5: //đất
					if (toolType == Constant.PICK_AXE)
					{
						breakTile(targetTile);
					}
					if (toolType == Constant.SHOVEL)
					{
						breakTile(targetTile);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						breakTile(targetTile);
					}
					break;
			}
		}
		
		public function initListener():void 
		{
			var tile_arr:Array = gameScreen.tile_arr;
			
			for (var i:int = 0; i < tile_arr.length; i++) 
			{
				for (var j:int = 0; j < tile_arr[0].length; j++) 
				{
					var tempTile:Tile = tile_arr[i][j];
					//if (!tempTile is Fog)
					//{
						//tempTile.addEventListener(Tile.CLICK, onClick);
						//tempTile.addEventListener(Tile.MOUSE_OVER, onMouseOver);
					//}
				}
			}
		}
		
		public function onRollOut(e:Event):void
		{
			highLight.visible = false;
		}
		
		public function onRollOver(e:Event):void 
		{
			//trace(e.currentTarget.x + "," + e.currentTarget.y);
			highLight.visible = true;
			highLight.x = e.currentTarget.x;
			highLight.y = e.currentTarget.y;
		}
		
				
		//thay thế ô đất khi bị đào
		private function replaceTile(tileNum:Number, tile:Tile):void 
		{
			trace(tile.i + "," +tile.j + " " + tileNum);
			tile.type = tileNum;
			var new_graphic:MovieClip;
			new_graphic = createTileGraphic(tileNum);
			
			if (tile.numChildren) tile.removeChildAt(0);
			tile.addChild(new_graphic);
			
			//gameScreen.tileMapArr[newTile.i][newTile.j] = newTile;
			var mod:Number = gameScreen.mapArr[tile.i][tile.j] % 100;
			gameScreen.mapArr[tile.i][tile.j] = mod + tileNum * 100;
			//gameScreen.mapContainer.removeChild(tile);
			trace(tile.i + "," +tile.j+" "+tile.type);
		}
		
		//khi ô đất hoàn toàn bị đào
		private function breakTile(tile:Tile):void 
		{
			//trace(tile.i + "," +tile.j);
			var new_graphic:MovieClip;
			var nextTile:Tile;
			if (tile.i - 1 >= 0)
			{
				gameScreen.mapArr[tile.i - 1][tile.j] = int(gameScreen.mapArr[tile.i - 1][tile.j] / 10);
				gameScreen.mapArr[tile.i - 1][tile.j] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i - 1][tile.j];
				nextTile.type = int(gameScreen.mapArr[tile.i - 1][tile.j] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				nextTile.addChild(new_graphic);
			}
			if ( tile.j - 1 >= 0 )
			{
				gameScreen.mapArr[tile.i][tile.j-1] = int(gameScreen.mapArr[tile.i][tile.j-1] / 10);
				gameScreen.mapArr[tile.i][tile.j - 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i][tile.j-1];
				nextTile.type = int(gameScreen.mapArr[tile.i][tile.j - 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				nextTile.addChild(new_graphic);
			}
			if (tile.j + 1 <= gameScreen.mapArr[tile.i].length)
			{
				gameScreen.mapArr[tile.i][tile.j+1] = int(gameScreen.mapArr[tile.i][tile.j+1] / 10);
				gameScreen.mapArr[tile.i][tile.j + 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i][tile.j+1];
				nextTile.type = int(gameScreen.mapArr[tile.i][tile.j + 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				nextTile.addChild(new_graphic);
			}
			if (tile.i + 1 <= gameScreen.mapArr.length)
			{
				gameScreen.mapArr[tile.i + 1][tile.j] = int(gameScreen.mapArr[tile.i + 1][tile.j] / 10);
				gameScreen.mapArr[tile.i + 1][tile.j] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i + 1][tile.j];
				nextTile.type = int(gameScreen.mapArr[tile.i + 1][tile.j] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				nextTile.addChild(new_graphic);
			}
		
			if (tile.y == 0)
			{
				replaceTile(Constant.TILE_TYPE_LADDER, tile);
			}
			else 
				replaceTile(Constant.TILE_TYPE_TYPE6, tile);
		}
		
		public function createTile(tileNum:Number, x:Number, y:Number, i:Number, j:Number):Tile
		{
			var new_graphic:MovieClip = createTileGraphic(tileNum);
			var newTile:Tile = new Tile();
			newTile.addChild(new_graphic);
			newTile.type = tileNum;
			newTile.x = x;
			newTile.y = y;
			newTile.i = i;
			newTile.j = j;
			//newTile.name = "t_" + i + "_" + j;
			newTile.addEventListener(Tile.CLICK, onClick);
			newTile.addEventListener(Tile.ROLL_OVER, onRollOver);
			newTile.addEventListener(Tile.ROLL_OUT, onRollOut);
			//addHighLight();
			return newTile;
		}
		
		public function createTileGraphic(tileNum:Number):MovieClip
		{
			var new_graphic:MovieClip;
			switch(tileNum)
			{
				case Constant.TILE_TYPE_TYPE1:
					new_graphic = new Tile1();
					break;
				case Constant.TILE_TYPE_TYPE2:
					new_graphic = new Tile2();
					break;
				case Constant.TILE_TYPE_TYPE3:
					new_graphic = new Tile3();
					break;
				case Constant.TILE_TYPE_TYPE4:
					new_graphic = new Tile4();
					break;
				case Constant.TILE_TYPE_TYPE5:
					new_graphic = new Tile5();
					break;
				case Constant.TILE_TYPE_TYPE6:
					new_graphic = new Tile6();
					break;
				case Constant.TILE_TYPE_LADDER:
					new_graphic = new Ladder();
					break;
				default:
					new_graphic = new Fog();
					break;
			}
			return new_graphic;
		}
		
		public function get main():Main 
		{
			return _main;
		}
		
		public function set main(value:Main):void 
		{
			_main = value;
		}
		
		public function get toolBar():ToolBar 
		{
			return _toolBar;
		}
		
		public function set toolBar(value:ToolBar):void 
		{
			_toolBar = value;
		}
		
		public function get gameScreen():GameScreen 
		{
			return _gameScreen;
		}
		
		public function set gameScreen(value:GameScreen):void 
		{
			_gameScreen = value;
		}
		
	}

}
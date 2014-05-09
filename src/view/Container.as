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
		private var _currentTheme:Number;
		private var background:JungleBackground;
		
		public function Container(gs:GameScreen) 
		{
			super();
			gameScreen = gs;
			background = new JungleBackground();
			background.x = 0 + gameScreen.curMapArrX * Constant.TILE_WIDTH;
			background.y = 0;
			addChild(background);
		}
		
		public function addHighLight():void
		{
			highLight.mouseEnabled = false;
			highLight.visible = false;
			addChild(highLight);
		}
		
		public function onClick(e:Event):void 
		{
			if (highLight.visible == false)
				return;
			var toolType:Number = toolBar.currentTool.type;
			if (!payGold(toolType)) return;
			
			var targetTile:Tile = Tile(e.currentTarget);
			var i:Number, j:Number;
			//trace("type " + e.currentTarget.type);
			switch(e.currentTarget.type)
			{
				case Constant.TILE_TYPE_TYPE1: //loại đá
					if (toolType == Constant.SMALL_SHOVEL || toolType == Constant.SHOVEL)
					{
						trace("unbreakable");
						return;
					}
					if (toolType == Constant.SMALL_BOMB)
					{
						for (i = targetTile.i - 1; i < targetTile.i + 1 + 1; i++) 
						{
							for (j = targetTile.j - 1; j < targetTile.j + 1 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
					}
					if (toolType == Constant.BIG_BOMB)
					{
						for (i = targetTile.i - 2; i < targetTile.i + 2 + 1; i++) 
						{
							for (j = targetTile.j - 2; j < targetTile.j + 2 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
					}
					breakTile(targetTile);
					break;
				case Constant.TILE_TYPE_TYPE2:  //đất đá cấp 3
					if (toolType == Constant.PICK_AXE)
					{
						//replaceTile(Constant.TILE_TYPE_TYPE5, targetTile);
						breakTile(targetTile);
					}
					if (toolType == Constant.SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE4, targetTile);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(Constant.TILE_TYPE_TYPE3, targetTile);
					}
					if (toolType == Constant.SMALL_BOMB)
					{
						for (i = targetTile.i - 1; i < targetTile.i + 1 + 1; i++) 
						{
							for (j = targetTile.j - 1; j < targetTile.j + 1 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
					}
					if (toolType == Constant.BIG_BOMB)
					{
						for (i = targetTile.i - 2; i < targetTile.i + 2 + 1; i++) 
						{
							for (j = targetTile.j - 2; j < targetTile.j + 2 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
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
					if (toolType == Constant.SMALL_BOMB)
					{
						for (i = targetTile.i - 1; i < targetTile.i + 1 + 1; i++) 
						{
							for (j = targetTile.j - 1; j < targetTile.j + 1 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
					}
					if (toolType == Constant.BIG_BOMB)
					{
						for (i = targetTile.i - 2; i < targetTile.i + 2 + 1; i++) 
						{
							for (j = targetTile.j - 2; j < targetTile.j + 2 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
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
					if (toolType == Constant.SMALL_BOMB)
					{
						for (i = targetTile.i - 1; i < targetTile.i + 1 + 1; i++) 
						{
							for (j = targetTile.j - 1; j < targetTile.j + 1 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
					}
					if (toolType == Constant.BIG_BOMB)
					{
						for (i = targetTile.i - 2; i < targetTile.i + 2 + 1; i++) 
						{
							for (j = targetTile.j - 2; j < targetTile.j + 2 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
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
					if (toolType == Constant.SMALL_BOMB)
					{
						for (i = targetTile.i - 1; i < targetTile.i + 1 + 1; i++) 
						{
							for (j = targetTile.j - 1; j < targetTile.j + 1 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
								{
									breakTile(gameScreen.tileMapArr[i][j]);
								}
							}
						}
						return;
					}
					if (toolType == Constant.BIG_BOMB)
					{
						for (i = targetTile.i - 2; i < targetTile.i + 2 + 1; i++) 
						{
							for (j = targetTile.j - 2; j < targetTile.j + 2 + 1; j++) 
							{
								if (i >= 0 && j >= 0 && i < gameScreen.tileMapArr.length && j < gameScreen.tileMapArr[0].length)
									breakTile(gameScreen.tileMapArr[i][j]);
							}
						}
						return;
					}
					break;
			}
		}
		
		private function payGold(toolType:Number):Boolean 
		{
			switch(toolType)
			{
				case Constant.SMALL_SHOVEL:
					gameScreen.userInfo.currentGold -= 100;
					if (gameScreen.userInfo.currentGold < 0)
					{
						gameScreen.userInfo.currentGold += 100;
						return false;
					}
					gameScreen.userInfo.updateGold();
					break;
				case Constant.SHOVEL:
					gameScreen.userInfo.currentGold -= 200;
					if (gameScreen.userInfo.currentGold < 0)
					{
						gameScreen.userInfo.currentGold += 200;
						return false;
					}
					gameScreen.userInfo.updateGold();
					break;
				case Constant.PICK_AXE:
					gameScreen.userInfo.currentGold -= 500;
					if (gameScreen.userInfo.currentGold < 0)
					{
						gameScreen.userInfo.currentGold += 500;
						return false;
					}
					gameScreen.userInfo.updateGold();
					break;
				case Constant.SMALL_BOMB:
					gameScreen.userInfo.currentGold -= 5000;
					if (gameScreen.userInfo.currentGold < 0)
					{
						gameScreen.userInfo.currentGold += 5000;
						return false;
					}
					gameScreen.userInfo.updateGold();
					break;
				case Constant.BIG_BOMB:
					gameScreen.userInfo.currentGold -= 12000;
					if (gameScreen.userInfo.currentGold < 0)
					{
						gameScreen.userInfo.currentGold += 12000;
						return false;
					}
					gameScreen.userInfo.updateGold();
					break;
			}
			return true;
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
		
		public function onMouseOut(e:Event):void
		{
			highLight.visible = false;
		}
		
		public function onMouseOver(e:Event):void 
		{
			//trace(e.currentTarget.j + "," + e.currentTarget.i);
			//trace(gameScreen.getTileType(e.currentTarget.j, e.currentTarget.i));
			if (toolBar.currentTool.type == Constant.SMALL_BOMB || toolBar.currentTool.type == Constant.BIG_BOMB)
			{
				//trace(e.currentTarget.i + "," + e.currentTarget.j);
				//trace(checkNearbyTile(e.currentTarget.i, e.currentTarget.j));
				if (e.currentTarget.type == Constant.TILE_TYPE_FOG || e.currentTarget.type == Constant.TILE_TYPE_TYPE6)
				{
						return;
				}
				if (!checkCornerTile(e.currentTarget.i, e.currentTarget.j))
				{
					return;
				}
				highLight.visible = true;
				if (toolBar.currentTool.type == Constant.SMALL_BOMB)
				{
					highLight.width = 3*Constant.TILE_WIDTH + 8;
					highLight.height = 3 * Constant.TILE_HEIGHT + 8;
					highLight.x = e.currentTarget.x-Constant.TILE_WIDTH - 1;
					highLight.y = e.currentTarget.y-Constant.TILE_HEIGHT - 1;
				}
				if (toolBar.currentTool.type == Constant.BIG_BOMB)
				{
					highLight.width = 5 * Constant.TILE_WIDTH + 14;
					highLight.height = 5 * Constant.TILE_HEIGHT + 14;
					highLight.x = e.currentTarget.x-2*Constant.TILE_WIDTH - 1;
					highLight.y = e.currentTarget.y-2*Constant.TILE_HEIGHT - 1;
				}
				return;
			}
			else
			{
				if (e.currentTarget.type == Constant.TILE_TYPE_FOG || e.currentTarget.type == Constant.TILE_TYPE_TYPE6)
				{
						return;
				}
				if (!checkCornerTile(e.currentTarget.i, e.currentTarget.j))
				{
					return;
				}
				highLight.visible = true;
				highLight.width = Constant.TILE_WIDTH + 2;
				highLight.height = Constant.TILE_HEIGHT + 2;
				highLight.x = e.currentTarget.x;
				highLight.y = e.currentTarget.y;
			}
		}
		
		//trả về true nếu những ô bên cạnh đã được nhìn thấy
		/*private function checkNearbyTile(i:Number, j:Number, bombRange:Number):Boolean
		{
			if(gameScreen.mapArr[i - 1][j])
				if (gameScreen.mapArr[i - 1][j] % 10 == 0)
					return true;
			if(gameScreen.mapArr[i + 1][j])
				if (gameScreen.mapArr[i + 1][j] % 10 == 0)
					return true;
			if(gameScreen.mapArr[i][j - 1])
				if (gameScreen.mapArr[i][j - 1] % 10 == 0)
					return true;
			if(gameScreen.mapArr[i][j + 1])
				if (gameScreen.mapArr[i][j + 1] % 10 == 0)
					return true;
			return false;
		}*/
		
		//kiểm tra ô hiện tại có nằm ở góc hay không
		private function checkCornerTile(i:Number, j:Number):Boolean
		{
			//trace(i + "," + j);
			if (i == 0)
				return true;
			if (i - 1 >= 0)
			{
				if (int(gameScreen.mapArr[i - 1][j] / 100) == 6 || int(gameScreen.mapArr[i - 1][j] / 100) == 7)
					return true;
			}
			if (i + 1 < gameScreen.mapArr.length)
			{
				if (int(gameScreen.mapArr[i + 1][j] / 100) == 6 || int(gameScreen.mapArr[i + 1][j] / 100) == 7)
					return true;
			}
			if (j - 1 >= 0)
			{
				if (int(gameScreen.mapArr[i][j - 1] / 100) == 6 || int(gameScreen.mapArr[i][j - 1] / 100) == 7)
					return true;
			}
			if (j + 1 < gameScreen.mapArr[i].length)
			{
				if (int(gameScreen.mapArr[i][j + 1] / 100) == 6 || int(gameScreen.mapArr[i][j + 1] / 100) == 7)
					return true;
			}
			return false;
		}
				
		//thay thế ô đất khi bị đào
		private function replaceTile(tileNum:Number, tile:Tile):void 
		{
			//trace(tile.i + "," +tile.j + " " + tileNum);
			tile.type = tileNum;
			var new_graphic:MovieClip;
			new_graphic = createTileGraphic(tileNum);
			
			if (tile.i == 0)
			{
				if (tile.type == Constant.TILE_TYPE_TYPE6)
				{
					new_graphic = createTileGraphic(tile.type, 2);
				}
				else
				{
					new_graphic = createTileGraphic(tile.type, 1);
				}
			}
			
			if (tile.numChildren) tile.removeChildAt(0);
			tile.addChild(new_graphic);
			
			//gameScreen.tileMapArr[newTile.i][newTile.j] = newTile;
			var mod:Number = gameScreen.mapArr[tile.i][tile.j] % 100;
			gameScreen.mapArr[tile.i][tile.j] = mod + tileNum * 100;
			//gameScreen.mapContainer.removeChild(tile);
			//trace(tile.i + "," +tile.j+" "+tile.type);
		}
		
		//khi ô đất hoàn toàn bị đào
		private function breakTile(tile:Tile):void 
		{
			//trace(tile.i + "," +tile.j);
			var new_graphic:MovieClip;
			var nextTile:Tile;
			//trace(tile + "," + tile.i + "," + tile.j);
			if (tile.i - 1 >= 0)
			{
				gameScreen.mapArr[tile.i - 1][tile.j] = int(gameScreen.mapArr[tile.i - 1][tile.j] / 10);
				gameScreen.mapArr[tile.i - 1][tile.j] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i - 1][tile.j];
				nextTile.type = int(gameScreen.mapArr[tile.i - 1][tile.j] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
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
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
				nextTile.addChild(new_graphic);
			}
			if (tile.j + 1 < gameScreen.mapArr[tile.i].length)
			{
				gameScreen.mapArr[tile.i][tile.j+1] = int(gameScreen.mapArr[tile.i][tile.j+1] / 10);
				gameScreen.mapArr[tile.i][tile.j + 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i][tile.j+1];
				nextTile.type = int(gameScreen.mapArr[tile.i][tile.j + 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
				nextTile.addChild(new_graphic);
			}
			if (tile.i + 1 < gameScreen.mapArr.length)
			{
				gameScreen.mapArr[tile.i + 1][tile.j] = int(gameScreen.mapArr[tile.i + 1][tile.j] / 10);
				gameScreen.mapArr[tile.i + 1][tile.j] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i + 1][tile.j];
				nextTile.type = int(gameScreen.mapArr[tile.i + 1][tile.j] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
				nextTile.addChild(new_graphic);
			}
			if (tile.i - 1 >= 0 && tile.j - 1 >= 0)
			{
				gameScreen.mapArr[tile.i - 1][tile.j-1] = int(gameScreen.mapArr[tile.i - 1][tile.j-1] / 10);
				gameScreen.mapArr[tile.i - 1][tile.j - 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i -1][tile.j-1];
				nextTile.type = int(gameScreen.mapArr[tile.i-1][tile.j - 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
				nextTile.addChild(new_graphic);
			}
			if (tile.i - 1 >= 0 && tile.j + 1 < gameScreen.mapArr[tile.i].length)
			{
				gameScreen.mapArr[tile.i - 1][tile.j+1] = int(gameScreen.mapArr[tile.i - 1][tile.j+1] / 10);
				gameScreen.mapArr[tile.i - 1][tile.j + 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i -1][tile.j+1];
				nextTile.type = int(gameScreen.mapArr[tile.i-1][tile.j + 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
				nextTile.addChild(new_graphic);
			}
			if (tile.i + 1 < gameScreen.mapArr.length && tile.j - 1 >= 0)
			{
				gameScreen.mapArr[tile.i + 1][tile.j-1] = int(gameScreen.mapArr[tile.i + 1][tile.j-1] / 10);
				gameScreen.mapArr[tile.i + 1][tile.j - 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i +1][tile.j-1];
				nextTile.type = int(gameScreen.mapArr[tile.i+1][tile.j - 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				if (nextTile.i == 0)
				{
					if (nextTile.type == Constant.TILE_TYPE_TYPE6)
					{
						new_graphic = createTileGraphic(nextTile.type, 2);
					}
					else
					{
						new_graphic = createTileGraphic(nextTile.type, 1);
					}
				}
				nextTile.addChild(new_graphic);
			}
			if (tile.i + 1 < gameScreen.mapArr.length && tile.j + 1 < gameScreen.mapArr[tile.i].length)
			{
				gameScreen.mapArr[tile.i + 1][tile.j+1] = int(gameScreen.mapArr[tile.i + 1][tile.j+1] / 10);
				gameScreen.mapArr[tile.i + 1][tile.j + 1] *= 10;
				nextTile = gameScreen.tileMapArr[tile.i +1][tile.j+1];
				nextTile.type = int(gameScreen.mapArr[tile.i+1][tile.j + 1] / 100);
				new_graphic = createTileGraphic(nextTile.type);
				if (nextTile.numChildren) nextTile.removeChildAt(0);
				nextTile.addChild(new_graphic);
			}
		
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
			newTile.addEventListener(Tile.MOUSE_OVER, onMouseOver);
			newTile.addEventListener(Tile.MOUSE_OUT, onMouseOut);
			//addHighLight();
			return newTile;
		}
		
		public function createTileGraphic(tileNum:Number, ...weedType):MovieClip
		{
			var new_graphic:MovieClip;
			if (currentTheme == Constant.NORMAL_THEME)
			{
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
					default:
						new_graphic = new Fog();
						break;
				}
				
				if (weedType[0] == 1)
				{
					var weed1:Weed1 = new Weed1();
					new_graphic.addChild(weed1);
					weed1.x = 0;
					weed1.y = 0;
				}
				if (weedType[0] == 2)
				{
					var weed2:Weed2 = new Weed2();
					new_graphic.addChild(weed2);
					weed2.x = 0;
					weed2.y = 0;
				}
			}
			if (currentTheme == Constant.ICE_THEME)
			{
				switch(tileNum)
				{
					case Constant.TILE_TYPE_TYPE1:
						new_graphic = new IceTile1();
						break;
					case Constant.TILE_TYPE_TYPE2:
						new_graphic = new IceTile2();
						break;
					case Constant.TILE_TYPE_TYPE3:
						new_graphic = new IceTile3();
						break;
					case Constant.TILE_TYPE_TYPE4:
						new_graphic = new IceTile4();
						break;
					case Constant.TILE_TYPE_TYPE5:
						new_graphic = new IceTile5();
						break;
					case Constant.TILE_TYPE_TYPE6:
						new_graphic = new IceTile6();
						break;
					//case Constant.TILE_TYPE_LADDER:
						//new_graphic = new Ladder();
						//break;
					default:
						new_graphic = new Fog();
						break;
				}
			}
			if (currentTheme == Constant.VOLCANO_THEME)
			{
				switch(tileNum)
				{
					case Constant.TILE_TYPE_TYPE1:
						new_graphic = new VolcanoTile1();
						break;
					case Constant.TILE_TYPE_TYPE2:
						new_graphic = new VolcanoTile2();
						break;
					case Constant.TILE_TYPE_TYPE3:
						new_graphic = new VolcanoTile3();
						break;
					case Constant.TILE_TYPE_TYPE4:
						new_graphic = new VolcanoTile4();
						break;
					case Constant.TILE_TYPE_TYPE5:
						new_graphic = new VolcanoTile5();
						break;
					case Constant.TILE_TYPE_TYPE6:
						new_graphic = new VolcanoTile6();
						break;
					//case Constant.TILE_TYPE_LADDER:
						//new_graphic = new Ladder();
						//break;
					default:
						new_graphic = new Fog();
						break;
				}
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
		
		public function get currentTheme():Number 
		{
			return _currentTheme;
		}
		
		public function set currentTheme(value:Number):void 
		{
			_currentTheme = value;
		}
		
	}

}
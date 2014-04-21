package view
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import utils.Constant;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Tile extends MovieClip 
	{
		var hightLight:HightLight;
		private var _type:Number;
		private var _i:Number;
		private var _j:Number;
		
		public function Tile() 
		{
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			addEventListener(MouseEvent.CLICK, onClick);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		
		private function onRemoved(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
			removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			removeEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			//trace(i + "," + j);
			var toolType:Number = Main(this.parent.parent).currentTool.type;
			switch(type)
			{
				case 1: //loại đá
					if (toolType == Constant.SMALL_SHOVEL || toolType == Constant.SHOVEL)
					{
						trace("unbreakable");
						return;
					}
					breakTile();
					break;
				case 2:  //đất đá cấp 3
					if (toolType == Constant.PICK_AXE)
					{
						replaceTile(5);
					}
					if (toolType == Constant.SHOVEL)
					{
						replaceTile(4);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(3);
					}
					break;
				case 3: //đất đá cấp 2
					if (toolType == Constant.PICK_AXE)
					{
						breakTile();
					}
					if (toolType == Constant.SHOVEL)
					{
						replaceTile(5);
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(4);
					}
					break;
				case 4: //đất đá cấp 1
					if (toolType == Constant.PICK_AXE)
					{
						breakTile();
					}
					if (toolType == Constant.SHOVEL)
					{
						breakTile();
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						replaceTile(5);
					}
					break;
				case 5: //đất
					if (toolType == Constant.PICK_AXE)
					{
						breakTile();
					}
					if (toolType == Constant.SHOVEL)
					{
						breakTile();
					}
					if (toolType == Constant.SMALL_SHOVEL)
					{
						breakTile();
					}
					break;
			}
		}
		
		private function onMouseOut(e:MouseEvent):void 
		{
			removeChild(hightLight);
			
		}
		
		private function onMouseOver(e:MouseEvent):void 
		{
			this.parent.setChildIndex(this, this.parent.numChildren-1);
			hightLight = new HightLight();
			hightLight.mouseEnabled = false;
			addChild(hightLight);
		}
		
		//thay thế ô đất khi bị đào
		private function replaceTile(tileNum:Number):void 
		{
			var newTile:Tile;
			newTile = createTile(tileNum, this.x, this.y , this.i, this.j);
			
			this.parent.addChild(newTile);
			var mod:Number = Main(this.parent.parent).mapArr[this.i][this.j] % 100;
			Main(this.parent.parent).mapArr[this.i][this.j] = mod + tileNum*100;
			this.parent.removeChild(this);
		}
		
		//khi ô đất hoàn toàn bị đào
		private function breakTile():void 
		{
			var newTile:Tile;
			if (i - 1 >= 0)
			{
				Main(this.parent.parent).mapArr[this.i - 1][this.j] = int(Main(this.parent.parent).mapArr[this.i - 1][this.j] / 10);
				Main(this.parent.parent).mapArr[this.i - 1][this.j] *= 10;
				this.parent.removeChild(this.parent.getChildByName("t_" + (this.i - 1) + "_" + this.j));
				newTile = createTile(int(Main(this.parent.parent).mapArr[this.i - 1][this.j] / 100), this.x, this.y - Constant.TILE_HEIGHT, this.i-1, this.j);
				this.parent.addChild(newTile);
			}
			if ( j - 1 >= 0 )
			{
				Main(this.parent.parent).mapArr[this.i][this.j-1] = int(Main(this.parent.parent).mapArr[this.i][this.j-1] / 10);
				Main(this.parent.parent).mapArr[this.i][this.j - 1] *= 10;
				this.parent.removeChild(this.parent.getChildByName("t_" + this.i + "_" + (this.j - 1)));
				newTile = createTile(int(Main(this.parent.parent).mapArr[this.i][this.j - 1] / 100), this.x - Constant.TILE_WIDTH, this.y, this.i, this.j - 1);
				trace(newTile.name);
				this.parent.addChild(newTile);
			}
			if (j + 1 <= Main(this.parent.parent).mapArr[this.i].length)
			{
				Main(this.parent.parent).mapArr[this.i][this.j+1] = int(Main(this.parent.parent).mapArr[this.i][this.j+1] / 10);
				Main(this.parent.parent).mapArr[this.i][this.j + 1] *= 10;
				this.parent.removeChild(this.parent.getChildByName("t_" + this.i + "_" + (this.j + 1)));
				newTile = createTile(int(Main(this.parent.parent).mapArr[this.i][this.j + 1] / 100), this.x + Constant.TILE_WIDTH, this.y, this.i, this.j + 1);
				this.parent.addChild(newTile);
			}
			if (i + 1 <= Main(this.parent.parent).mapArr.length)
			{
				Main(this.parent.parent).mapArr[this.i + 1][this.j] = int(Main(this.parent.parent).mapArr[this.i + 1][this.j] / 10);
				trace(Main(this.parent.parent).mapArr[this.i + 1][this.j]);
				Main(this.parent.parent).mapArr[this.i + 1][this.j] *= 10;
				trace(Main(this.parent.parent).mapArr[this.i + 1][this.j]);
				this.parent.removeChild(this.parent.getChildByName("t_" + (this.i + 1) + "_" + this.j));
				newTile = createTile(int(Main(this.parent.parent).mapArr[this.i + 1][this.j] / 100), this.x, this.y + Constant.TILE_HEIGHT, this.i + 1, this.j);
				this.parent.addChild(newTile);
				trace(newTile.name+i+","+j);
			}
		
			if (this.y == 80)
			{
				replaceTile(7);
			}
			else 
				replaceTile(6);
		}
		
		private function createTile(tileNum:Number, x:Number, y:Number, i:Number, j:Number):Tile
		{
			var newTile:Tile;
			switch(tileNum)
			{
				case 1:
					newTile = new Tile1();
					newTile.type = 1;
					break;
				case 2:
					newTile = new Tile2();
					newTile.type = 2;
					break;
				case 3:
					newTile = new Tile3();
					newTile.type = 3;
					break;
				case 4:
					newTile = new Tile4();
					newTile.type = 4;
					break;
				case 5:
					newTile = new Tile5();
					newTile.type = 5;
					break;
				case 6:
					newTile = new Tile6();
					newTile.type = 6;
					break;
				case 7:
					newTile = new Ladder();
					newTile.type = 7;
					break;
			}
			newTile.x = x;
			newTile.y = y;
			newTile.i = i;
			newTile.j = j;
			newTile.name = "t_" + i + "_" + j;
			return newTile;
		}
		
		public function get type():Number 
		{
			return _type;
		}
		
		public function set type(value:Number):void 
		{
			_type = value;
		}
		
		public function get i():Number 
		{
			return _i;
		}
		
		public function set i(value:Number):void 
		{
			_i = value;
		}
		
		public function get j():Number 
		{
			return _j;
		}
		
		public function set j(value:Number):void 
		{
			_j = value;
		}
		
	}

}
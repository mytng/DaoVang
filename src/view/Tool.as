package view
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Tool extends MovieClip 
	{
		private var _remains:Number = 20;
		private var _type:Number;
		
		public function Tool() 
		{
			this.mouseEnabled = false;
			this.mouseChildren = false;
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			trace("kill urself");
		}
		
		private function onMouseOver(e:MouseEvent):void 
		{
			trace("why");
		}
		
		public function get remains():Number 
		{
			return _remains;
		}
		
		public function set remains(value:Number):void 
		{
			_remains = value;
		}
		
		public function get type():Number 
		{
			return _type;
		}
		
		public function set type(value:Number):void 
		{
			_type = value;
		}
		
	}

}
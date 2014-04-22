package view
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import view.Container;
	import utils.CustomEvent;
	
	import utils.Constant;
	
	/**
	 * ...
	 * @author Tung
	 */
	public class Tile extends MovieClip 
	{
		public static var CLICK:String = "custom.click";
		public static var ROLL_OVER:String = "mouse.over";
		public static var ROLL_OUT:String = "roll.out";
		
		//var hightLight:HightLight;
		private var _type:Number;
		private var _i:Number;
		private var _j:Number;
		
		public function Tile() 
		{
			addEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			addEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			addEventListener(MouseEvent.CLICK, onClick);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		
		private function onRemoved(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			
			removeEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			removeEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			removeEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(CLICK, false, false, e.currentTarget));
		}
		
		
		
		private function onRollOut(e:MouseEvent):void 
		{
			dispatchEvent(new CustomEvent(ROLL_OUT, false, false, e.currentTarget));
		}
		
		private function onRollOver(e:MouseEvent):void 
		{
			//container.setChildIndex(this, container.numChildren - 1);
			//hightLight = new HightLight();
			//hightLight.mouseEnabled = false;
			//addChild(hightLight);
			dispatchEvent(new CustomEvent(ROLL_OVER, false, false, e.currentTarget));
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
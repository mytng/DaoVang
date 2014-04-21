package view
{
	import flash.display.MovieClip;
	
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
package utils
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Mind Outburst
	 */
	public class CustomEvent extends Event 
	{
		private var _data:*;
		
		public function CustomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:*=null) 
		{
			super(type, bubbles, cancelable);
			this._data = data;
		}
		
		public function get data():* 
		{
			return _data;
		}
		
		public function set data(value:*):void 
		{
			_data = value;
		}
		
	
	}

}
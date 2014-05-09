package view 
{
	import flash.display.MovieClip;
	import flash.globalization.LocaleID;
	import flash.globalization.NumberFormatter;
	/**
	 * ...
	 * @author ...
	 */
	public class UserInfo extends MovieClip
	{
		private var _username:String;
		private var _currentGold:Number;
		
		public function UserInfo() 
		{
			
		}
		
		public function updateGold():void
		{
			var formatter:NumberFormatter = new NumberFormatter(LocaleID.DEFAULT);

            formatter.decimalSeparator = ",";
			formatter.fractionalDigits = 0;
			
			txtGold.text = formatter.formatNumber(currentGold);
		}
		
		public function get currentGold():Number 
		{
			return _currentGold;
		}
		
		public function set currentGold(value:Number):void 
		{
			_currentGold = value;
		}
		
		public function get username():String 
		{
			return _username;
		}
		
		public function set username(value:String):void 
		{
			_username = value;
		}
		
	}

}
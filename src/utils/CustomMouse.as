package utils
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.ui.MouseCursorData;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * ...
	 * @author Tung
	 */
	public class CustomMouse 
	{
		private static var initialized:Boolean = false;
		
		public function CustomMouse() 
		{
		}
		
		public static function addCustomMouseCursor(cursorID:String, shape:DisplayObject, x:Number = 0, y:Number = 0):void {
			var w:Number = shape.width;
			var h:Number = shape.height;
			
			var ratioW:Number = 32 / w; // 32x32 is the maximum dimension of the cursor bitmap
			var ratioH:Number = 32 / h; // 32x32 is the maximum dimension of the cursor bitmap
			if ((ratioW < 1) || (ratioH < 1)) {
				//......
			}
			
			var bmpData:BitmapData = new BitmapData(w, h, true, 0);
			bmpData.draw(shape, new Matrix());
			
			var cursorDataBmp:Vector.<BitmapData> = new Vector.<BitmapData>();
			cursorDataBmp.push(bmpData);
			
			var cursorData:MouseCursorData = new MouseCursorData(); 
			cursorData.hotSpot = new Point(x, y);
			cursorData.data = cursorDataBmp;
			
			try {
				Mouse.registerCursor(cursorID, cursorData);
			} catch (err:Error) {
				trace("can not register custom mouse cursor '" + cursorID + "': " + err.message);
			}
		}
		
		public static function setMouseCursor(cursorID:String):void {
			Mouse.cursor = cursorID;
		}
		
	}

}
package gamesdk.module.core {
	CONFIG::flash_display {
		import flash.display.DisplayObjectContainer;
	}
	CONFIG::starling_display {
		import starling.display.DisplayObjectContainer;
	}
	
	/**
	 * 游戏的屏幕接口
	 * @author hanxianming
	 */
	public interface IScreen {
		function get screenType():Object;
		function set screenType(value:Object):void;
		function get screenName():String;
		function set screenName(value:String):void;
		function get fatherDisplay():DisplayObjectContainer;
		function set fatherDisplay(value:DisplayObjectContainer):void;
		/**
		 * 屏幕的show方法，在切换屏幕之后会自动触发。
		 */
		function show():void;
		/**
		 * 切换到下一个屏幕，会自动调用上一个屏幕的销毁方法。
		 */
		function disposeScreen():void;
		/**
		 * 移除屏幕内的所有显示对象。
		 */
		function removeAllDisplay():void;
		/**
		 * 从先是对象中移除屏幕自身。切换屏幕会自动触发。
		 */
		function removeScreenFromParent():void;
		/**
		 * 屏幕从管理器中删除会自动触发。
		 */
		function destory():void;
		/**
		 * 从管理器中删除自身屏幕。
		 */
		function deleteFromScreens():void;
	}
}
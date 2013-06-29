package gamesdk.module.events.starling {
	import starling.events.Event;
	
	/**
	 * 自定义切换屏幕事件
	 * @author hanxianming
	 */
	public class ScreenEvent extends Event {
		public static const SWITCH_SCREEN:String = "switch_screen";
		/** 自定义的屏幕类型*/
		public var screenType:Object;
		
		/**
		 * 切换屏幕事件
		 * @param	screenType 自定义的屏幕类型
		 * @param	data 切换屏幕需要传递的数据对象。
		 */
		public function ScreenEvent(screenType:Object = null, data:Object = null) {
			this.screenType = screenType;
			super(SWITCH_SCREEN, true, data);
		
		}
	}

}
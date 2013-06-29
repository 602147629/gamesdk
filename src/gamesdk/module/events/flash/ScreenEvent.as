package gamesdk.module.events.flash {
	import flash.events.Event;
	
	/**
	 * 自定义切换屏幕事件
	 * @author hanxianming
	 */
	public class ScreenEvent extends Event {
		/** 切换屏幕事件类型*/
		public static const SWITCH_SCREEN:String = "switch_screen";
		/** 切换屏幕传递的数据对象*/
		public var data:Object;
		/** 自定义的屏幕类型*/
		public var screenType:Object;
		
		/**
		 * 切换屏幕事件
		 * @param	screenType 自定义的屏幕类型
		 * @param	data 切换屏幕需要传递的数据对象。
		 */
		public function ScreenEvent(screenType:Object = null, data:Object = null) {
			this.data = data;
			this.screenType = screenType;
			super(SWITCH_SCREEN, true);
		}
		
		override public function clone():Event {
			return new ScreenEvent(SWITCH_SCREEN, screenType, data);
		}
	
	}

}
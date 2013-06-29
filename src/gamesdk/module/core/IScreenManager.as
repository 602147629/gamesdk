package gamesdk.module.core {
	
	/**
	 * 游戏屏幕管理器
	 * @author hanxianming
	 */
	public interface IScreenManager {
		/**
		 * 当前正在显示的屏幕。
		 */
		function get curScreen():IScreen;
		/**
		 * 当前正在显示的屏幕类型。
		 */
		function get curScreenType():Object;
		/**
		 * 获取所有可被显示的屏幕列表。
		 */
		function get screens():Vector.<IScreen>;
		/**
		 * 根据屏幕类型获取屏幕。
		 * @param	screenType 屏幕的类型定义，需自定义。
		 * @return
		 */
		function getScreenById(screenType:Object):IScreen;
		/**
		 * 切换屏幕
		 * @param	screenType 需要切换到的屏幕类型。
		 * @param	gc 切换屏幕是否强制垃圾回收。
		 */
		function switchScreen(screenType:Object, gc:Boolean = true):void;
		/**
		 * 添加一个屏幕。
		 * @param	screen 自定义的屏幕。
		 * @return
		 */
		function addScreen(screen:IScreen):IScreen;
		/**
		 * 移除一个自定义的屏幕。
		 * @param	screen 自定义的屏幕。
		 * @return
		 */
		function removeScreen(screen:IScreen):IScreen;
	}
}
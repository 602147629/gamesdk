package gamesdk.module.display {
	import gamesdk.module.constants.ScreenEventType;
	import gamesdk.module.ModuleLauncher;
	import gamesdk.module.core.IModuleConfigManager;
	import gamesdk.module.core.IModuleModelCenter;
	import gamesdk.module.core.IModuleManager;
	import gamesdk.module.core.IReflector;
	import gamesdk.module.core.IScreen;
	import gamesdk.module.core.IScreenManager;
	CONFIG::flash_display {
		import flash.display.DisplayObjectContainer;
		import flash.display.Sprite;
	}
	CONFIG::starling_display {
		import starling.display.DisplayObjectContainer;
		import starling.display.Sprite;
	}
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class Screen extends Sprite implements IScreen {
		
		protected var $screenType:uint;
		protected var $screenName:String;
		protected var $fatherDisplay:DisplayObjectContainer;
		protected var $modelCenter:IModuleModelCenter;
		protected var $moduleManager:IModuleManager;
		protected var $configManager:IModuleConfigManager;
		protected var $reflector:IReflector;
		protected var $screenManager:IScreenManager;
		
		public function Screen(screenType:uint, screenName:String = "") {
			this.$screenType = screenType;
			this.$screenName = screenName;
			
			$modelCenter = ModuleLauncher.modelCenter;
			$moduleManager = ModuleLauncher.moduleManager;
			$configManager = ModuleLauncher.configManager;
			$reflector = ModuleLauncher.reflector;
			$screenManager = ModuleLauncher.screenManager;
			
			$screenManager.addScreen(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get screenType():uint {
			return $screenType;
		}
		
		public function set screenType(value:uint):void {
			$screenType = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get screenName():String {
			return $screenName;
		}
		
		public function set screenName(value:String):void {
			$screenName = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get fatherDisplay():DisplayObjectContainer {
			return $fatherDisplay;
		}
		
		public function set fatherDisplay(value:DisplayObjectContainer):void {
			$fatherDisplay = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function show():void {
			registSwitchScreenEvent();
		}
		
		/**
		 * @inheritDoc
		 */
		public function disposeScreen():void {
			removeSwitchScreenEvent();
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeAllDisplay():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeScreenFromParent():void {
			if (parent != null)
				parent.removeChild(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function deleteFromScreens():void {
			$screenManager.removeScreen(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function destory():void {
			$fatherDisplay = null;
			$modelCenter = null;
			$moduleManager = null;
			$configManager = null;
			$reflector = null;
			$screenManager = null;
		}
		
		/**
		 * 接收到切换屏幕的事件。
		 * @param	... arg
		 */
		protected function switchScreenEventHandler(... arg):void {
		
		}
		
		/**
		 * 注册屏幕事件。
		 */
		protected function registSwitchScreenEvent():void {
			ModuleLauncher.registerModuleMsg(ScreenEventType.SWITCH_SCREEN, switchScreenEventHandler);
		}
		
		/**
		 * 移除屏幕事件。
		 */
		protected function removeSwitchScreenEvent():void {
			ModuleLauncher.deleteModuleMsg(ScreenEventType.SWITCH_SCREEN, switchScreenEventHandler);
		}
		
		/**
		 * 切换屏幕
		 * @param	screenType 屏幕类型，需要自定义屏幕类型枚举。
		 * @param	gc 是否调用GC。
		 */
		protected function switchScreen(screenType:uint, gc:Boolean = true):void {
			$screenManager.switchScreen(screenType, gc);
		}
	}
}
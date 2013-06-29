package gamesdk.module.display {
	import gamesdk.module.ModuleLauncher;
	import gamesdk.module.core.IModuleConfigManager;
	import gamesdk.module.core.IModuleModelCenter;
	import gamesdk.module.core.IModuleManager;
	import gamesdk.module.core.IReflector;
	import gamesdk.module.core.IScreen;
	import gamesdk.module.core.IScreenManager;
	CONFIG::flash_display {
		import gamesdk.module.events.flash.ModuleEvent;
		import flash.display.DisplayObjectContainer;
		import flash.display.Sprite;
	}
	CONFIG::starling_display {
		import gamesdk.module.events.starling.ModuleEvent;
		import starling.display.DisplayObjectContainer;
		import starling.display.Sprite;
	}
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class Screen extends Sprite implements IScreen {
		
		protected var $screenType:Object;
		protected var $screenName:String;
		protected var $fatherDisplay:DisplayObjectContainer;
		protected var $modelCenter:IModuleModelCenter;
		protected var $moduleManager:IModuleManager;
		protected var $configManager:IModuleConfigManager;
		protected var $reflector:IReflector;
		protected var $screenManager:IScreenManager;
		
		public function Screen(screenType:Object, screenName:String = "") {
			this.$screenType = screenType;
			this.$screenName = screenName;
			
			$modelCenter = ModuleLauncher.modelCenter;
			$moduleManager = ModuleLauncher.moduleManager;
			$configManager = ModuleLauncher.configManager;
			$reflector = ModuleLauncher.reflector;
			$screenManager = ModuleLauncher.screenManager;
			
			$screenManager.addScreen(this);
			
			addEventListener(ModuleEvent.INSTALL_MODULE, installModuleHandler);
			addEventListener(ModuleEvent.UNINSTALL_MODULE, uninstallModuleHandler);
		}
		
		/**
		 * 接收到模块子对象的请求卸载模块事件,具体逻辑可重写此方法。
		 * @param	e
		 */
		protected function uninstallModuleHandler(e:ModuleEvent):void {
			$moduleManager.uninstallModule(e.moduleType, true);
		}
		
		/**
		 * 接收到模块子对象的请求安装模块事件,具体逻辑需要重写此方法。
		 * @param	e
		 */
		protected function installModuleHandler(e:ModuleEvent):void {
		}
		
		/**
		 * @inheritDoc
		 */
		public function get screenType():Object {
			return $screenType;
		}
		
		public function set screenType(value:Object):void {
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
		}
		
		/**
		 * @inheritDoc
		 */
		public function disposeScreen():void {
			removeEventListener(ModuleEvent.INSTALL_MODULE, installModuleHandler);
			removeEventListener(ModuleEvent.UNINSTALL_MODULE, uninstallModuleHandler);
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
			CONFIG::flash_display {
				if (parent != null)
					parent.removeChild(this);
			}
			CONFIG::starling_display {
				removeFromParent(true);
			}
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
		 * 切换屏幕
		 * @param	screenType 屏幕类型，需要自定义屏幕类型枚举。
		 * @param	gc 是否调用GC。
		 */
		protected function switchScreen(screenType:uint, gc:Boolean = true):void {
			$screenManager.switchScreen(screenType, gc);
		}
	}
}
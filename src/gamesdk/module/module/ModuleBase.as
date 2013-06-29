package gamesdk.module.module {
	import flash.display.Loader;
	import flash.events.Event;
	
	import gamesdk.module.ModuleLauncher;
	import gamesdk.module.core.IModule;
	import gamesdk.module.core.IModuleConfigManager;
	import gamesdk.module.core.IModuleModelCenter;
	import gamesdk.module.core.IModuleManager;
	import gamesdk.module.core.IReflector;
	import gamesdk.module.core.IScreenManager;
	import gamesdk.tools.ToolsMain;
	
	CONFIG::flash_display {
		import gamesdk.module.events.flash.ScreenEvent;
		import flash.display.DisplayObjectContainer;
		import flash.display.Sprite;
	}
	CONFIG::starling_display {
		import gamesdk.module.events.starling.ScreenEvent;
		import starling.display.DisplayObjectContainer;
		import starling.display.Sprite;
	}
	
	/**
	 * 模块基类。
	 * @author hanxianming
	 */
	public class ModuleBase extends Sprite implements IModule {
		protected var $modelCenter:IModuleModelCenter;
		protected var $moduleManager:IModuleManager;
		protected var $configManager:IModuleConfigManager;
		protected var $reflector:IReflector;
		protected var $screenManager:IScreenManager;
		protected var $loader:Loader;
		protected var $moduleType:String = "ModuleBase";
		
		public function ModuleBase(moduleType:String) {
			$modelCenter = ModuleLauncher.modelCenter;
			$moduleManager = ModuleLauncher.moduleManager;
			$configManager = ModuleLauncher.configManager;
			$reflector = ModuleLauncher.reflector;
			$screenManager = ModuleLauncher.screenManager;
			$moduleType = moduleType;
			this.addEventListener(ScreenEvent.SWITCH_SCREEN, switchScreenHandler);
		}
		
		/**
		 * 模块内部接收切换屏幕事件，具体的切换屏幕逻辑请重写。
		 * @param	e
		 */
		protected function switchScreenHandler(e:ScreenEvent):void {
			$screenManager.switchScreen(e.screenType, true);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get moduleType():String {
			return $moduleType;
		}
		
		/**
		 * @inheritDoc
		 */
		public function init():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function show(father:DisplayObjectContainer, index:int = -1):void {
			if (father == null) {
				ToolsMain.log.error("[module]" + moduleType + "不能被添加到空对象中。");
				return;
			}
			if (index == -1) {
				father.addChild(this);
			} else {
				father.addChildAt(this, index);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function exit():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function disposeModule():void {
			$modelCenter = null;
			$moduleManager = null;
			$configManager = null;
			$reflector = null;
			$screenManager = null;
			$loader = null;
			this.removeEventListener(ScreenEvent.SWITCH_SCREEN, switchScreenHandler);
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeModluleFromParent(unload:Boolean = false):void {
			if (unload) {
				$moduleManager.uninstallModule(moduleType);
			} else {
				if (this.parent != null) {
					this.parent.removeChild(this);
				}
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function get loader():Loader {
			return $loader;
		}
		
		public function set loader(value:Loader):void {
			$loader = value;
		}
	
	}

}
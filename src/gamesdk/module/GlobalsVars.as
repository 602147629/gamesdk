package gamesdk.module {
	CONFIG::flash_display {
		import flash.display.Sprite;
	}
	CONFIG::starling_display {
		import starling.display.Sprite;
	}
	import flash.display.Stage;
	
	/**
	 * @author hanxianming
	 */
	public class GlobalsVars {
		/** 应用程序的主显示对象。*/
		public static var rootSprite:Sprite;
		/** 应用程序的根显示对象。*/
		public static var nativeStage:Stage;
		/** 是否启动动态加载*/
		public static var dynamicLoad:Boolean;
		
		public function GlobalsVars() {
		
		}
	
	}

}
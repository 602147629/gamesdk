package gamesdk.module.events.starling {
	import starling.events.Event;
	
	/**
	 * 自定义模块控制事件。
	 * @author hanxianming
	 */
	public class ModuleEvent extends Event {
		/** 安装模块事件类型*/
		public static const INSTALL_MODULE:String = "install_module";
		/** 卸载模块事件类型*/
		public static const UNINSTALL_MODULE:String = "uninstall_module";
		/** 自定义的模块类型*/
		public var moduleType:String = "";
		
		/**
		 * 自定义模块控制事件
		 * @param	type 自定义事件的类型，详情参见ModuleEvent.as静态常量。
		 * @param	moduleType 自定义的模块类型。
		 * @param	gc 在卸载模块是，是否手动触发垃圾回收。
		 * @param	data 模块控制事件可传递的数据对象。
		 */
		public function ModuleEvent(type:String, moduleType:String, gc:Boolean = false, data:Object = null) {
			this.data = data;
			this.moduleType = moduleType;
			super(type, true, data);
		
		}
	
	}

}
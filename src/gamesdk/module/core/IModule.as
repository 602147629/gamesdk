package gamesdk.module.core {
	import flash.display.Loader;
	CONFIG::flash_display {
		import flash.display.DisplayObjectContainer;
	}
	CONFIG::starling_display {
		import starling.display.DisplayObjectContainer;
	}
	
	/**
	 * 模块接口
	 * @author hanxianming
	 */
	public interface IModule {
		/**
		 * 模块的类型。
		 * 每一个实现IModule接口的模块都需要著名模块的类型。
		 */
		function get moduleType():String;
		/**
		 * 模块被安装之后的初始化操作。
		 */
		function init():void;
		/**
		 * 模块的显示到舞台的方法。
		 * @param	father 承载显示对象的父类。
		 * @param	index 显示对象的层次。
		 */
		function show(father:DisplayObjectContainer, index:int = -1):void;
		/**
		 * 模块被卸载之后会会触发。
		 */
		function exit():void;
		/**
		 * 模块被卸载之后会触发。主要用于销毁模块内对象的引用。
		 */
		function disposeModule():void;
		/**
		 * 如果为动态模块加载，则此对象为此模块的加载容器。
		 */
		function get loader():Loader;
		function set loader(value:Loader):void;
	}
}
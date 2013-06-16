package gamesdk.module.core {
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.events.IEventDispatcher;
	import mx.modules.ModuleBase;
	
	/**
	 * 模块接口
	 * @author hanxianming
	 */
	public interface IModule {
		function get moduleType():String;
		function init():void;
		function show(father:DisplayObjectContainer, index:int = -1):void;
		function exit():void;
		function dispose():void;
		function get loader():Loader;
		function set loader(value:Loader):void;
	}
}
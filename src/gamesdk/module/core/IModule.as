package gamesdk.module.core {
	
	/**
	 * 模块接口
	 * @author hanxianming
	 */
	public interface IModule {
		function get moduleType():String;
		function set moduleType(value:String):void;
		function init():void;
		function show():void;
		function exit():void;
		function dispose():void;
	}
}
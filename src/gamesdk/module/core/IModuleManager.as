package gamesdk.module.core {
	import flash.utils.ByteArray;
	
	/**
	 * 模块管理器
	 * @author hanxianming
	 */
	public interface IModuleManager {
		function loadModule(moduleType:String, loadComplete:Function, loadFail:Function, byteArray:ByteArray = null, startLoadModule:Function = null, progress:Function = null):void;
		function destoryModule(moduleType:String):void;
		function getModuleByType(moduleType:String):IModule;
		function getModuleByName(moduleType:String):IModule;
		function getModuleProperties(moduleType:String, matchs:Class, properties:String, ... args):Object;
		function sendModuleMessage(msgType:String, data:Object = null):void;
		function receiveServerMessage(msgType:uint, data:Object = null):void;
		function registModuleMessage(msgType:String, handler:Function):void;
		function deleteModuleMessage(msgType:String, handler:Function):void;
		function registServerMessage(msgType:uint, handler:Function):void;
		function deleteServerMessage(msgType:uint, handler:Function):void;
	}
}
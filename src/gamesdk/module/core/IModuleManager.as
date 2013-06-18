package gamesdk.module.core {
	import flash.utils.ByteArray;
	
	/**
	 * 模块管理器
	 * @author hanxianming
	 */
	public interface IModuleManager {
		/**
		 * 安装模块。
		 * @param moduleType 模块的类型。
		 * @param installComplete 安装模块成功回调。
		 * @param installFail 安装模块失败回调。
		 * @param byteArray 模块二进制的形式，适用于动态加载。
		 * @param installModuleStart 模块开始安装回调。
		 * @param installProgress 模块安装进度回调。
		 *
		 */
		function installModule(moduleType:String, installComplete:Function = null, installFail:Function = null, byteArray:ByteArray = null, installModuleStart:Function = null, installProgress:Function = null):void;
		/**
		 * 卸载安装的模块。
		 * @param moduleType 模块类型。
		 * @param gc 是否强制垃圾回收。
		 *
		 */
		function uninstallModule(moduleType:String, gc:Boolean = false):void;
		/**
		 * 根据类型获取一个模块。
		 * @param moduleType 模块类型。
		 * @return
		 *
		 */
		function getModuleByType(moduleType:String):IModule;
		/**
		 * 根据名称获取模块。
		 * @param moduleName 模块类型。
		 * @return
		 *
		 */
		function getModuleByName(moduleName:String):IModule;
		/**
		 * 获取或者设置模块的属性和方法。
		 * @param moduleType 模块类型。
		 * @param matchs 类型匹配，设置或者获取的属性和方法必须为matchs类中申明的属性和方法。
		 * @param properties 属性或者方法名称。
		 * @param args 需要传递的参数。
		 * @return
		 *
		 */
		function getModuleProperties(moduleType:String, matchs:Class, properties:String, ... args):Object;
		/**
		 * 发送模块消息。
		 * @param msgType 消息类型。
		 * @param data 需要发送的数据。
		 *
		 */
		function sendModuleMessage(msgType:String, data:Object = null):void;
		/**
		 * 接收服务端的消息。
		 * @param msgType 消息类型。
		 * @param data 接收到的数据。
		 *
		 */
		function receiveServerMessage(msgType:uint, data:Object = null):void;
		
		/**
		 * 注册模块消息。
		 * @param msgType 消息类型。
		 * @param handler 消息处理器。
		 *
		 */
		function registModuleMessage(msgType:String, handler:Function):void;
		/**
		 * 删除模块消息。
		 * @param msgType 消息类型。
		 * @param handler 消息处理器。
		 *
		 */
		function deleteModuleMessage(msgType:String, handler:Function):void;
		/**
		 * 注册服务端消息。
		 * @param msgType 消息类型。
		 * @param handler 消息处理器。
		 *
		 */
		function registServerMessage(msgType:uint, handler:Function):void;
		/**
		 * 删除服务端消息。
		 * @param msgType 消息类型。
		 * @param handler 消息处理器。
		 *
		 */
		function deleteServerMessage(msgType:uint, handler:Function):void;
	}
}
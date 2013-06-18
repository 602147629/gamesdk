package gamesdk.module.core {
	import flash.system.ApplicationDomain;
	
	/**
	 * 反射管理
	 * @author hanxianming
	 */
	public interface IReflector {
		/**
		 * 获取对象或者类的元数据描述信息，有缓存机制，提高运行速度。类似于describeType。
		 * @param	obj 对象实例或者类，会被用作映射的Key值。
		 * @return
		 */
		function getDescribeType(obj:Object):XML;
		/**
		 * 删除缓存的元数据描述信息。
		 * @param	obj 需要被删除的Key值。
		 * @return
		 */
		function deleteDescribeType(obj:Object):XML;
		/**
		 * 获取应用程序域中的对象。
		 * @param	name 应用程序域中的名称。
		 * @return
		 */
		function getDefinition(name:String):Object;
		function get applicationDomain():ApplicationDomain;
		function set applicationDomain(value:ApplicationDomain):void;
		/**
		 * true为本地，false为远程。
		 */
		function get isLocal():Boolean;
		function set isLocal(value:Boolean):void;
		function classExtendsOrImplements(classOrClassName:Object, superclass:Class):Boolean;
		function getClass(value:*):Class
		function getFQCN(value:*, replaceColons:Boolean = false):String;
	
	}

}
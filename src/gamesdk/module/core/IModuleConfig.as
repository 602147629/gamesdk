package gamesdk.module.core {
	
	/**
	 * 模块配置数据
	 * @author hanxianming
	 */
	public interface IModuleConfig {
		/**
		 * 模块类型
		 */
		function get moduleType():String;
		function set moduleType(value:String):void;
		/**
		 * 模块的url地址。
		 */
		function get moduleUrl():String;
		function set moduleUrl(value:String):void;
		/**
		 * 模块的名字
		 */
		function get moduleName():String;
		function set moduleName(value:String):void;
		/**
		 * 模块的应用程序域类型，具体类型请参考AppDomainType.as。
		 */
		function get appDomainType():uint;
		function set appDomainType(value:uint):void;
		/**
		 * 是否以二进制的形式被加载。
		 */
		function get isByteArray():Boolean;
		function set isByteArray(value:Boolean):void;
	
	}

}
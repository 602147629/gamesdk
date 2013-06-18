package gamesdk.module.core {
	
	/**
	 * 所有模块配置管理
	 * @author hanxianming
	 */
	public interface IModuleConfigManager {
		/**
		 * 根据模块类型获取模块的配置数据。
		 * @param	moduleType 模块类型。
		 * @return 模块配置数据。
		 */
		function getModuleConfigByType(moduleType:String):IModuleConfig;
		/**
		 * 根据模块的URL地址获取模块的配置数据。
		 * @param	moduleUrl 模块URL地址。
		 * @return
		 */
		function getModuleConfigByUrl(moduleUrl:String):IModuleConfig;
		/**
		 * 根据模块名称获取模块的配置数据。
		 * @param	moduleName
		 * @return
		 */
		function getModuleConfigByName(moduleName:String):IModuleConfig;
		/**
		 * 设置模块的配置信息。
		 * @param	xml 模块配置信息的XML形式。
		 */
		function setModulesConfig(xml:XML):void;
	}

}
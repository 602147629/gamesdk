package gamesdk.module.core {
	
	/**
	 * 模块数据管理中心
	 * @author hanxianming
	 */
	public interface IModuleModelCenter {
		/**
		 * 注册数据层需要被创建的useinstanceClass和访问whenAskedFor的映射。
		 * @param	whenAskedFor 对象的访问类型。
		 * @param	useinstanceClass 需要被创建实例的类。
		 * @param	named 注册的名称。
		 */
		function registClass(whenAskedFor:Class, useinstanceClass:Class, named:String = ""):IModuleModelCenter;
		/**
		 * 注册数据层数据instance实例和访问whenAskedFor的映射。
		 * @param	whenAskedFor 对象的访问类型。
		 * @param	instance Model层的数据实例。
		 * @param	named 注册的名称。
		 */
		function registInstance(whenAskedFor:Class, instance:Object, named:String = ""):IModuleModelCenter
		/**
		 * 根据访问类型删除注册的映射。
		 * @param	whenAskedFor 访问的类型。
		 * @param	named 注册的名称
		 */
		function deleteClass(whenAskedFor:Class, named:String = ""):IModuleModelCenter;
		/**
		 * 根据实例删除注册的映射。
		 * @param	request 实例。
		 * @param	named 注册的名称
		 */
		function deleteInstance(request:Object, named:String = ""):IModuleModelCenter;
		/**
		 * 根据类的应用程序域名称获取注册的对象实例。例如gamesdk.module.core.ModuleModelCenter。
		 * @param	requestName 应用程序域名称
		 * @param	named 注册的名称
		 * @return 注册的对象实例。
		 */
		function getDataProxyByClassName(requestName:String, named:String = ""):Object;
		/**
		 * 根据访问类型获取注册的对象实例。
		 * @param	whenAskedFor 访问的类型。
		 * @param	named 注册的名称
		 * @return 注册的对象实例。
		 */
		function getDataProxyByObject(whenAskedFor:Object, named:String = ""):Object;
		/**
		 * 注入数据对象
		 * @param	obj 注入对象。
		 */
		function intoInjectObject(obj:Object):Object;
		/**
		 * 注入数据到Class实例中，并且返回该Class的实例。
		 * @param	cla
		 * @return
		 */
		function intoInjectClass(cla:Class):Object;
	}
}
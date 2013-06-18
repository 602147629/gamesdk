package gamesdk.module.module {
	import flash.utils.getQualifiedClassName;
	import gamesdk.module.ModuleLauncher;
	
	import gamesdk.module.core.IModuleModelCenter;
	import gamesdk.tools.ToolsMain;
	
	/**
	 * 模块数据管理中心
	 * @author hanxianming
	 */
	public class ModuleModelCenter implements IModuleModelCenter {
		private static var _instance:IModuleModelCenter;
		
		private var _classFors:Object;
		private var _useInstances:Object;
		
		public function ModuleModelCenter() {
			init();
		}
		
		private function init():void {
			_classFors = {};
			_useInstances = {};
		}
		
		public static function get instance():IModuleModelCenter {
			if (_instance == null) {
				_instance = new ModuleModelCenter();
			}
			return _instance;
		}
		
		/**
		 * @inheritDoc
		 */
		public function registDataProxyClass(whenAskedFor:Class, useinstanceClass:Class, named:String = ""):IModuleModelCenter {
			var requestName:String = getQualifiedClassName(whenAskedFor);
			_classFors[requestName + '#' + named] = useinstanceClass;
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function registDataProxyInstance(whenAskedFor:Class, instance:Object, named:String = ""):IModuleModelCenter {
			var requestName:String = getQualifiedClassName(whenAskedFor);
			_useInstances[requestName + '#' + named] = instance;
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function deleteDataProxyClass(whenAskedFor:Class, named:String = ""):IModuleModelCenter {
			var requestName:String = getQualifiedClassName(whenAskedFor);
			_classFors[requestName + '#' + named] = null;
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function deleteDataProxyInstance(request:Object, named:String = ""):IModuleModelCenter {
			var requestName:String = getQualifiedClassName(request);
			_useInstances[requestName + '#' + named] = null;
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getDataProxyByClassName(requestName:String, named:String = ""):Object {
			var key:String = requestName + '#' + named;
			var obj:Object = _useInstances[key];
			if (obj != null)
				return obj;
			obj = _classFors[key];
			if (obj is Class) {
				try {
					_useInstances[key] = new obj();
					return getDataProxyByClassName(requestName, named);
				} catch (e:Error) {
					ToolsMain.log.error("暂不支持构造函数带参数。[" + key + "]");
				}
			}
			ToolsMain.log.error("数据映射已被移除[" + key + "]");
			return null;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getDataProxyByObject(whenAskedFor:Object, named:String = ""):Object {
			return getDataProxyByClassName(getQualifiedClassName(whenAskedFor), named);
		}
		
		/**
		 * @inheritDoc
		 */
		public function intoInjectObject(obj:Object):Object {
			var typeXML:XML = ModuleLauncher.reflector.getDescribeType(obj);
			for each (var node:XML in typeXML.*.(name() == 'variable' || name() == 'accessor').metadata.(@name == 'InjectData')) {
				var propertyType:String = node.parent().@type.toString();
				var propertyName:String = node.parent().@name.toString();
				var injectionName:String = node.arg.attribute('value').toString();
				obj[propertyName] = getDataProxyByObject(ModuleLauncher.reflector.getDefinition(propertyType), injectionName);
				intoInjectObject(obj[propertyName]);
			}
			return obj;
		}
		
		public function intoInjectClass(cla:Class):Object {
			var obj:Object = new cla();
			return intoInjectObject(obj);
		}
	}
}
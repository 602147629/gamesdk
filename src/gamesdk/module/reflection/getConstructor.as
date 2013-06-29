package gamesdk.module.reflection {
	import flash.utils.Proxy;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	internal function getConstructor(value:Object):Class {
		if (value is Proxy || value is Number || value is XML || value is XMLList) {
			var fqcn:String = getQualifiedClassName(value);
			return Class(getDefinitionByName(fqcn));
		}
		return value.constructor;
	}
}
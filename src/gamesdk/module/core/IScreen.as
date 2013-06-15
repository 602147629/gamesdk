package gamesdk.module.core {
	
	/**
	 * 游戏的屏幕接口
	 * @author hanxianming
	 */
	public interface IScreen {
		function show():void;
		function dispose():void;
		function get screenId():uint;
		function set screenId(value:uint):void;
	}

}
gamesdk
=======

游戏开发包

分模块+RSL开发框架；使用源码编译请使用编译参数。

如果为starling版本的编译参数：

-define=CONFIG::flash_display,false
-define=CONFIG::starling_display,true

如果为flash版本的编译参数：

-define=CONFIG::flash_display,true
-define=CONFIG::starling_display,false


特点：

   1.可进行动态加载模块和非动态加载模块。
   
   2.支持flash显示对象和starling显示对象双版本。
   
   3.拥有屏幕Screen概念，每一个显示场景为一个Screen，只需要少量的代码即可完成场景屏幕的切换。
   
   4.支持依赖注入功能，包括静态属性字段和对象属性字段的注入。
   
   5.独特的反射概念管理，高性能的反射机制，反射的信息都被缓存。
   

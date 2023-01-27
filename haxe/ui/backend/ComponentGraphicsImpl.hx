package haxe.ui.backend;

import godot.CanvasItem;

class ComponentGraphicsImpl extends ComponentGraphicsBase {
   private var g(get, null):CanvasItem;

   function get_g():CanvasItem {
      return this._component.node;
   }

   var cX:Float = 0;
   var cY:Float = 0;
}

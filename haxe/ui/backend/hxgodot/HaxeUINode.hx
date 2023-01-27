package haxe.ui.backend.hxgodot;

import godot.Control;
import godot.variant.PackedStringArray;
import godot.variant.GDString;
import godot.Engine;
// import godot.Node2D;
import haxe.ui.core.Component;
import godot.variant.Color;
import godot.variant.Vector2;
import godot.variant.Rect2;

class HaxeUINode extends Control {
   public var component:Null<Component>;

   override function _draw() {
      super._draw();
      if (this.component != null)
         this.component.godot_draw();
   }

   override function _ready() {
      this.update_configuration_warnings();
   }

   /*override function draw_rect(rect:Rect2, color:Color, filled:Null<Bool>, width:Null<Float> = -1.0) {
      super.draw_rect(rect, color, filled, width);
      trace('drawing!');
   }*/
   override function _get_configuration_warnings():PackedStringArray {
      var warning = new PackedStringArray();
      warning.append('You cannot add HaxeUI components directly from the Godot editor!');
      return warning;
   }
}

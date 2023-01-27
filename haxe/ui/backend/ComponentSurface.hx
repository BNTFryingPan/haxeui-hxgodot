package haxe.ui.backend;

import godot.Node;
import haxe.ui.backend.hxgodot.HaxeUINode;

// typedef ComponentSurface = godot.Control;
class ComponentSurface {
   public var node:HaxeUINode;

   public function new() {
      trace('created canvas item');
      this.node = new HaxeUINode();
      this.node.component = cast this;
   }

   public function godot_draw() {
      // draw stuff
   }

   public function add_child(node:Node):Node {
      this.node.add_child(node);
      return node;
   }
}

package app;

import godot.Label;
import godot.variant.Color;
import godot.variant.Rect2;
import godot.Control;
import godot.Node;
import godot.Engine;
import haxe.ui.HaxeUIApp;
import haxe.ui.ComponentBuilder;
import haxe.ui.core.Component;

class HaxeUIRoot extends Control {
   @:access(haxe.ui.backend.ComponentImpl)
   override function _ready() {
      if (Engine.singleton().is_editor_hint()) {
         trace('in editor');
         // return;
      }

      // must pass a Node for `container` for haxeui to add stuff to
      /*var app = new HaxeUIApp({container: this});
         app.ready(function() {
            trace('ready!');
            var main:Component = ComponentBuilder.fromFile("assets/main.xml");
            app.addComponent(main);

            app.start();
      });*/

      var main:Component = ComponentBuilder.fromFile('assets/main.xml');
      this.add_child(main.node);
   }
}

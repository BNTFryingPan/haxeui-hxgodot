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

      /*var c = new Component();
         c.width = c.height = 200;
         c.style.backgroundColor = haxe.ui.util.Color.fromString('#00ff00');
         c.style.borderStyle = "solid";
         c.style.borderSize = 5;
         c.style.borderTopSize = 20;
         c.stlye.borderColor = 0x40d0e0;
         c.style.borderLeftColor = 0xffffff;
         c.ready();
         this.add_child(c.node);

         var c2 = new Component();
         c2.width = c2.height = 100;
         c2.top = c2.left = 50;
         c2.backgroundColor = 0xFF00FF;
         c2.ready();
         this.add_child(c2.node); */
   }
}

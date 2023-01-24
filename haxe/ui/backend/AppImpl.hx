package haxe.ui.backend;

import godot.DisplayServer;

class AppImpl extends AppBase {
   public function new() {}

   private override function init(onReady:Void->Void, onEnd:Void->Void = null) {
      onReady();
   }

   private override function set_icon(value:String):String {
      if (_icon == value)
         return value;
      _icon = value;

      DisplayServer.singleton().set_native_icon(value);

      return value;
   }
}

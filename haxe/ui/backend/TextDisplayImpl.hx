package haxe.ui.backend;

import godot.Label;

class TextDisplayImpl extends TextBase {
   public var label:Label;

   public function new() {
      super();
      trace('creating text display');
      label = createLabel();
      _text = "";
   }

   function createLabel() {
      var _label = new Label();
      trace('created');
      parentComponent.add_child(_label);
      trace('added');
      return _label;
   }

   private override function validateData() {
      trace('${ComponentImpl.pad(parentComponent.id)}: validate text data -> ${_text}');
      if (_text != null) {
         if (_dataSource == null) {
            label.text = _text;
         }
      }
   }

   private override function validateStyle():Bool {
      return true;
   }

   private override function validatePosition() {
      trace('${ComponentImpl.pad(parentComponent.id)}: validate text pos -> ${_left}, ${_top}');
   }

   private override function validateDisplay() {
      trace('${ComponentImpl.pad(parentComponent.id)}: validate text display -> ${_width}, ${_height}');
   }

   private override function measureText() {
      _textWidth = _text.length * 8; // fake it assuming each char is 8x8px
      _textHeight = 8;
   }
}

package haxe.ui.backend;

class TextDisplayImpl extends TextBase {
   private override function validateData() {
      trace('${ComponentImpl.pad(parentComponent.id)}: validate text data -> ${_text}');
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

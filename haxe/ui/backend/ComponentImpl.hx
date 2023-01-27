package haxe.ui.backend;

import godot.variant.Color;
import godot.variant.Vector2;
import godot.variant.Rect2;
import haxe.ui.core.Component;
import haxe.ui.core.TextDisplay;
import haxe.ui.events.UIEvent;
import haxe.ui.styles.Style;

class ComponentImpl extends ComponentBase {
   public function new() {
      super();
      recursiveReady();
   }

   private function recursiveReady() {
      var component:Component = cast(this, Component);
      component.ready();
      for (child in component.childComponents) {
         child.recursiveReady();
      }
   }

   public override function godot_draw() {
      trace('redrawing!');
      if (style.backgroundColor != null) {
         var bgcol:haxe.ui.util.Color = style.backgroundColor;
         node.draw_rect(Rect2.fromXYWidthHeight(0, 0, width, height), new Color(bgcol.r / 255, bgcol.g / 255, bgcol.b / 255), true);
      }
   }

   private override function handlePosition(left:Null<Float>, top:Null<Float>, style:Style) {
      // var transform = this.node.get_transform();

      if (left != null)
         node.position.x = left;
      if (top != null)
         node.position.y = top;

      trace(node.position.x);

      trace('${pad(this.id)}: move -> ${left}x${top}');
   }

   private override function handleSize(width:Null<Float>, height:Null<Float>, style:Style) {
      if (width == null || height == null || width < 0 || height < 0) {
         return;
      }

      this.node.set_size(new Vector2(width, height));

      trace('${pad(this.id)}: size -> ${width}x${height}');
   }

   //***********************************************************************************************************
   // Display tree
   //***********************************************************************************************************

   private override function handleSetComponentIndex(child:Component, index:Int) {
      trace('${pad(this.id)}: set component index -> ${child.id}, ${index}');
   }

   private override function handleAddComponent(child:Component):Component {
      trace('${pad(this.id)}: add component -> ${child.id}');
      this.node.add_child(child.node, null, 0);
      return child;
   }

   private override function handleAddComponentAt(child:Component, index:Int):Component {
      trace('${pad(this.id)}: add component at index -> ${child.id}, ${index}');
      this.node.add_child(child.node, null, 0);
      return child;
   }

   private override function handleRemoveComponent(child:Component, dispose:Bool = true):Component {
      trace('${pad(this.id)}: remove component -> ${child.id}');
      this.node.remove_child(child.node);
      return child;
   }

   private override function handleRemoveComponentAt(index:Int, dispose:Bool = true):Component {
      trace('${pad(this.id)}: remove component at index -> ${index}');
      this.node.remove_child(this.node.get_child(index));
      return null;
   }

   //***********************************************************************************************************
   // Style
   //***********************************************************************************************************
   private override function applyStyle(style:Style) {
      trace('${pad(this.id)}: apply style ->');
      this.node.queue_redraw();
      if (style.backgroundColor != null) {
         if (style.backgroundColorEnd != null) {
            trace('${pad("")}:     background color: 0x'
               + StringTools.hex(style.backgroundColor, 6)
               + ', '
               + StringTools.hex(style.backgroundColorEnd, 6));
         } else {
            trace('${pad("")}:     background color: 0x' + StringTools.hex(style.backgroundColor, 6));
         }
      }
      if (style.borderLeftSize != null && style.borderLeftColor != null) {
         trace('${pad("")}:     border left: ' + style.borderLeftSize + 'px, 0x' + StringTools.hex(style.borderLeftColor, 6));
      }
      if (style.borderTopSize != null && style.borderTopColor != null) {
         trace('${pad("")}:     border top: ' + style.borderTopSize + 'px, 0x' + StringTools.hex(style.borderTopColor, 6));
      }
      if (style.borderBottomSize != null && style.borderBottomColor != null) {
         trace('${pad("")}:     border bottom: ' + style.borderBottomSize + 'px, 0x' + StringTools.hex(style.borderBottomColor, 6));
      }
      if (style.borderRightSize != null && style.borderRightColor != null) {
         trace('${pad("")}:     border right: ' + style.borderRightSize + 'px, 0x' + StringTools.hex(style.borderRightColor, 6));
      }
   }

   //***********************************************************************************************************
   // Events
   //***********************************************************************************************************
   private override function mapEvent(type:String, listener:UIEvent->Void) {
      trace('${pad(this.id)}: map event -> ${type}');
   }

   private override function unmapEvent(type:String, listener:UIEvent->Void) {
      trace('${pad(this.id)}: unmap event -> ${type}');
   }

   //***********************************************************************************************************
   // Text related
   //***********************************************************************************************************
   public override function createTextDisplay(text:String = null):TextDisplay {
      if (_textDisplay == null) {
         trace('${pad(this.id)}: create text diplay');
      }
      return super.createTextDisplay(text);
   }

   //***********************************************************************************************************
   // Util
   //***********************************************************************************************************
   public static inline function pad(s:String, len:Int = 20):String {
      return StringTools.rpad(s, " ", len);
   }
}

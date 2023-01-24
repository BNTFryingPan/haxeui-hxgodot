package app;

import godot.Engine;
import godot.Control;
import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class HaxeUIRoot extends Control {
	override function _ready() {
		if (Engine.singleton().is_editor_hint())
			return;

		trace('creating app');
		var app = new HaxeUIApp();
		trace('created');
		app.ready(function() {
			trace('ready!');
			var main:Component = ComponentMacros.buildComponent("assets/main.xml");
			app.addComponent(main);

			app.start();
		});
	}
}

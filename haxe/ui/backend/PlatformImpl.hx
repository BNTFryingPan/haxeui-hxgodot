package haxe.ui.backend;

import godot.OS;

class PlatformImpl extends PlatformBase {
   private override function get_isWindows():Bool {
      var platformName = OS.singleton().get_name();
      if (platformName == 'Windows' || platformName == 'UWP') {
         return true;
      }
      return false;
   }

   private override function get_isLinux():Bool {
      var platformName = OS.singleton().get_name();
      if (platformName == 'Linux' || platformName.ends_with('BSD')) {
         return true;
      }
      return false;
   }

   private override function get_isMac():Bool {
      var platformName = OS.singleton().get_name();
      if (platformName == 'macOS') {
         return true;
      }
      return false;
   }

   private override function get_isMobile():Bool {
      var platformName = OS.singleton().get_name();
      if (platformName == 'Android' || platformName == 'iOS') {
         return true;
      }
      return false;
   }

   public override function getSystemLocale():String {
      return OS.singleton().get_locale();
   }
}

# haxeui-hxgodot

## Progress
able to position and draw boxes and basic borders, both with opacity.

## Contributing
### Setting up
```sh
git clone https://github.com/leotomasmc/haxeui-hxgodot

# if out of date or not installed yet
haxelib git haxeui-core https://github.com/haxeui/haxeui-core
haxelib git hxgodot https://github.com/hxgodot/hxgodot

cd haxeui-hxgodot
haxelib run hxgodot generate_bindings -y
```

### Running test app
```sh
cd test-app
haxelib run hxgodot generate_bindings -y # needed even if there are bindings generated in the haxeui-hxgodot folder
scons platform=<windows|linux|mac> target=<release|debug>
/path/to/godot -e
```
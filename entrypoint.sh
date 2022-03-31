#!/bin/sh -l

echo "Hello $1"
ln -s ./tests/references/userpref.blend ${BLENDER_PATH}/config/
blender -b --python /bpy_activate_addon.py --python-exit-code 1 -- $@
blender -b --addons sverchok --python utils/testing.py --python-exit-code 1 -- $@
time=$(date)
echo ::set-output name=time::$time
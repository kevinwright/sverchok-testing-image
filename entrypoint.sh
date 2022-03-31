#!/bin/sh -l

echo "Hello $1"
echo "${BLENDER_PATH}" 
cd /github/workspace
ln -s ./tests/references/userpref.blend ~/.config/blender/${BLENDER_VERSION}/config/
blender -background --python ./bpy_activate_addon.py --python-exit-code 1 -- $@
blender -background --addons sverchok --python ./utils/testing.py --python-exit-code 1 -- $@
time=$(date)
echo ::set-output name=time::$time
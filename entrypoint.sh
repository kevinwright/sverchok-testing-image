#!/bin/sh -l

echo "Installing Addon"
blender -b --python /bpy_activate_addon.py --python-exit-code 1 -- $@

echo "Installing userprefs"
mkdir -p ${BLENDER_CONFIG_PATH}
ln -s ./tests/references/userpref.blend ${BLENDER_CONFIG_PATH}

echo "Launching tests"
blender -b --addons sverchok --python utils/testing.py --python-exit-code 1 -- $@

time=$(date)
echo ::set-output name=time::$time
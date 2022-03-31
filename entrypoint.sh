#!/bin/sh -l

mkdir -p ${BLENDER_CONFIG_PATH}
ln -s ./tests/references/userpref.blend ${BLENDER_CONFIG_PATH}
blender -b --python /bpy_activate_addon.py --python-exit-code 1 -- $@
blender -b --addons sverchok --python utils/testing.py --python-exit-code 1 -- $@
time=$(date)
echo ::set-output name=time::$time
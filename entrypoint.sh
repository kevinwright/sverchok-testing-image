#!/bin/sh -l

echo $HOME
export BLENDER_VERSION=$(blender -b --version | head -n 1 | cut -d' ' -f2 | cut -d'.' -f 1-2)
set BLENDER_CONFIG_PATH="/github/home/.config/blender/${BLENDER_VERSION}/config"
echo "${BLENDER_CONFIG_PATH}"

echo "Installing Addon"
blender -b --python /bpy_activate_addon.py --python-exit-code 1 -- $@

echo "Installing userprefs"
mkdir -p "${BLENDER_CONFIG_PATH}"
ln -s ./tests/references/userpref.blend ${BLENDER_CONFIG_PATH}

echo "Launching tests"
blender -b --addons sverchok --python utils/testing.py --python-exit-code 1 -- $@

time=$(date)
echo ::set-output name=time::$time
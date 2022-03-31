#!/bin/sh -l

export BLENDER_VERSION=$(blender -b --version | head -n 1 | cut -d' ' -f2 | cut -d'.' -f 1-2)
export BLENDER_CONFIG_PATH="/github/home/.config/blender/${BLENDER_VERSION}/config"
echo "HOME = $HOME"
echo "BLENDER_CONFIG_PATH = ${BLENDER_CONFIG_PATH}"

echo ""
echo "Installing Addon"
echo "================"

blender -b --python /bpy_activate_addon.py --python-exit-code 1 -- $@

echo ""
echo "Installing userprefs"
echo "===================="

mkdir -p "${BLENDER_CONFIG_PATH}"
ln -s ./tests/references/userpref.blend ${BLENDER_CONFIG_PATH}

echo ""
echo "Launching tests"
echo "==============="

blender -b --addons sverchok --python utils/testing.py --python-exit-code 1 -- $@

time=$(date)
echo ::set-output name=time::$time
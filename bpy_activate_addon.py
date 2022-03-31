import bpy

# Register the addon and enable it
bpy.ops.preferences.addon_install(filepath='/github/workspace/sverchok.zip')
bpy.ops.preferences.addon_enable(module='sverchok')


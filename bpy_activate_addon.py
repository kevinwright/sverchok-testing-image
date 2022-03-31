import bpy

# Register the addon and enable it
bpy.ops.preferences.addon_install(filepath='sverchok.zip')
bpy.ops.preferences.addon_enable(module='sverchok')


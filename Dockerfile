 
FROM nytimes/blender:2.93-cpu-ubuntu18.04
ENV BLENDER_CONFIG_PATH=${HOME}/.config/blender/2.83/config

RUN ${BLENDERPIP} install --upgrade pip setuptools wheel
RUN ${BLENDERPIP} install --upgrade pip scipy geomdl scikit-image

COPY bpy_activate_addon.sh /bpy_activate_addon.sh
RUN mkdir -p ${BLENDER_CONGIG_PATH}
COPY entrypoint.sh ${BLENDER_CONFIG_PATH}/entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

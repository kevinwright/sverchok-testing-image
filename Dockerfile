 

FROM nytimes/blender:2.93-cpu-ubuntu18.04

RUN ${BLENDERPIP} install --upgrade pip setuptools wheel scipy geomdl scikit-image
RUN ${BLENDERPIP} install --upgrade PyMCubes circlify cython numba

COPY bpy_activate_addon.py /bpy_activate_addon.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

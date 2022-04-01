 
ARG BLENDER_VERSION 
FROM nytimes/blender:${BLENDER_VERSION:-2.93}-cpu-ubuntu18.04

RUN ${BLENDERPIP} install --upgrade pip setuptools wheel scipy geomdl scikit-image
RUN ${BLENDERPIP} install --upgrade PyMCubes circlify cython numba
RUN ${BLENDERPIP} install numpy=1.22.3

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

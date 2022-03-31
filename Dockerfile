 
FROM nytimes/blender:2.93-cpu-ubuntu18.04

RUN ${BLENDERPIP} install --upgrade pip setuptools wheel
RUN ${BLENDERPIP} install --upgrade pip scipy geomdl scikit-image


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

FROM continuumio/anaconda:4.4.0

WORKDIR /
RUN conda create --name snappyEnv python=3.4
RUN /bin/bash -c "source activate snappyEnv"
RUN mkdir snapInstall

WORKDIR snapInstall
RUN wget -O esa-snap_sentinel_unix_5_0.sh http://step.esa.int/downloads/5.0/installers/esa-snap_sentinel_unix_5_0.sh
RUN chmod +x esa-snap_sentinel_unix_5_0.sh
RUN ./esa-snap_sentinel_unix_5_0.sh -q

WORKDIR /opt/snap/bin/
RUN ./snappy-conf /opt/conda/envs/snappyEnv/bin/python

WORKDIR /root/.snap/snap-python/snappy
RUN echo "java_max_mem: 4G" >> snappy.ini
RUN python setup.py install

WORKDIR /opt/snap/snap/modules/lib/x86_64/
RUN ln -s ../amd64/libjhdf5.so
RUN ln -s ../amd64/libjhdf.so
RUN apt-get install unzip

WORKDIR /s2png
RUN mkdir /data
#RUN pip install jpy
#RUN python ./sentinel2A_to_rgb.py /testdata/*/MTD_MSIL1C.xml /data/s2.png
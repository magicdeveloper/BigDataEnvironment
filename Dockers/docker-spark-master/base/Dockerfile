ARG HADOOP_BASE=3.2.0-debian
FROM mdt/hadoop-base:${HADOOP_BASE}

LABEL maintainer = "mohamed ghname <engghname@gmail.com>"

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.4.3

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

ADD https://raw.githubusercontent.com/guilhem/apt-get-install/master/apt-get-install /usr/bin/
RUN chmod +x /usr/bin/apt-get-install

# COPY spark-2.4.3-bin-without-hadoop.tgz /tmp/spark.tgz
# RUN tar -xvzf /tmp/spark.tgz -C / \
#     && mv spark-${SPARK_VERSION}-bin-without-hadoop spark \
#     && rm /tmp/spark.tgz \
#     && cd /

RUN apt-get-install -y curl wget \
      && chmod +x *.sh \
      && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && mv spark-${SPARK_VERSION}-bin-without-hadoop spark \
      && rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      #&& cd /css \
      #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
      && cd /

ENV SPARK_HOME /spark/

#RUN apt-get-install -y python3 python3-setuptools python3-pip python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy
ENV PATH /opt/conda/bin:$PATH
#ENV PATH /opt/conda/bin:/opt/conda/lib/python3.5/site-packages:$PATH
ENV PYSPARK_PYTHON /opt/conda/bin/python
ENV PYSPARK_DRIVER_PYTHON /opt/conda/bin/python
ENV PYTHONPATH /opt/conda/bin/python
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc
#---------------------------------------------------------

RUN python --version
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
RUN conda config --add channels conda-forge
RUN conda update -n base -c defaults conda
RUN conda update conda -c conda-canary
RUN conda config --set channel_priority true
RUN conda config --get channels
RUN python --version
RUN conda update --all
# #RUN conda install maven
#-------------------install python library-----------------------------------------------
RUN conda install -y \
    numpy matplotlib pyspark py4j pandas pandasql scipy scikit-learn \
    networkx bokeh statsmodels seaborn  pandas-datareader \
    Keras tensorflow h5py
 
RUN conda install -y -c conda-forge findspark hdfs3 libhdfs3 fastparquet 
RUN conda install -y -c conda-forge tabulate xgboost hdf5 mlflow opencv pillow
RUN conda install -y -c conda-forge pyarrow
RUN conda install -y -c conda-forge eli5 shap pdpbox
RUN pip install librosa

#
RUN pip install PyHDFS hdfs scrapy tensorflowonspark pydataset dist-keras   

# # Install Geopandas (v 0.3.0) --> bundled with click, click-plugins, cligj, curl, descartes, expat, fiona, freexl, gdal, geos, hdf4, hdf5, kealib, krb5, libiconv, libnetcdf, libpq, libspatialindex, libspatialite, libtiff, libxml2, munch, openjpeg, pcre, proj4, psycopg2, pyproj, pysal, rtree, shapely, sqlalchemy, xerces-c
# # Install cartopy (v 0.15.1) --> bundled with libxslt, lxml, olefile, owslib, pillow, pyepsg, pyshp
RUN conda install -y -c conda-forge geopandas cartopy

# # Install geoplot (v 0.0.4) using pip (on Linux: be sure to use pip that comes with conda distribution!) --> bundled with seaborn
RUN pip install geoplot Cython contextlib2 requests

# # Install osmnx (v 0.5.4) --> bundled with altair, bleach, branca, colorama, entrypoints, folium, geopy, html5lib, ipykernel, ipython, ipython_genutils, jedi, jsonschema, jupyter_client, jupyter_core, mistune, nbconvert, nbformat, notebook, pandoc, pandocfilters, pickleshare, prompt_toolkit, pygments, pyzmq, simplegeneric, testpath, traitlets, vega, vincent, wcwidth, webencodings
# # Install Folium (v 0.5.0) --> bundled with altair, vega
RUN conda install -y -c conda-forge osmnx folium
#RUN conda install -c conda-forge folium
# # Install Dash using Pip
RUN pip install dash==0.19.0  # The core dash backend
RUN pip install dash-renderer==0.11.1  # The dash front-end
RUN pip install dash-html-components==0.8.0  # HTML components
RUN pip install dash-core-components==0.14.0  # Supercharged components
RUN pip install cufflinks --upgrade   # cufflinks for Plotly graphing library
RUN pip install plotly --upgrade  # Plotly graphing library

RUN pip install graphviz pydot  opencv-python d6tflow
# for music and audio analysis.
RUN pip install librosa
#RUN pip install nltk
RUN conda install -c conda-forge nltk -y
# install flask flask-restful
RUN pip install flask
RUN conda install -y -c conda-forge flask-restful
#RUN conda install -c pytorch pytorch -y

RUN pip install -e git+https://github.com/SohierDane/BigQuery_Helper#egg=bq_helper
RUN pip install imageai
RUN pip install ipywidgets
 
 

#RUN conda install -y -c conda-forge kaggle
RUN conda update --all
#------------------------------------------------------------------
RUN python --version
#RUN conda update
#Give permission to execute scripts
#-------------------------------------------------------------------------------
# https://github.com/bernhard-42/advanced-angular-for-pyspark/blob/master/notebooks/Advanced%20Angular%20for%20Pyspark.md
# install advanced-angular-for-pyspark for angular session
RUN git clone https://github.com/bernhard-42/advanced-angular-for-pyspark  && \
    pip install ./advanced-angular-for-pyspark  && \
    rm -rf advanced-angular-for-pyspark  

#-------------------------------------------------------------------------------

RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1

COPY hive-site.xml /spark/conf/
COPY spark-env.sh /spark/conf/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
#-----------------------------------------------
RUN python --version
RUN python3 --version
RUN nano --version
RUN conda --version

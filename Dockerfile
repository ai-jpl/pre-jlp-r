FROM python:latest

#install mecab:
RUN apt-get update
RUN apt-get install -y mecab
RUN apt-get install -y libmecab-dev
RUN apt-get install -y mecab-ipadic-utf8

# CRF++
# RUN wget "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ" -O CRF++-0.58.tar.gz
COPY ./vendors/CRF++-0.58.tar.gz /tmp/CRF++-0.58.tar.gz

# pip
COPY requirements.txt /home
WORKDIR /home
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN cd /tmp && tar zxfv CRF++-0.58.tar.gz
RUN cd /tmp/CRF++-0.58/ && ./configure && make && make install
RUN ldconfig
RUN cd / && rm -rf /tmp/*

# RUN LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib && export LD_LIBRARY_PATH
# cabocha
# RUN wget "https://googledrive.com/host/0B4y35FiV1wh7cGRCUUJHVTNJRnM/cabocha-0.69.tar.bz2" -O cabocha-0.69.tar.bz2
COPY ./vendors/cabocha-0.69.tar.bz2 /tmp/cabocha-0.69.tar.bz2
RUN cd /tmp && bzip2 -dc cabocha-0.69.tar.bz2 | tar xvf -
RUN cd /tmp/cabocha-0.69 \
    && ./configure --with-mecab-config=`which mecab-config` --with-charset=UTF8 \
    && make \
    && make install \
    && cd python \
    && python setup.py build \
    && python setup.py install
RUN ldconfig
RUN cd / && rm -rf /tmp/*


# Cabocha Python wrapper
RUN pip install git+https://github.com/kenkov/cabocha.git

# jProcessing
# RUN pip install git+git://github.com/kevincobain2000/jProcessing.git
# RUN pip install git+https://github.com/taku910/cabocha.git#subdirectory=python
# RUN pip install cabocha-python

COPY test.py /home


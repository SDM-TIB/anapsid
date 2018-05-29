
FROM ubuntu:16.04
MAINTAINER Kemele M. Endris <keme686@gmail.com>

USER root

#Python 2.7 installation
RUN apt-get update && \
    apt-get install -y --no-install-recommends  nano wget git curl && \
    apt-get install -y --no-install-recommends python2.7 python-pip python-setuptools && \
    pip install --upgrade pip

ADD . /anapsid

RUN cd /anapsid && pip install -r requirements.txt && \
    python setup.py install


RUN mkdir /data
WORKDIR /data

EXPOSE 5000

CMD ["tail", "-f", "/dev/null"]

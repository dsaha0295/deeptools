FROM ubuntu:16.04

#Install ubuntu packages
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
	curl \
	libtool

#Install python3 and pip
RUN apt-get install -y \
    python3 \
	python3-dev \
	python3-pip \
	libz-dev \
    libssl-dev \
	libcurl4-openssl-dev

#Install python modules
RUN pip3 install --upgrade pip
RUN pip3 install \
	numpy \
	scipy \
	py2bit \
	pysam \
	matplotlib \
	pyBigWig \
    deeptoolsintervals \
	plotly

#Install deeptools 3.5.0
WORKDIR /usr/local/bin

RUN	wget -O deepTools.tar.gz https://github.com/deeptools/deepTools/archive/3.5.0.tar.gz && \
	tar xzvf deepTools.tar.gz && \
	rm deepTools.tar.gz && \
	mv deepTools* deepTools && \
	cd deepTools && \
	python3 setup.py install

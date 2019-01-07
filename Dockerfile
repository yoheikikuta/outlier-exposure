FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
LABEL maintainer="diracdiego@gmail.com"
LABEL version="1.0"

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    git \
    curl

RUN pip3 install --upgrade pip

RUN curl -O https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
RUN bash Anaconda3-2018.12-Linux-x86_64.sh -b
RUN rm Anaconda3-2018.12-Linux-x86_64.sh
ENV PATH /root/anaconda3/bin:$PATH

RUN conda install -y pytorch torchvision -c pytorch

WORKDIR /work

CMD ["/bin/bash"]


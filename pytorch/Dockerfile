#FROM ubuntu:latest
#
## 设置时区为Asia/Shanghai
#RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone &&\
#    apt-get update && \
#    apt-get install -y --no-install-recommends \
#    python3 \
#    python3-pip \
#    python3-setuptools \
#    python3-dev \
#    build-essential \
#    git \
#    curl  \
#    cmake && \
#    rm -rf /var/lib/apt/lists/* &&\
#    pip3 install torch torchvision && \
#    curl -sL https://deb.nodesource.com/setup_lts.x | bash - && \
#    apt-get install -y nodejs && \
#    npm install -g npm@latest && \
#    rm -rf /var/lib/apt/lists/* && \
#    pip3 install jupyterlab && \
#    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
#    jupyter labextension install @jupyterlab/toc && \
#    jupyter labextension install @jupyterlab/git && \
#    jupyter labextension install @jupyterlab/github
#
## 设置工作目录
#WORKDIR /app
#
#
## 启动 JupyterLab
#CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

# 第一阶段：构建 PyTorch 和其他依赖项
FROM ubuntu:20.04 AS build

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone && \
    apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavformat-dev \
    libswscale-dev \
    libpq-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone --recursive https://github.com/pytorch/pytorch.git && \
    cd pytorch && \
    pip3 install -r requirements.txt && \
    python3 setup.py install

# 第二阶段：构建最终的应用程序镜像
FROM ubuntu:20.04

COPY --from=build /usr/local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    libglib2.0-0 \
    libgl1-mesa-glx \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir jupyterlab torch torchvision

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]


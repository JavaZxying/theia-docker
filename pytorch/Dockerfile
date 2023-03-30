# 基于 Ubuntu18.04 镜像构建
FROM ubuntu:18.04

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    curl \
    git \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y python3.9
# 安装 JupyterLab
RUN pip3 install --upgrade jupyterlab


# 安装 PyTorch
RUN pip3 install torch torchvision

# 暴露 JupyterLab 端口
EXPOSE 8888

# 设置工作目录
WORKDIR /work

# 启动 JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

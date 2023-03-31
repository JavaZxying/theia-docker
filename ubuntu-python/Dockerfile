# 设置基础镜像为 Ubuntu 18.04
FROM ubuntu:18.04

# 更新 apt 包管理器并安装必要的软件包
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.6 python3.6-dev python3.6-venv python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制当前目录下的所有文件到容器的 /app 目录中
COPY . /app

# 安装应用程序所需的依赖
RUN pip3 install --no-cache-dir -r requirements.txt

# 启动应用程序
CMD ["python3.6", "app.py"]

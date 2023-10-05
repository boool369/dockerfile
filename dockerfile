# 使用一个基础镜像，例如 Ubuntu
FROM ubuntu:20.04

# 安装 SSH 客户端，以便在容器内部登录
RUN apt-get update && apt-get install -y openssh-client

# 安装 Docker
RUN curl -sSL https://get.docker.com/ | CHANNEL=stable bash

# 安装 Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# 创建工作目录
WORKDIR /app

# 下载 neko 的 Docker Compose 文件
RUN wget https://raw.githubusercontent.com/m1k1o/neko/master/docker-compose.yaml

# 在容器内启动 neko（请根据实际情况调整）
CMD ["docker-compose", "up", "-d"]

# 暴露 neko 使用的端口（假设 neko 使用端口 80）
EXPOSE 80

#!/usr/bin/env bash

docker run -d -p 5432:5432 --name postgres -e POSTGRES_PASSWORD=postgres postgres

# 拉取镜像
docker pull postgres

# 创建数据卷
docker volume create postgre-data

# 创建并运行容器

docker run --restart=always -p 6379:6379 --name redis -d redis --requirepass redis_password


docker run --name pgvecto-rs \
    -v postgre-data:/var/lib/postgresql/data \
    -e LANG=C.UTF-8 \
    -e POSTGRES_PASSWORD=postgres \
    -p 5432:5432 \
    -d tensorchord/pgvecto-rs:pg16-v0.2.0

    
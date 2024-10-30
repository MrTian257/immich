#!/usr/bin/env bash



# 创建并运行 redis 容器
docker run --restart=always -p 6379:6379 --name redis -d redis --requirepass redis_password

# 创建数据卷
docker volume create postgre-data
# 创建并运行 postgres 数据库（pgvecto-rs版本） 容器, 目前可升级到最高 tensorchord/pgvecto-rs:pg16-v0.4.0
docker run --name pgvecto-rs \
    -v postgre-data:/var/lib/postgresql/data \
    -e LANG=C.UTF-8 \
    -e POSTGRES_PASSWORD=postgres \
    -p 5432:5432 \
    -d tensorchord/pgvecto-rs:pg16-v0.2.0
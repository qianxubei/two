# 阶段1：编译C代码（构建阶段）
FROM gcc:13 AS builder
WORKDIR /src
COPY . .
RUN make

# 阶段2：运行镜像（最终产物，只有二进制程序）
FROM alpine:3.20
WORKDIR /app
# alpine没有glibc，如果你的程序依赖glibc，换成debian:slim
COPY --from=builder /src/app /app/app
CMD ["/app/app"]

# BASE_VERSION 由工作流按 git tag 传入（默认 4.4.0），避免版本号写死
ARG BASE_VERSION=4.4.0
FROM ghcr.io/jiangchuanso/kkfileview-base:${BASE_VERSION}
# buildx 在跨平台构建时会自动注入 TARGETARCH（amd64 / arm64），
# 据此拷贝对应架构构建产物，避免不同架构共用同一包导致 sevenzipjbinding native 库冲突
ARG TARGETARCH
ADD dist/kkFileView-${TARGETARCH}.tar.gz /opt/
RUN ln -s /opt/kkFileView-* /opt/kkFileView
ENV KKFILEVIEW_BIN_FOLDER=/opt/kkFileView/bin
ENTRYPOINT ["sh", "-c", "exec java -Dfile.encoding=UTF-8 -Dspring.config.location=/opt/kkFileView/config/application.properties -jar /opt/kkFileView/bin/kkFileView-*.jar"]
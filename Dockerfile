FROM ghcr.io/jiangchuanso/kkfileview-base:4.4.0
ADD server/target/kkFileView-*.tar.gz /opt/
RUN ln -s /opt/kkFileView-* /opt/kkFileView
ENV KKFILEVIEW_BIN_FOLDER=/opt/kkFileView/bin
ENTRYPOINT ["sh", "-c", "exec java -Dfile.encoding=UTF-8 -Dspring.config.location=/opt/kkFileView/config/application.properties -jar /opt/kkFileView/bin/kkFileView-*.jar"]
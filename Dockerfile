FROM  registry.cn-hangzhou.aliyuncs.com/opert/kkfileview-jdk:4.3.0
MAINTAINER chenjh "842761733@qq.com"
ADD server/target/kkFileView-*.tar.gz /opt/
ENV KKFILEVIEW_BIN_FOLDER /opt/kkFileView-4.3.0-SNAPSHOT/bin
ENTRYPOINT ["java","-Dfile.encoding=UTF-8","-Dspring.config.location=/opt/kkFileView-4.3.0-SNAPSHOT/config/application.properties","-jar","/opt/kkFileView-4.3.0-SNAPSHOT/bin/kkFileView-4.3.0-SNAPSHOT.jar"]

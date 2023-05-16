FROM  ubuntu:20.04
MAINTAINER chenjh "842761733@qq.com"
# 内置一些常用的中文字体，避免普遍性乱码
COPY fonts/* /usr/share/fonts/chinese/
RUN sed -i 's@ports.ubuntu.com@mirrors.tuna.tsinghua.edu.cn@g;s@archive.ubuntu.com@mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list &&\
    apt-get clean && apt-get update &&\
	sed -i 's/# deb/deb/g' /etc/apt/sources.list &&\
	apt-get install -y --reinstall ca-certificates &&\
	apt-get clean && apt-get update &&\
	apt-get install -y locales language-pack-zh-hans &&\
	localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 && locale-gen zh_CN.UTF-8 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
	apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
	apt-get install -y fontconfig ttf-mscorefonts-installer ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy &&\
	apt-get install -y wget


# 安装 libreoffice
RUN apt-get install -y libxrender1 libxinerama1 libxt6 libxext-dev libfreetype6-dev libcairo2 libcups2 libx11-xcb1 libnss3 &&\
    apt-get install -y libreoffice && \
    apt-get clean && apt-get autoremove


#  清理临时文件
RUN	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/* &&\
    cd /usr/share/fonts/chinese &&\
    mkfontscale &&\
    mkfontdir &&\
    fc-cache -fv

ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
CMD ["/bin/bash"]

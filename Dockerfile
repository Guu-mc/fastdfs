FROM debian:stretch-slim

ADD fastdfs-5.11.tar.gz /usr/local/
ADD libfastcommon-1.0.39.tar.gz /usr/local/

RUN apt-get update
RUN apt-get -y install make cmake gcc gcc-6

RUN set -ex; \
	cd /usr/local/libfastcommon-1.0.39; \
        ./make.sh && ./make.sh install

RUN set -ex; \
        cd /usr/local/fastdfs-5.11; \
        ./make.sh && ./make.sh install

ENV FASTDFS_VERSION 5.11
ENV FASTDFS_TRACKER tracker
ENV FASTDFS_STORAGE storage
ENV SERVER storage

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]


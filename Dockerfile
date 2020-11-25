FROM docker.io/alpine

RUN echo "#aliyun" > /etc/apk/repositories
RUN echo "https://mirrors.aliyun.com/alpine/v3.6/main/" >> /etc/apk/repositories
RUN echo "https://mirrors.aliyun.com/alpine/v3.6/community/" >> /etc/apk/repositories
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add curl
RUN apk add openssl
RUN apk add util-linux
RUN apk add --update --no-cache bind-tools
RUN curl -O https://raw.githubusercontent.com/risfeng/aliyun-ddns-shell/master/src/aliyun/aliyun-ddns.sh
RUN chmod 777 ./aliyun-ddns.sh
RUN mv /aliyun-ddns.sh /opt/aliyun-ddns.sh
RUN sed -i 's#LOG_FILE_PATH=""#LOG_FILE_PATH="/etc/logs/ddns.log"#g' /opt/aliyun-ddns.sh
RUN echo "*/15    *       *       *       *       /opt/aliyun-ddns.sh -run" >> /var/spool/cron/crontabs/root 

# 0/20 * * * * ? 0 */20 * * * ?
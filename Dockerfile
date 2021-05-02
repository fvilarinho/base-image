FROM alpine:latest

LABEL maintainer="fvilarinho@concepting.com.br"

ENV TZ=America/Sao_Paulo

ENV SETTINGS_HOSTNAME=host.docker.internal
ENV SETTINGS_PORT=2379
ENV SETTINGS_URL=http://${SETTINGS_HOSTNAME}:${SETTINGS_PORT}

ENV HOME_DIR=/home/user
ENV BIN_DIR=${HOME_DIR}/bin
ENV ETC_DIR=${HOME_DIR}/etc
ENV DATA_DIR=${HOME_DIR}/data
ENV LIB_DIR=${HOME_DIR}/lib
ENV LOG_DIR=${HOME_DIR}/log

RUN apk update && \
    apk --no-cache add ca-certificates \
                       tar \
                       bash \
                       bash-completion \
                       tzdata \
                       figlet \
                       vim \
                       jq \
                       unzip \
                       curl \
                       wget \
                       bind-tools \
                       net-tools \
                       whois \
                       busybox-extras \
                       openssh-client \
                       outils-md5 && \
    apk --no-cache \ 
        --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \ 
        add etcd-ctl            
                       
RUN addgroup -S group && \
    adduser -S user -G group

RUN mkdir -p ${HOME_DIR} \
             ${BIN_DIR} \
             ${ETC_DIR} \
             ${DATA_DIR} \
             ${LIB_DIR} \
             ${LOG_DIR}

COPY bin/* ${BIN_DIR}/
COPY .env ${ETC_DIR}/.release

RUN chmod +x ${BIN_DIR}/* && \
    chown -R user:group ${HOME_DIR} && \
    chmod -R o-rwx ${HOME_DIR}

RUN ln -s ${BIN_DIR}/startup.sh /entrypoint.sh    

USER user                       
                       
WORKDIR ${HOME_DIR}

ENTRYPOINT ["/entrypoint.sh"]
FROM alpine:3.12.1

LABEL maintainer="fvilarinho@concepting.com.br"

ENV TZ=America/Sao_Paulo

ENV APP_NAME=app
ENV APP_VERSION=1.0.0

ENV HOME_DIR=/opt/concepting
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
                       outils-md5
                       
RUN addgroup -S group && \
    adduser -S user -G group

RUN mkdir -p ${HOME_DIR} \
             ${BIN_DIR} \
             ${ETC_DIR} \
             ${DATA_DIR} \
             ${LIB_DIR} \
             ${LOG_DIR} && \
    chmod -R og-rwx ${DATA_DIR} && \
    chown -R user:group ${HOME_DIR} && \
    chown -R user:group ${BIN_DIR} && \
    chown -R user:group ${ETC_DIR} && \
    chown -R user:group ${DATA_DIR} && \
    chown -R user:group ${LIB_DIR} && \
    chown -R user:group ${LOG_DIR}

USER user                       
                       
WORKDIR ${HOME_DIR}
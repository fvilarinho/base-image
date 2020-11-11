Synopsys
========

This a base image to build Docker containers.
It's based on Alpine Linux and contains a basic structure/tool for a container such as:

- `bash / bash-completion`
- `vim / jq`
- `zip / unzip / tar / gzip`
- `curl / wget`
- `bind-tools / net-tools / whois / telnet`
- `openssh-client`


The directory structure of the container is defined by the environment variables described below:

- `HOME_DIR:` Home directory of the all files.
- `BIN_DIR:` Must contains all binaries and executables.
- `ETC_DIR:` Must contains all the configurations.
- `DATA_DIR:` Must contains all the generated/persistent data.
- `LIB_DIR:` Must contains all the libraries/resources.


The name and the version of the container is defined by the environment variables described below:

- `APP_NAME:` Name of the container.
- `APP_VERSION:` Version of the container.


Build status
============

![CI/CD](https://github.com/concepting-com-br/base-image/workflows/Docker/badge.svg)


Installation
============

To use this image, just put the line below in your Dockerfile.

`FROM ghcr.io/concepting-com-br/base-image:latest`


License
=======

This image is licensed under the Apache 2.0. Please read the licence file or check the URL [https://www.apache.org/licenses/LICENSE-2.0.txt](https://www.apache.org/licenses/LICENSE-2.0.txt)


Author
======

My name is Felipe Vilarinho (A.K.A Vila) and you can know more about me at the social medias below:

1. [LinkedIn](https://br.linkedin.com/in/fvilarinho)

Or send an email to fvilarinho@gmail.com or fvilarinho@concepting.com.br

Have Fun!

Best
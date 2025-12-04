Synopsys
========

This a base image to build Docker containers.
It's based on Alpine Linux and contains a basic structure and tools for a container such as:

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


How to use
==========

Just put the line below in your Dockerfile.

`FROM ghcr.io/fvilarinho/base-image:1.2.0` - To use the last stable version.

`FROM ghcr.io/fvilarinho/base-image:latest` - To use the development version.


License
=======

This image is licensed under the Apache 2.0. Please read the licence file or check the URL [https://www.apache.org/licenses/LICENSE-2.0.txt](https://www.apache.org/licenses/LICENSE-2.0.txt)


Contact
=======
**Website:** - https://vilanet.sh

**e-Mail:**
- fvilarinho@gmail.com
- fvilarinho@outlook.com
- me@vila.net.br

and that's all! Have fun!

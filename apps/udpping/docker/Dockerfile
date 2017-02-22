FROM ubuntu:16.04
MAINTAINER Max Plauth <max.plauth@hpi.de>

RUN mkdir /tmp/udpping

WORKDIR /tmp/udpping

RUN apt-get update && apt-get install -y \
        wget \
        build-essential \
        make
RUN wget --no-check-certificate "https://raw.githubusercontent.com/plauth/lightweight-vm-performance/master/apps/udpping/generic/udpping.c"
RUN cc -DSERVER=\"[IP_OF_CONTAINER_HOST]\" udpping.c -o udpping

RUN mv udpping /usr/sbin

CMD ["udpping"]
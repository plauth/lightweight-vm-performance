FROM ubuntu:16.04
MAINTAINER Max Plauth <max.plauth@hpi.de>

RUN mkdir /tmp/udpping

WORKDIR /tmp/udpping

RUN apt-get update && apt-get install -y \
        wget \
        build-essential \
        make
RUN wget --no-check-certificate "https://www.dcl.hpi.uni-potsdam.de/media/udpping.c"
RUN cc -DSERVER=\"192.168.42.42\" udpping.c -o udpping

RUN mv udpping /usr/sbin

CMD ["udpping"]
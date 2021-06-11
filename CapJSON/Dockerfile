FROM alpine:3.10

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update -qq && apk upgrade

RUN apk add --no-cache coreutils git build-base cmake libpcap-dev openssl-dev libtins-dev

RUN git clone https://github.com/adriancostin6/CapJSON.git

RUN \
cd CapJSON && mkdir external && cd external && \
git clone https://github.com/Tencent/rapidjson.git && \
cd rapidjson && mv include ../ && rm -rf * && mv ../include .

RUN mkdir /CapJSON/build && \
cd /CapJSON/build && cmake .. && make && mv cap-json /bin

COPY run.sh /
RUN chmod +x /run.sh
VOLUME /logs

CMD exec /run.sh

FROM ubuntu:20.04

RUN apt update && apt --yes install openconnect curl

COPY src /src

CMD /src/connect_vpn.sh

HEALTHCHECK --start-period=10s \
    CMD /src/vpn_is_connected.sh

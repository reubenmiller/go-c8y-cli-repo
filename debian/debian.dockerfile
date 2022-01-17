FROM debian:11

RUN apt update \
    && apt install -y reprepro
ENV GPG_PRIVATE_KEY=
VOLUME [ "/repo" ]

CMD "/repo/scripts/build-debian.sh"

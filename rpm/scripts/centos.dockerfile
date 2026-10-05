FROM quay.io/centos/centos:stream10

RUN dnf install -y createrepo rpm-sign pinentry gnupg2
ENV GPG_PRIVATE_KEY=
VOLUME [ "/repo" ]

CMD ["/repo/scripts/build-rpm.sh"]

FROM centos:8

RUN yum install -y dnf createrepo rpm-sign pinentry
ENV GPG_PRIVATE_KEY=
VOLUME [ "/repo" ]

CMD "/repo/scripts/build-rpm.sh"

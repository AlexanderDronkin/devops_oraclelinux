FROM oraclelinux:8.7

ARG TIMEZONE=Europe/Moscow

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY ./certs/* /usr/share/pki/ca-trust-source/anchors/

RUN set -x; \
# Set TimeZone
    ln -fs /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
# Install basic utils
	&& dnf install --assumeyes oracle-epel-release-el8-1.0 \
        && dnf install --assumeyes nano-2.9.8 bash-completion-2.7 telnet-0.17 ca-certificates-2022.2.54 bind-utils-9.11.36 less-530 glibc-langpack-ru bind-utils netcat which \
	&& dnf clean all \
# Iupdate trust CA
	&& update-ca-trust
ENV LANG en_US.utf8


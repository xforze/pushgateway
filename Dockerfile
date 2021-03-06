FROM quay.io/prometheus/busybox-linux-amd64:latest
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/linux-amd64/pushgateway /bin/pushgateway
RUN chown nobody:nogroup /bin/pushgateway
EXPOSE 9091
RUN mkdir -p /pushgateway && chown nobody:nogroup /pushgateway
WORKDIR /pushgateway

USER 65534

ENTRYPOINT [ "/bin/pushgateway" ]

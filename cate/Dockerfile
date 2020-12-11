###############################################################################
# The FUSE driver needs elevated privileges, run Docker with --privileged=true
###############################################################################

FROM alpine:latest

ENV DATA_MOUNT_POINT /var/s3

VOLUME /var/s3

ARG GOOFYS_VERSION=0.24.0

RUN apk --update add bash vim wget curl fuse
RUN wget https://github.com/kahing/goofys/releases/download/v${GOOFYS_VERSION}/goofys
RUN chmod u+x ./goofys && mv goofys /usr/local/bin

CMD ["/usr/local/bin/goofys", "-f", "--region", "eu-central-1", "eurodatacube", "/var/s3"]


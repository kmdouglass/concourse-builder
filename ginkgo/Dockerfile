FROM golang:1.13-buster

ENV SRC_DIR=/home/concourse-builder/src
ENV USERNAME=concourse-builder

# Setup the source code directory and the non-root user
RUN useradd -ms /bin/bash "${USERNAME}" \
 && mkdir -p "${SRC_DIR}" \
 && echo "${USERNAME}:${USERNAME}" | chpasswd \
 && chown -R "${USERNAME}:${USERNAME}" /home/"${USERNAME}"

VOLUME ${SRC_DIR}
USER ${USERNAME}
WORKDIR ${SRC_DIR}

# Install ginkgo and gomega
RUN go get github.com/onsi/ginkgo/ginkgo \
 && go get github.com/onsi/gomega/...

# Packages are skipped because postgres is not available in the container
ENTRYPOINT ["ginkgo", "-skipPackage=atc/db,atc/gc,atc/integration,cmd/concourse,skymarshal/dexserver,testflight,topgun"]
CMD ["--help"]

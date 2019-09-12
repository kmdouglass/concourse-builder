FROM golang:1.13-buster

ENV BUILD_SCRIPT_DIR=/usr/local/bin
ENV SRC_DIR=/home/concourse-builder/src
ENV USERNAME=concourse-builder

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Setup the source code directory and the non-root user
RUN useradd -ms /bin/bash "${USERNAME}" \
 && mkdir -p "${SRC_DIR}" \
 && echo "${USERNAME}:${USERNAME}" | chpasswd \
 && chown -R "${USERNAME}:${USERNAME}" /home/"${USERNAME}"

COPY build.sh ${BUILD_SCRIPT_DIR}

VOLUME ${SRC_DIR}
USER ${USERNAME}
WORKDIR ${SRC_DIR}

ENTRYPOINT ["build.sh"]
CMD ["--help"]

ARG REGISTRY_GROUP_URL \
    CRICTL_VERSION \
    UID=1000
FROM ${REGISTRY_GROUP_URL}/jenkins/inbound-agent:alpine-jdk8
ENV XDG_RUNTIME_DIR=/run/user/"${UID}" \
    HOME=/home/jenkins \
    USER=jenkins
USER root
RUN apk add --update --no-cache \
    img \
    git \
    libseccomp \
    shadow-uidmap \
    ca-certificates && \
    mkdir -p /run/user/"${UID}" && \
    chown -R jenkins /run/user/"${UID}" && \
    echo jenkins:100000:65536 | tee /etc/subuid | tee /etc/subgid
USER jenkins

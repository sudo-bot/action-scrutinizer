FROM php:8.1-cli-alpine3.14

ARG RELEASE_VERSION=latest

# Metadata params
ARG VCS_REF
ARG BUILD_DATE

COPY entrypoint.sh /entrypoint.sh

ADD https://scrutinizer-ci.com/ocular.phar /bin/ocular
# https://scrutinizer-ci.com/ocular.phar.sha1

RUN echo "Downloaded release version: ${RELEASE_VERSION}" && chmod +x /bin/ocular && php /bin/ocular --version

# Add git to allow the action to list remotes
RUN apk add --no-cache --update git && git --version

# Metadata
LABEL org.label-schema.vendor="Sudo-Bot" \
    org.label-schema.url="https://github.com/sudo-bot/action-scrutinizer#readme" \
    org.label-schema.name="Scrutinizer coverage action" \
    org.label-schema.description="Scrutinizer coverage action for GitHub actions" \
    org.label-schema.version=${RELEASE_VERSION} \
    org.label-schema.vcs-url="https://github.com/sudo-bot/action-scrutinizer.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.docker.schema-version="1.0"

ENTRYPOINT ["/entrypoint.sh"]

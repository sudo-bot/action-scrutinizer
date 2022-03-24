FROM php:8.1-cli-alpine3.14

ARG RELEASE_VERSION=latest

# Metadata params
ARG VCS_REF
ARG BUILD_DATE

COPY entrypoint.sh /entrypoint.sh

COPY --from=composer:2.3 /usr/bin/composer /usr/bin/composer

# Add git to allow the action to list remotes
RUN apk add --no-cache --update git && \
    git --version && \
    composer --version && \
    COMPOSER_BIN_DIR="/usr/bin" composer global require --no-cache scrutinizer/ocular:^1.9 && \
    RELEASE_VERSION="$(composer global show scrutinizer/ocular 2>/dev/null | cut -d ' '  -f 2)" && \
    echo "Downloaded release version: ${RELEASE_VERSION}" && \
    # https://github.com/scrutinizer-ci/ocular/blob/1.9/src/Scrutinizer/Ocular/Ocular.php#L12
    sed -i "s,@revision@,${RELEASE_VERSION}," /root/.composer/vendor/scrutinizer/ocular/src/Scrutinizer/Ocular/Ocular.php && \
    php -l /root/.composer/vendor/scrutinizer/ocular/src/Scrutinizer/Ocular/Ocular.php && \
    ocular --version && \
    ocular --help

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

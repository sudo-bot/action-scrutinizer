FROM php:8.2-cli-alpine3.20

ARG RELEASE_VERSION="^1.9"

# Metadata params
ARG VCS_REF
ARG BUILD_DATE

COPY entrypoint.sh /entrypoint.sh

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Add git to allow the action to list remotes
RUN apk add --no-cache --update git && \
    git --version && \
    composer --version && \
    COMPOSER_BIN_DIR="/usr/bin" composer global require --no-cache scrutinizer/ocular:${RELEASE_VERSION} && \
    composer global show scrutinizer/ocular 2>/dev/null && \
    RELEASE_VERSION="$(php -r "require_once '/root/.composer/vendor/autoload.php';echo \Composer\InstalledVersions::getVersion('scrutinizer/ocular');")" && \
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
    org.label-schema.docker.schema-version="1.0" \
    \
    com.docker.extension.publisher-url="https://github.com/wdes" \
    \
    org.opencontainers.image.title="Scrutinizer coverage action" \
    org.opencontainers.image.description="Scrutinizer coverage action for GitHub actions" \
    org.opencontainers.image.authors="williamdes@wdes.fr" \
    org.opencontainers.image.url="https://github.com/sudo-bot/action-scrutinizer#readme" \
    org.opencontainers.image.documentation="https://github.com/sudo-bot/action-scrutinizer#readme" \
    org.opencontainers.image.source="https://github.com/sudo-bot/action-scrutinizer" \
    org.opencontainers.image.vendor="Sudo-Bot" \
    org.opencontainers.image.licenses="MPL-2.0" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.version=${RELEASE_VERSION} \
    org.opencontainers.image.revision=${VCS_REF} \
    org.opencontainers.image.ref.name="latest"

ENTRYPOINT ["/entrypoint.sh"]

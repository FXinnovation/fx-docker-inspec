ARG RUBYIMAGE_VERSION=2.6.6-alpine3.12
FROM ruby:${RUBYIMAGE_VERSION}
ARG RUBYIMAGE_VERSION

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV CACERTIFICATES_VERSION="20191127-r4" \
    GIT_VERSION="2.26.2-r0" \
    INSPEC_BIN_VERSION="4.23.15" \
    OPENSSH_VERSION="8.3_p1-r0"

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

ENTRYPOINT ["inspec"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="inspec" \
      "org.label-schema.base-image.name"="docker.io/library/ruby" \
      "org.label-schema.base-image.version"=$RUBYIMAGE_VERSION \
      "org.label-schema.description"="Inspec in a container" \
      "org.label-schema.url"="https://inspec.io/" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-inspec" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.ca-certificates.version"=$CACERTIFICATES_VERSION \
      "org.label-schema.applications.inspec-bin.version"=$INSPEC_BIN_VERSION \
      "org.label-schema.applications.git.version"=$GIT_VERSION \
      "org.label-schema.applications.openssh.version"=$OPENSSH_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Please see README.md"

ARG RUBYIMAGE_VERSION=3.0.2-alpine3.14
FROM ruby:${RUBYIMAGE_VERSION}
ARG RUBYIMAGE_VERSION

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV CACERTIFICATES_VERSION="20191127-r5" \
    GIT_VERSION="2.30.2-r0" \
    INSPEC_BIN_VERSION="4.38.9" \
    OPENSSH_VERSION="8.4_p1-r3"

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

ENTRYPOINT ["inspec"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="inspec" \
      "org.label-schema.base-image.name"="docker.io/library/ruby" \
      "org.label-schema.base-image.version"=$RUBYIMAGE_VERSION \
      "org.label-schema.description"="Inspec in a container" \
      "org.label-schema.url"="https://inspec.io/" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-inspec" \
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

FROM ruby:2.6.3-alpine3.9

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV CACERTIFICATES_VERSION="20190108-r0" \
    GIT_VERSION="2.20.1-r0" \
    INSPEC_BIN_VERSION="4.3.2" \
    OPENSSH_VERSION="7.9_p1-r5"

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="inspec" \
      "org.label-schema.base-image.name"="docker.io/library/ruby" \
      "org.label-schema.base-image.version"="2.6.3-alpine3.9" \
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

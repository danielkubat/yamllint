FROM alpine:3
LABEL maintainer="dan.kubat@gmail.com"

# disable output buffering
ENV PYTHON_UNBUFFERED=TRUE

# yamllint package version
ENV YAMLLINT_VERSION=1.23.0

# apk packages to install
ENV PACKAGES_APK "bash python3 ca-certificates"

# update index and install apk packages
RUN apk --no-cache update && \
    apk --no-cache add --update $PACKAGES_APK

# install and upgrade pip
RUN python3 -m ensurepip && \
    pip3 install --upgrade pip

# install yamllint
RUN pip3 install --no-cache-dir yamllint=="$YAMLLINT_VERSION"

ENTRYPOINT ["yamllint"]
CMD ["--help"]

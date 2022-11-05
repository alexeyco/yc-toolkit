FROM redocly/openapi-cli:latest

ENV GOROOT=/usr/lib/go \
    GOPATH=/go \
    PATH=/go/bin:$PATH

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
      go \
      make \
      upx \
      zip \
    && go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest \
    && go version \
    && upx --version \
    && gomplate --version \
    && openapi --version

WORKDIR $GOPATH

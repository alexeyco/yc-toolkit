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
    && go version \
    && upx --version \
    && openapi --version

WORKDIR $GOPATH

ENTRYPOINT [""]

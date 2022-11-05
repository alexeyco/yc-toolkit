FROM golang:alpine as builder

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
      upx \
    && go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest \
    && upx -9 -qvfk /go/bin/gomplate

FROM redocly/openapi-cli:latest

COPY --from=builder /go/bin/gomplate /usr/bin/

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

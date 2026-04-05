ARG VERSION

# Build HUGO from golang first, tired of the version incompatibilies
FROM cgr.dev/chainguard/wolfi-base:latest AS hugo

RUN apk update
RUN apk add --no-cache hugo
RUN hugo version

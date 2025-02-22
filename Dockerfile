
# Build HUGO from golang first, tired of the version incompatibilies
FROM cgr.dev/chainguard/wolfi-base:latest as hugo

RUN apk update
RUN apk add hugo



# Build HUGO from golang first, tired of the version incompatibilies
FROM cgr.dev/chainguard/wolfi-base:latest as hugo
#FROM docker.io/ubuntu:latest as hugo

RUN apk update && apk add hugo



# Build HUGO from golang first, tired of the version incompatibilies
FROM golang:latest AS GOLANG

WORKDIR /go/src
RUN git clone https://github.com/gohugoio/hugo --branch release-0.68.3

WORKDIR /go/src/hugo
RUN go build -o hugo main.go

FROM debian:latest as hugo

# Move the built HUGO executable to this image
COPY --from=GOLANG /go/src/hugo/hugo /usr/local/bin

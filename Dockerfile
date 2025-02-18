
# Build HUGO from golang first, tired of the version incompatibilies
FROM docker.io/golang:latest AS GOLANG

WORKDIR /go/src
RUN git clone -b v0.144.1 https://github.com/gohugoio/hugo

WORKDIR /go/src/hugo
# Enable extended edition of HUGO (https://gohugo.io/installation/linux/#build-from-source)
RUN CGO_ENABLED=1 go build -tags extended -o hugo main.go

FROM docker.io/ubuntu:latest as hugo

# Move the built HUGO executable to this image
COPY --from=GOLANG /go/src/hugo/hugo /usr/local/bin

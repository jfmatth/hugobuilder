export version=v0.2
# docker build . -t jfmatth/hugobuilder:$version
# docker push jfmatth/hugobuilder:$version

echo "Logging into gibhub container registry, use PAT"
podman login --username jfmatth ghcr.io
podman  build . -t ghcr.io/jfmatth/hugobuilder:$version
podman  push ghcr.io/jfmatth/hugobuilder:$version
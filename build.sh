export version=v0.139.3
# docker build . -t jfmatth/hugobuilder:$version
# docker push jfmatth/hugobuilder:$version

# Podman login credentials in ~/.config/containers/auth.json (https://docs.podman.io/en/latest/markdown/podman-login.1.html#examples)
podman login ghcr.io
podman  build . -t ghcr.io/jfmatth/hugobuilder:$version
podman  push ghcr.io/jfmatth/hugobuilder:$version
set /p version=<VERSION
set image=ghcr.io/jfmatth/hugobuilder

podman login ghcr.io
podman build . -t %image%:%version% -t %image%:latest

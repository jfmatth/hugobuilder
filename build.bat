set /p version=<VERSION
set image=ghcr.io/jfmatth/hugobuilder

podman login ghcr.io
podman build . --no-cache -t %image%:%version% -t %image%:latest

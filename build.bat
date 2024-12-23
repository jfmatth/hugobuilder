set /p version=<VERSION
set image=ghcr.io/jfmatth/hugobuilder
@REM # docker build . -t jfmatth/hugobuilder:$version
@REM # docker push jfmatth/hugobuilder:$version

@REM # Podman login credentials in ~/.config/containers/auth.json (https://docs.podman.io/en/latest/markdown/podman-login.1.html#examples)
podman login ghcr.io
podman  build . -t %image%:%version%
podman  push %image%:%version%
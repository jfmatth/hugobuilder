export version=v0.1
docker build . -t jfmatth/hugobuilder:$version
docker push jfmatth/hugobuilder:$version
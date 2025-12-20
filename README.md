# A Docker container to build HUGO websites

HUGO (www.gohugo.io) is an excellent static site generator written in GO.  HUGO is quick to build and easy to use.

However, some of the distributions out there aren't up to date with the latest version of HUGO, and when using HUGO in containers I ran into issues using the distribution version of HUGO, so I built this container - jfmatth/hugobuilder.

## What does this container do?

Starting from the golang:latest container (which contains the GO language), it pulls down the latest stable branch of HUGO and compiles it into it's own container.  See Dockerfile for more information.


## Builds

### Local Builds
```
podman machine start
.\build.bat
```

If successful, then commit to master and push

### github actions
This simple container allowed me to learn github actions.  Every checkin to master will cause a new build of the image.

I typically update the VERSION file and Dockerfile for each release of HUGO.

##  Using the hugobuilder container

I use this container to build my sample hugo site.

It's easy to use, checkout the Dockerfile at my repo (https://github.com/jfmatth/justneverlift.com.git)
```
FROM ghcr.io/jfmatth/hugobuilder:v0.139.3 as HUGO

# Copy the contents of the current working directory to the static-site directory.
COPY . /static-site

# Command Hugo to build the static site from the source files,
# setting the destination to the public directory.
RUN hugo --logLevel debug --source=/static-site --destination=/static-site/public

# Install NGINX, remove the default NGINX index.html file, and
# copy the built static site files to the NGINX html directory.
# FROM docker.io/nginx
FROM cgr.dev/chainguard/nginx
COPY --from=HUGO /static-site/public/ /usr/share/nginx/html/
```


# A Docker container to build HUGO websites

HUGO (www.gohugo.io) is an excellent static site generator written in GO.  HUGO is quick to build and easy to use.

However, some of the distributions out there aren't up to date with the latest version of HUGO, and when using HUGO in containers I ran into issues using the distribution version of HUGO, so I built this container - jfmatth/hugobuilder.

Feel free to use this in your project to build your static site files, and then move those into maybe an NGINX container hosting your files.

I have an example below

## What does this container do

Starting from the golang:latest container (which contains the GO language), it pulls down the latest stable branch of HUGO and compiles it into it's own container.  See Dockerfile for more information.


## Building the container yourself

simply run build.sh and it will build the container and push up to my docker.io repository, and you may use it from there.

```
$./build.sh
```

-OR-

```
docker build . -t jfmatth/hugobuilder:latest
docker push jfmatth/hugobuilder:latest
```

## Example of using the hugobuilder container

I use this container to build my sample hugo site.

It's easy to use, here's an example of my Dockerfile for my site (https://github.com/jfmatth/lke-example.git)

```
FROM jfmatth/hugobuilder:latest as HUGO

# Copy the contents of the current working directory to the static-site directory.
COPY . /static-site

# Command Hugo to build the static site from the source files,
# setting the destination to the public directory.
RUN hugo -v --source=/static-site --destination=/static-site/public

# Install NGINX, remove the default NGINX index.html file, and
# copy the built static site files to the NGINX html directory.
FROM nginx:stable-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=HUGO /static-site/public/ /usr/share/nginx/html/

# Instruct the container to listen for requests on port 80 (HTTP).
EXPOSE 80
```

The built nginx container with the HUGO static site is about 28mb without any images.

### Github action attached.

Attached to this repo is a github action to rebuild the container and push to docker upon a push to master


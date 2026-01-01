# A Docker container to build HUGO websites

HUGO (www.gohugo.io) is an excellent static site generator written in GO.  HUGO is quick to build and easy to use.

However, some of the distributions out there aren't up to date with the latest version of HUGO, and when using HUGO in containers I ran into issues using the distribution version of HUGO, so I built this container - jfmatth/hugobuilder.

## What does this container do?

Using the Chainguard base container, add hugo and save the container as hugobuilder

## Builds

### Local Builds
Using the function I have on my system, ```build``` it will look for the ```IMAGE``` and ```VERSION``` files to determine the name of the image and it's tag.  

There is an optional ```-push``` flag that will push it to the remote repo.

```
build 
```

You should test the build locally before commiting any changes to master, as that will cause GH Action to build and push the image as well.

##  Using the hugobuilder container

I use this container to build my sample hugo site.

It's easy to use, checkout the Dockerfile at my repo (https://github.com/jfmatth/justneverlift.com.git)
```
FROM ghcr.io/jfmatth/hugobuilder:latest as HUGO

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


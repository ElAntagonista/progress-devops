# Overview
In this lecture we are discussing Docker as a container solution.

## Slides
[here](http://tiny.cc/scaikz)

# Docker install

curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker $USER

su - $USER

# Commands
## Docker bind
The process of building a docker image involves describing the image first in a [Dockerfile](https://gist.github.com/50bd623c39a3a3d801bd6227539a1fa5)
Simples docker build command would be:

`docker build -t <image_name> .`
In this case `.` is the context you provide for the build, it should containt the Dockerfile.
## Docker run
Once you have an image built you can run a container from using the `docker run` command.
The simplest form would be:

`docker run <image_name>`

If you'd like to run a different CMD in attach to container's terminal

`docker run -it <image_name> sh`

If you'd like to clean any leftovers of the container after it's been killed

`docker run --rm <image_name>`
## List running containers
`docker ps`
All containers
`docker ps -a`
## List images
`dokcer images`
## Kill a container
`docker kill <container_id>`

## Docker volume
`docker volume create`

### Attach the volume
`docker run -v volume-name:/<path_to_container> <image_name>`

### Attach readonly 
`docker run -v volume-name:<path_to_container>:ro <image_name>`

# Repository
## Login
The default repository is Docker Hub.
To login you'd need to have an account created at https://hub.docker.com/ 
The command to login is:

`docker login`


## Create a repo and push
`docker tag <image_name>:<tag> <username>/<repo>:<tag>`
`docker push <username>/<image_name>:<tag>`
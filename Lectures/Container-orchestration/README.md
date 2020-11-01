# Overview
In this lecture we are discusing container orchestration with an emphasis on docker compose and kubernetes.

# Slides
You could find the slides to this lecture [here](http://tiny.cc/m8vlkz)

## Pre-setup
If you'd like to test the examples in this lecture you could bring up the vagrant box defined in the vagrantfile in this directory.
**Commands**:

`vagrant up`

`vagrant ssh`

## Docker-compose

**Commands:**

To bring up an environment:

`docker-compose up -d`

To bring down an environment:

`docker-compose down`

There's a Wordpress demo in the Docker-Compose directory. You could test it out using the vagrant environment.

## Kubernetes
[Here](https://linuxacademy.com/blog/containers/kubernetes-cheat-sheet/)'s a really good cheatsheet for `kubectl`

To bring up the wordpress example in the Kubernetes directory
you'd need to `cd` to it and then execute `kubectl apply -k ./`.
To bring it down `kubectl delete -k ./`.

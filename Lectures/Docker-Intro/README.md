# Docker install
sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

apt-cache policy docker-ce

sudo usermod -aG docker ${USER}

# Docker repo
## Login
`docker login`

## Create a repo and push
`docker tag <image_name>:<tag> <username>/<repo>:<tag>`
`docker push <username>/<image_name>:<tag>`

## Docker volume
`docker volume create`

### Attach the volume
`docker run -v volume-name:/path/in/container image`

### Attach readonly 
`docker run -v volume-name:/path/in/container:ro image`

## Docker bind




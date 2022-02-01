# make sure jq & curl is installed
sudo apt update
sudo apt install -y curl jq
# set which version to download (latest)
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
# download to /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# make the file executable
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
mkdir docker-compose-nginx-tutorial && cd $_
code docker-compose.yaml
# version: "3.8"
# services:
#  nginx:
#    image: nginx:alpine
#    ports:
#    - target: 80
#      protocol: tcp

docker-compose up -d
docker-compose ps
# localhost port can be seen in the table when running the command above
curl localhost:(include port number from above)
docker-compose up -d --scale nginx=3
docker-compose ps
docker-compose down --rmi all

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
printf "version: "3.8"\nservices:\n nginx:\n   image: nginx:alpine\n   ports:\n   - target: 80\n     protocol: tcp" >> docker-compose.yaml
# code docker-compose.yaml
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
VAR1="`docker inspect docker-compose-nginx-tutorial-nginx-1 | grep -Eo '(^|[ ,])"HostPort":[^,]*' | awk '{ $1=""; print}' | cut -c 3-7 | sed 's/"//g' | sort -u | sed -r '/^\s*$/d'`"
VAR2="`docker inspect docker-compose-nginx-tutorial-nginx-2 | grep -Eo '(^|[ ,])"HostPort":[^,]*' | awk '{ $1=""; print}' | cut -c 3-7 | sed 's/"//g' | sort -u | sed -r '/^\s*$/d'`"
VAR3="`docker inspect docker-compose-nginx-tutorial-nginx-3 | grep -Eo '(^|[ ,])"HostPort":[^,]*' | awk '{ $1=""; print}' | cut -c 3-7 | sed 's/"//g' | sort -u | sed -r '/^\s*$/d'`"

curl localhost:(include port number from above)

curl localhost:$VAR1
curl localhost:$VAR2
curl localhost:$VAR3
docker-compose up -d --scale nginx=3
docker-compose ps
docker-compose down --rmi all

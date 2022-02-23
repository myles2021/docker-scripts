mkdir docker_networking_tutorial && cd $_
docker network create my-network
docker run -d --network my-network --name server mrbilalshafiq/http-server-python:latest
docker run -d --network my-network -p 80:80 --name nginx mrbilalshafiq/docker-network-nginx
curl localhost
curl ifconfig.me
docker rm -f server nginx
docker rmi mrbilalshafiq/http-server-python:latest mrbilalshafiq/docker-network-nginx:latest 

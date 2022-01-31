sudo apt-get update
sudo apt install curl -y
curl https://get.docker.com | sudo bash
sudo usermod -aG docker $(whoami)
docker run --rm hello-world 

# if permission denied, try sudo chmod 666 /var/run/docker.sock

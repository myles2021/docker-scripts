sudo apt-get update
sudo apt install curl -y
curl https://get.docker.com | sudo bash
sudo chmod 666 /var/run/docker.sock
sudo usermod -aG docker $(whoami)
docker run -d -p 8080:8080 --name jenkins_container jenkins/jenkins
docker ps
docker exec jenkins_container cat var/jenkins_home/secrets/initialAdminPassword
# docker stop jenkins_container
# docker rm jenkins_container

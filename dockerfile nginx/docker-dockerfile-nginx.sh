mkdir dockerfile_exercises
cd dockerfile_exercises
touch Dockerfile
ls
printf 'FROM nginx:latest\nRUN printf "Myles the Docker Master" > /usr/share/nginx/html/index.html' >> Dockerfile
# code Dockerfile 
# FROM nginx:latest
# RUN printf "Myles the Docker Master\n" > /usr/share/nginx/html/index.html
docker build -t ournginx .
docker run -d -p 80:80 --name nginx ournginx
docker ps
docker ps -a
curl localhost:80
# docker stop nginx
# docker rm nginx
# docker rmi ournginx

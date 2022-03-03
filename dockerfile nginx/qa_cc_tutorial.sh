mkdir task2
cd task2
touch Dockerfile
printf 'FROM nginx:1.19.0\n' >> Dockerfile
docker build -t ournginx .
docker run -d --rm -p 8888:80 --name web nginx:1.19.0


docker run -d --name pine challenge


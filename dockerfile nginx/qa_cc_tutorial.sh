mkdir task2
cd task2
touch Dockerfile
printf 'FROM nginx:1.19.0\n' >> Dockerfile
docker build -t ournginx .
docker run -d --rm -p 8888:80 --name web nginx:1.19.0


docker run -d --name pine challenge


touch Dockerfile

printf 'FROM busybox:1.31.1\nCOPY . .\nENV FLASK_RUN_HOST=0.0.0.0\nEXPOSE 5000\nCMD ["nc", "-lv", "-p", "5000;"]' >> Dockerfile
docker build -t myapp:0.0.1 .

docker alpine:3.12.0 alpine:challenge

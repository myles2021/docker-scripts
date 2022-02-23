mkdir docker_volumes
cd docker_volumes
docker volume create webpage
docker run -d -p 80:80 --name nginx --mount type=volume,source=webpage,target=/usr/share/nginx/html nginx
docker exec -it nginx apt update
docker exec -it nginx apt install -y vim
docker exec -it nginx vi /usr/share/nginx/html/index.html
# <!DOCTYPE html>
# <html>
# <head>
#   <meta charset="UTF-8">
#   <title>NGINX</title>
# </head>
# <body>
#        <h3>index.html file stored in a Docker Volume</h3>
# </body>
# </html>

docker stop nginx
docker rm nginx
docker run -d -p 80:80 --name nginx --volume webpage:/usr/share/nginx/html nginx
curl localhost:80
curl ifconfig.me
docker run -d -p 81:80 --name nginx2 --volume webpage:/usr/share/nginx/html nginx
curl localhost:81
docker exec -it nginx2 apt update
docker exec -it nginx2 apt install -y vim
docker exec -it nginx2 vi /usr/share/nginx/html/index.html
# <!DOCTYPE html>
# <html>
# <head>
#   <meta charset="UTF-8">
#   <title>NGINX</title>
# </head>
# <body>
#        <h3>Updated file shown on both containers</h3>
# </body>
# </html>

curl localhost:80
curl localhost:81
docker stop nginx nginx2
# docker rm nginx nginx2
# docker rmi nginx
# docker volume rm webpage

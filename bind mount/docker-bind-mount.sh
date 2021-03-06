mkdir bind_mounts_exercise
touch bind_mounts_exercise/nginx.conf
cd bind_mounts_exercise/
# code nginx.conf 
# events {}
# http {
#    server {
#        listen 80;
#        location / {
#            return 200 "NGINX";
#        }
#    }
# }

printf '\nevents {}\nhttp {\n   server {\n       listen 80;\n       location / {\n           return 200 "NGINX";\n       }\n   }\n}\n' >> nginx.conf

docker run -d -p 80:80 --name nginx --mount type=bind,source=$(pwd)/nginx.conf,target=/etc/nginx/nginx.conf nginx
curl localhost
docker stop nginx
# docker rm nginx
# docker rmi nginx

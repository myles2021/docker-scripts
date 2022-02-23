docker run -d -p 80:80 --name nginx nginx
docker ps
docker ps -qa
docker logs `docker ps -q -l`
docker exec `docker ps -q -l` touch myfile.txt
docker exec -it `docker ps -q -l` bash
exit
docker stop `docker ps -q -l`
docker start `docker ps -q -l`
docker rename `docker ps -q -l` app_db
docker ps
docker ps -a
docker stop app_db
docker start app_db
docker stop app_db
docker rm app_db
docker ps
docker ps -a

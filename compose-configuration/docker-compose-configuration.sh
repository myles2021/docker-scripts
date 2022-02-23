mkdir docker-compose-tutorial && cd $_
mkdir nginx flask-app
touch nginx/nginx.conf flask-app/app.py flask-app/Dockerfile docker-compose.yaml
code nginx/nginx.conf 
# events {}
# http {
#     server {
#         listen 80;
#         location / {
#             proxy_pass http://flask-app:5000;
#         }
#     }
# }

code flask-app/app.py
# from flask import Flask

# app = Flask(__name__)

# @app.route('/')
# def hello():
#   return "Hello Internet"

# if __name__=='__main__':
#   app.run(host='0.0.0.0', port=5000, debug=True)

code flask-app/Dockerfile
# FROM python:3.5
# RUN apt-get update && apt-get install -y python3-pip
# COPY . .
# RUN pip3 install flask
# EXPOSE 5000
# ENTRYPOINT ["/usr/local/bin/python3", "app.py"]

code docker-compose.yaml
# version: "3.8"
# services:
#   flask-app:
#     build: ./flask-app
#     ports:
#     - target: 5000
#       published: 5000
#       protocol: tcp
#   nginx:
#     image: nginx:latest
#     ports:
#     - target: 80
#       published: 80
#       protocol: tcp
#     volumes:
#     - type: bind
#       source: ./nginx/nginx.conf
#       target: /etc/nginx/nginx.conf

docker-compose up -d
curl localhost:5000
curl localhost:80
curl ifconfig.me
docker-compose down --rmi all

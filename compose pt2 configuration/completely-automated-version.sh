mkdir docker-compose-tutorial && cd $_
mkdir nginx flask-app
touch nginx/nginx.conf flask-app/app.py flask-app/Dockerfile docker-compose.yaml

printf "events {}\nhttp {\n    server {\n        listen 80;\n        location / {\n            proxy_pass http://flask-app:5000;\n        }\n    }\n}" >> nginx/nginx.conf

printf "from flask import Flask\n\napp = Flask(__name__)\n\n@app.route('/')\ndef hello():\n  return \"Hello Internet\"\n\nif __name__=='__main__':\n  app.run(host='0.0.0.0', port=5000, debug=True)" >> flask-app/app.py

printf 'FROM python:3.5\nRUN apt-get update && apt-get install -y python3-pip\nCOPY . .\nRUN pip3 install flask\nEXPOSE 5000\nENTRYPOINT ["/usr/local/bin/python3", "app.py"]' >> flask-app/Dockerfile

printf 'version: "3.8"\nservices:\n  flask-app:\n    build: ./flask-app\n    ports:\n    - target: 5000\n      published: 5000\n      protocol: tcp\n  nginx:\n    image: nginx:latest\n    ports:\n    - target: 80\n      published: 80\n      protocol: tcp\n    volumes:\n    - type: bind\n      source: ./nginx/nginx.conf\n      target: /etc/nginx/nginx.conf' >> docker-compose.yaml

docker-compose up -d
curl localhost:5000
curl localhost:80
curl ifconfig.me
docker-compose down --rmi all

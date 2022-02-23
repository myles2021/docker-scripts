mkdir myapp
cd myapp
touch app.py
code app.py 
# @app.route('/home')
# @app.route('/')
# def home():
#     return "Hello world!"

# if __name__ == '__main__':
#     app.run(port=5000, host='0.0.0.0', debug=True)

touch Dockerfile
code Dockerfile 
# # Python base image.
# FROM python:3.7
# # Create and set the work directory inside the image named 'app'
# WORKDIR /app
# # Execute a pip install command using the list 'requirements.txt'
# RUN pip install Flask
# # Copy the app file into the image working directory
# COPY app.py .
# # State the listening port for the container. 
# EXPOSE 5000
# # Run 'python app.py' on container start-up. This is the main process.
# ENTRYPOINT ["python", "app.py"]



docker build -t myapp .
docker run -d -p 5000:5000 --name myapp myapp
curl ifconfig.me
curl localhost:5000
# docker stop myapp
# docker rm myapp
# docker rmi myapp

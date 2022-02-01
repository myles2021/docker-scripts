mkdir ignore_exercise
cd ignore_exercise
touch Dockerfile
code Dockerfile
# build from the latest alpine image
# alpine is a very lightweight distribution of Linux
FROM alpine:latest
# copy everything from the context to the container
COPY . /context
# display everything that has been copied to the container
RUN ls -al /context

mkdir docs
touch app.py my-notes.md README.md .dockerignore
code .dockerignore
# # ignore the docs folder
# docs
# # ignore all markdown files
# *.md
# # in this case, we can make an exception for the README
# !README.md

docker build -t my-image:latest .
docker rmi my-image alpine

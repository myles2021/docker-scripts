git clone https://github.com/mrbilalshafiq/docker-java-app && cd docker-java-app
vi Dockerfile
#  # build from the Maven image which has a maven environment configured already
# FROM maven:latest

# # copy our application in
# COPY . /build

# # change the working directory to where we are building the application
# WORKDIR /build

# # use maven to build the application
# RUN mvn clean package

# # create a new build stage from the Java image which has java installed already
# FROM java:8

# # change the working directory to where the application is going to be installed
# WORKDIR /opt/hello-world

# # copy the JAR file that was created in the previous build stage to the application folder in this build stage
# COPY --from=0 /build/target/hello-world-1.0.0.jar app.jar

# # create an entrypoint to run the application
# ENTRYPOINT ["/usr/bin/java", "-jar", "app.jar"]

 
docker build -t spring-hello-world .
docker run -d -p 8080:8080 --name spring-app spring-hello-world
curl localhost:8080
curl ifconfig.me
# docker stop spring-app
# docker rm spring-app
#  docker system prune -a
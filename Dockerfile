FROM eclipse-temurin:11-jdk

WORKDIR /app

COPY target/hello-world-1.0-SNAPSHOT.jar /app/hello-world.jar

EXPOSE 8090

# Add the server.port paramater if u don't use springboot default port 8080
CMD ["java", "-jar", "hello-world.jar", "--server.port=8090"]

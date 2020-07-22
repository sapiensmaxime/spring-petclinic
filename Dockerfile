# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

WORKDIR /data
 

EXPOSE 8081

COPY . ./
RUN ./mvnw package
COPY data/*.jar ./petclinic.jar
CMD ["java", "-jar", "/data/petclinic.jar", "--server.port=8081"]

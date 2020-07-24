FROM openjdk:11.0.5-jdk-slim as BUILDER
WORKDIR /petclinic
COPY .mvn /petclinic/.mvn
COPY pom.xml /petclinic/pom.xml
COPY mvnw /petclinic/mvnw
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline
COPY src /petclinic/src
RUN ./mvnw package -DskipTests

# --------------------------------

# Production build
FROM openjdk:8-jdk-alpine AS production

# Expose container port
EXPOSE 8081

# Create app directory into Docker container
WORKDIR /data

# Bundle app source
COPY --from=BUILDER /data/target/*.jar ./petclinic.jar

# Let's run the app!
CMD ["java", "-jar", "/data/petclinic.jar", "--server.port=8081", "--spring.profiles.active=mysql"]

# Use the official maven image as the base image
FROM maven:3.8.1-openjdk-11

# Copy the local src directory (where this Dockerfile lives and where you run the docker build command) into the container's /app directory
COPY ./src /app/src
COPY ./pom.xml /app

# Set the working directory inside the container
WORKDIR /app

# Build the application
RUN mvn clean package -DskipTests

# Run the tests using the maven command
CMD ["mvn", "clean","verify"]

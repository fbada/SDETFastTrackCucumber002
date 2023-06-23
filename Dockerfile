# Use the official maven image as the base image
FROM maven:3.8.1-openjdk-11

# install git
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/fbada/SDETFastTrackCucumber002.git

# Set the working directory inside the container
WORKDIR /SDETFastTrackCucumber
# Build the application
RUN mvn clean package -DskipTests

ENTRYPOINT ["mvn", "clean", "verify"]


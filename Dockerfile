# Use the selenium/standalone-chrome base image
FROM selenium/standalone-chrome

# Install Git and Maven
USER root
RUN apt-get update && \
    apt-get install -y git maven

# Set the working directory
WORKDIR /usr/src/app

# Clone the repository
RUN git clone https://github.com/fbada/SDETFastTrackCucumber002.git .

# Build the application
RUN mvn clean package -DskipTests

# Set the entry point for running the Maven build
ENTRYPOINT ["mvn","verify"]

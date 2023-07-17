# Use Alpine Linux as the base image
FROM alpine:latest

# Install necessary dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
      udev \
      ttf-freefont \
      chromium \
      chromium-chromedriver \
      openjdk11 \
      maven

# Set environment variables for Chrome and ChromeDriver
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Set the working directory
WORKDIR /usr/src/app

# Copy the Maven project files
COPY pom.xml .

# Resolve Maven dependencies
RUN mvn -B dependency:resolve

# Copy the source code
COPY src/ ./src/

# Build the Maven project
RUN mvn -B package

# Set the entry point for running the Maven build
ENTRYPOINT ["mvn", "test"]

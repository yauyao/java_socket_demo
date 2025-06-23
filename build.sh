#!/bin/bash

# Remove old containers if they exist
docker rm -f java-socket-demo 2>/dev/null

# Build the Spring Boot app container
echo "Building Spring Boot app container..."
docker build -t java-socket-demo .

# Start Spring Boot app
docker run -d --name java-socket-demo -p 8080:8080 java-socket-demo
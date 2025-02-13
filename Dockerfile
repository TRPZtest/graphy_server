FROM node:18.20.6-bullseye-slim

# Update and upgrade system packages to fix vulnerabilities
RUN apt-get update && \
    apt-get upgrade -y libtasn1-6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

# Install Node.js dependencies
RUN npm install

# Expose the application port
EXPOSE 4000

# Start the application
CMD node graphserver.js

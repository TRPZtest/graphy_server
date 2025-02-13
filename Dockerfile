FROM node:18.20.6-bookworm-slim
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN apt-get update && \
    apt-get upgrade -y libtasn1-6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
EXPOSE  4000
CMD node graphserver.js

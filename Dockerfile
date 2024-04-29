FROM node:latest

WORKDIR /src
COPY package.json .
COPY . /src/Front

EXPOSE 8080
CMD [ 'node', './src/server.js' ]
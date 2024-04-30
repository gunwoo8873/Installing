FROM node:latest

RUN git clone https://github.com/gunwoo8873/fp1_project.git

EXPOSE 8080
CMD [ 'node', './src/server.js' ]
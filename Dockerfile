FROM node:latest

COPY . .

#RUN git clone https://github.com/gunwoo8873/fp1_project.git
#RUN npm install packahe.json
WORKDIR /src .

EXPOSE 8080
CMD [ "node", "./src/server.js" ]
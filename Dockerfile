FROM node:latest

#### Docker 환경상 Powershell은 사용 불가로 제외
COPY ./bin_sh/ /bin_sh/

WORKDIR /src/app .
RUN npm i

EXPOSE 8080
CMD [ "node", "./src/server.js" ]
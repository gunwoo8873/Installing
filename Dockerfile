FROM node:latest

# Localfile Directory
WORKDIR /src/app/dev .
COPY ./src/app/dev/test.sh .

WORKDIR /src/app .
COPY test.py .

WORKDIR /public .

# Github Action Automation Directory
WORKDIR /.github/workflows
COPY action.yml .

# Docker Build Create a new Image formport
ENV PORT 8080
EXPOSE ${PORT}

CMD [ "apachectl". "-D", "FOREGROUND" ]
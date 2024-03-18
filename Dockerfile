FROM python:3

# Localfile Directory
WORKDIR /src/app/dev .
COPY ./src/app/dev/test.sh .

WORKDIR /src/app .
COPY ./src/app/test.py .

WORKDIR /public .

# Github Action Automation Directory
WORKDIR /.github/workflows
COPY ./.github/workflows/action.yml .

# Docker Build Create a new Image formport
ENV PORT 8080
EXPOSE ${PORT}

CMD [ "apachectl". "-D", "FOREGROUND" ]
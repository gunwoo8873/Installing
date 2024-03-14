FROM python:3

# MainFile Directory
WORKDIR /usr/src/app .
COPY /app .

WORKDIR /public .

# Github Action Automation Directory
WORKDIR .github/workflows .
COPY action.yml .

# Docker Build Create a new Image form port
ENV PORT 8080
EXPOSE ${PORT}

CMD [ "apachectl". "-D", "FOREGROUND" ]
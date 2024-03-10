FROM node:21-alpine:3.18

VOLUME [ "/test-volume" ]

# Node and Npm Version Check
RUN echo "Node Version:" && node --version
LABEL NODE_VERSION="20.11.1"
RUN echo "NPM Version:" && npm --version
LABEL NPM_VERSION = "10.2.4"

# Folder Directory
# Main directory
WORKDIR /app .
COPY docker-compose.yml .
COPY test.sh .

# Automation Directory
WORKDIR .github/workflows .
COPY Action.yml .

# ???
WORKDIR /public .
WORKDIR /src .

# PortNumber
ENV PORT 8080
EXPOSE ${PORT}

CMD ["node", "test-server.js"]
FROM node:21-alpine:3.18

VOLUME [ "/test-volume" ]

# Node and Npm Version Check
RUN echo "Node Version:" && node --version
RUN echo "NPM Version:" && npm --version
LABEL NPM_VERSION = "10.2.4"

# Folder Directory
WORKDIR /app/Web .
COPY test-server.js .

# PortNumber
ENV PORT 8080
EXPOSE ${PORT}

CMD ["node", "test-server.js"]
FROM node:18.4.0-slim

WORKDIR /usr/src/app

COPY ./disapearing-messages-chat-back-end/package*.json ./

RUN npm ci --audit=false

COPY ./disapearing-messages-chat-back-end .

CMD [ "npm","run", "prod" ]
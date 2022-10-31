FROM node:18.11.0-slim
RUN apt-get update
RUN apt-get install -y openssl
WORKDIR /usr/src/app

COPY ./disapearing-messages-chat-back-end/package*.json ./

RUN npm ci --audit=false

COPY ./disapearing-messages-chat-back-end .

CMD [ "npm","run", "prod" ]

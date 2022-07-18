FROM node:18.4.0-slim as build
WORKDIR /usr/src/app
COPY ./dissapearing-messages-front-end/package*.json ./

RUN npm ci --audit=false

COPY ./dissapearing-messages-front-end .

RUN npm run build

FROM nginx:latest
COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets over
COPY --from=build /usr/src/app/dist/ ./
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
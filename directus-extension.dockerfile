FROM node:lts-alpine

RUN apk add git
RUN mkdir /app/
WORKDIR /app/
RUN npm init -y
RUN npm i -D @directus/extension-sdk typescript @tsconfig/recommended
RUN mkdir -p /app/node_modules/@directus/extension-sdk/templates/common
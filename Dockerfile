FROM node:alpine

WORKDIR /usr/app

RUN apk update
RUN apk add git
RUN apk add -qU openssh

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh,id=github git clone git@github.com:BezqyczekPL/Simpleweb.git

WORKDIR /usr/app/BezqyczekPL/Simpleweb
COPY ./package.json ./
RUN npm install
COPY ./ ./
EXPOSE 1999
CMD ["npm", "start"]  

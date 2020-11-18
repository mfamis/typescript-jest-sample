## Test and Transpile Step
FROM node:14-alpine AS builder
WORKDIR /usr/src/app

# install packages
COPY package*.json ./
RUN npm i

# copy source
COPY tsconfig*.json ./
COPY jest.config.js ./
COPY src src

# run unit tests
RUN npm test

# compile ts to js
RUN npm run build

## Build Image Step
FROM node:14-alpine
WORKDIR /usr/src/app
COPY package*.json ./
COPY --from=builder /usr/src/app/dist/ dist/
EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]
FROM node:6.7.0
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY package.json $APP_HOME
COPY . $APP_HOME
RUN npm install && npm i supervisor webpack -g

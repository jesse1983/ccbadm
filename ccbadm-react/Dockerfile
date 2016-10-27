FROM node:6.8
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
RUN npm i supervisor webpack yarn -g
RUN yarn install --ignore-engines

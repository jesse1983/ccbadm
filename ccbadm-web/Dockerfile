FROM node:4.2.1
RUN mkdir -p /src
WORKDIR /src
COPY src/index.js /src/
COPY src/package.json /src/
COPY src/public /src/public
RUN npm install --production && npm install supervisor -g
EXPOSE 5000
CMD ["npm", "start"]
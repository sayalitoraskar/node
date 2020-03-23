FROM node:7
WORKDIR /app
RUN apt install -y apache2
COPY package.json /app
RUN npm install
COPY . /app
CMD node index.js
EXPOSE 8081
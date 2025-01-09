FROM node:18-alpine

WORKDIR /app

COPY images ./images
COPY server.js .
COPY package.json .
COPY index.html .

RUN npm install

EXPOSE 3000

CMD ["node", "server.js"]

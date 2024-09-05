FROM node:20-alpine

WORKDIR /app

COPY ../FE/package.json /FE/package-lock.json ./

RUN npm install

COPY . .

CMD ["npm", "run", "dev"]

EXPOSE 3000

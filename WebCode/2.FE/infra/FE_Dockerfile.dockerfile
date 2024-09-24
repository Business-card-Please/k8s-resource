FROM node:14-alpine

WORKDIR /app

COPY ./FE/package.json ./FE/package-lock.json ./

RUN npm install --only=production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
FROM node:20.9.0-alpine

WORKDIR /app

COPY ./Frontend/package.json ./

RUN npm install
 
COPY ./Frontend ./

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
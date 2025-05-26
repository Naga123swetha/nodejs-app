FROM node:19-alpine as firststage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 300

FROM firststage as finalstage
RUN npm install --production
COPY . .
CMD ["node","index.js"]
EXPOSE 3000

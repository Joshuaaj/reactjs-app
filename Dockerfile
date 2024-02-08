FROM node:14 AS builder
WORKDIR /react-app
COPY package*.json ./
RUN npm install 
RUN npm install -g react-scripts
COPY . .
RUN npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder /react-app/build .
EXPOSE 80
CMD ["nginx", "-g" , "daemon off;"]

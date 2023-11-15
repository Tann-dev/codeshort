# Local
#FROM node:18-alpine As build
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#RUN npm run buildDev

#FROM nginx:alpine
#COPY nginx.conf /etc/nginx/nginx.conf
#COPY --from=build /app/dist/codeshort-front /usr/share/nginx/html

# With github actions
FROM nginx:alpine
COPY /dist/codeshort-front /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

FROM public.ecr.aws/bitnami/node:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


RUN npm install

RUN npm install pm2 -g
ENV PM2_PUBLIC_KEY gwrgdd94llq5d3v
ENV PM2_SECRET_KEY zvas5v7zuz8frxa
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 5000

#CMD [ "node", "server.js" ]

CMD ["pm2-runtime", "server.js"]

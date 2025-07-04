# Use Node v8 as the base image.
FROM node:18
# create and set app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install

# Copy app source from current host directory to container working directory
COPY . .

# Run app
CMD ["npm", "start"]

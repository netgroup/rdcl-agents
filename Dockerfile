FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Install OS packages dependencies
RUN apt update && apt install -y \
  shellinabox

# Bundle app source
COPY . /usr/src/app

EXPOSE 3030
CMD [ "npm", "start" ]

# Use an official Node.js runtime as the base image
FROM node:18.19-bullseye
# Set the working directory in the container
WORKDIR /usr/src/app
# Copy package.json and package-lock.json to the container
COPY package*.json ./
# Install application dependencies
RUN npm install
# Install sharp lib for linux specifically
RUN npm install --cpu=x64 --os=linux sharp@^0.33.2
# Copy the rest of the application code
COPY . .
# Specify the command to run your application
CMD ["node", "app.js"]

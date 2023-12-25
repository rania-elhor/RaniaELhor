# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container for the server
WORKDIR /usr/src/app/server

# Copy server package.json and package-lock.json to the working directory
COPY server/package*.json ./

# Install server dependencies
RUN npm install

# Copy the server code into the container
COPY server .

# Change directory to the client folder
WORKDIR /usr/src/app/client

# Copy client package.json and package-lock.json to the client working directory
COPY client/package*.json ./

# Install client dependencies
RUN npm install

# Copy the client code into the container
COPY client .

# Change back to the root working directory
WORKDIR /usr/src/app

# Expose the port that the server will run on
EXPOSE 5000

# Define the command to run your application
CMD ["npm", "start"]

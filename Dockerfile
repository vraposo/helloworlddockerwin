# Set the base image to Microsoft Node
FROM microsoft/node:latest

# Install nodemon
RUN npm install -g nodemon

# Work directory
RUN mkdir -p /src
WORKDIR /src
ADD . /src
RUN npm install

# Expose HTTP server
EXPOSE 80

# Run app
CMD ["nodemon", "/src/app.js"]
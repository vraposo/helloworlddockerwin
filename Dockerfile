# Set the base image to Microsoft Node
FROM microsoft/node:latest

# Fix Node
RUN powershell -Command \
    Sleep 2 ; \
    wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing ; \
    patchiojs.exe 'C:/Program Files/nodejs/node.exe' ; \
    Remove-Item -Path patchiojs.exe

# Install nodemon
# RUN npm install -g nodemon -d

# Work directory
RUN mkdir \src
WORKDIR \src
ADD . .
RUN npm install -d

# Expose HTTP server
#EXPOSE 80 # not supported in windows containers

# Run app
# CMD ["nodemon", "\src\app.js"]
RUN node \src\app.js
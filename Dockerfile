# Set the base image to Microsoft Node
FROM microsoft/node:latest

# Fix Node
RUN powershell -Command \
    Sleep 2 ; \
    wget -Uri https://github.com/StefanScherer/win-patch-iojs/releases/download/1.0.9/patchiojs.exe -OutFile patchiojs.exe -UseBasicParsing ; \
    patchiojs.exe 'C:/Program Files/nodejs/node.exe' ; \
    Remove-Item -Path patchiojs.exe

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
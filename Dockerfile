#Docker build

#Builder step
FROM node:8.15.0
LABEL maintainer="sandeep"
LABEL product="emsolution"
LABEL trademark="Tydrogen"

#arguments
ARG RUNTIME_PORT=9000

#create directories
RUN mkdir /emsol
RUN mkdir emsol/backend
RUN mkdir emsol/backend/src


COPY ./src /emsol/backend/src
COPY ./package.json /emsol/backend
COPY ./Dockerfile /emsol/backend
COPY ./README.md /emsol/backend

WORKDIR /emsol/backend

RUN npm install 

#Expose the port
ENV PORT=${RUNTIME_PORT}
EXPOSE ${RUNTIME_PORT}


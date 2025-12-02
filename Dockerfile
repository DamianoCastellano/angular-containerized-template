# syntax=docker/dockerfile:1

ARG NODE_VERSION=20.19.6

################################################################################
# Use node image for base image for all stages.
FROM node:${NODE_VERSION}-alpine as base

# Set working directory for all build stages.
WORKDIR /usr/src/app

# Copy the rest of the source files into the image.
COPY . .

RUN npm install
# Run the build script.
RUN npm run build

# Use production node environment by default.
ENV NODE_ENV development

# Expose the port that the application listens on.
EXPOSE 4200

# Run the application.
#CMD [ "/bin/ls", "-la" ]

CMD ["npm", "run", "start", "--", "--host", "0.0.0.0", "--poll", "1000", "--watch"]



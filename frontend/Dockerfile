FROM node:16.13.2-alpine

ARG WORKDIR

ENV HOME=/${WORKDIR}

WORKDIR ${HOME}

# RUN apk update && \
#   npm install -g npm && \
#   npm install -g @vue/cli

RUN apk update
COPY package.json .
RUN npm install
CMD ["npm", "run", "serve"]

FROM node:16.13.2-alpine

ARG WORKDIR

ENV HOME=/${WORKDIR}

WORKDIR ${HOME}

RUN apk update && \
  npm install -g npm && \
  npm install -g @vue/cli

CMD ["npm", "run", "serve"]

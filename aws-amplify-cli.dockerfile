FROM node:lts

RUN npm i -g @aws-amplify/cli

ENTRYPOINT [ "amplify" ]
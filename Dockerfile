FROM node:18-alpine

RUN npm i -g @confio/relayer
COPY ./config/registry.yaml ./registry.yaml
COPY ./config/app.yaml ./app.yaml

CMD ibc-relayer start --home . --enable-metrics
FROM node:8.11.3-jessie

RUN apt-get update && apt-get upgrade npm -y

ENV builddate=04092018
ENV packageshash="445e5048a076d913834e0df79ed18058e0b481b0c3eb7da713f87d7132002006  package.json"

WORKDIR /usr/src/app

COPY *.json ./

RUN npm install tsd bower gulp -g \
    && bower install --allow-root \
    && tsd reinstall \
    && npm install gulp

#
# Dockerfile to build a docker image for dashing
#
# Copyright 2016 Oxalide
# Licensed under MIT

FROM alpine:3.3

# VARS
ARG dashdir=/space/dashing
WORKDIR $dashdir
ENV PORT=8080
ENV DASHBOARD=sample
ENV TOKEN=YOUR_AUTH_TOKEN

# install resources
RUN apk add --update ruby ruby-dev nodejs make g++
RUN gem install bundle twitter dashing io-console --no-ri --no-rdoc

# create new dashboard
RUN dashing new $dashdir

# copy custom dashboard
COPY ./dashing/ $dashdir

# run dashing (apply custom settings)
CMD sed "s/%AUTH_TOKEN%/${TOKEN}/" config.ru && sed "s/%DEF_DASH%/${DASHBOARD}/" config.ru && dashing start -p $PORT

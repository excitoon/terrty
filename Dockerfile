
FROM alpine
LABEL name=paskal/octopress
LABEL maintainer="paskal.07@gmail.com"

WORKDIR /data

# install dependencies
RUN apk add --update --no-cache ruby ruby-bundler
RUN apk add --no-cache --virtual build_deps \
    build-base ruby-dev libc-dev libffi-dev linux-headers

COPY . /data/
ENTRYPOINT ["rake"]

# install ruby libs and remove build dependencies
RUN bundle install && apk del build_deps
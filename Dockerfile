FROM alpine:latest

RUN apk add netcat-openbsd bash

WORKDIR /scripts_dir

COPY ./nc_script.sh .

ENTRYPOINT ["./nc_script.sh"]

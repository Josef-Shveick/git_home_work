#!/bin/bash

if [ -z "$1" ]; then
  echo "No argument provided. Use --client or --server."
  exit 1
fi

PORT=80
SERVER_HOSTNAME=nc_server

case "$1" in
  --client)
    MESSAGE="Hello from client $(date)"
    RETRY_DELAY=5

    check_server() {
      nc -z $SERVER_HOSTNAME $PORT
      return $?
    }

    echo "Waiting for server $SERVER_HOSTNAME:$PORT to become available..."
    while ! check_server; do
      echo "Server not available yet. Retrying in $RETRY_DELAY seconds..."
      sleep $RETRY_DELAY
    done

    echo "Server is available. Sending message..."
    echo $MESSAGE | nc $SERVER_HOSTNAME $PORT
    echo "Message sent."
    ;;
  --server)
    echo "Starting server on port $PORT..."
    while true; do
      { echo -ne "HTTP/1.1 200 OK\r\nContent-Length: $(wc -c < /dev/stdin)\r\n\r\n"; cat; } | nc -l -p $PORT
    done
    ;;
  *)
    echo "Invalid argument. Use --client or --server."
    exit 1
    ;;
esac

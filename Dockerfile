FROM ubuntu:latest

RUN apt-get update && apt-get install -y  curl

ADD check_status.sh ./check_status.sh
RUN chmod +x ./check_status.sh

CMD while true; do ./check_status.sh; sleep 30; done
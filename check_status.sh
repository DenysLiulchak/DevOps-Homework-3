#!/bin/bash

send_email() {
  local recipient="lyulchakdenis1@gmail.com"
  local subject="WARNING! HTTP status code is $1"
  local message="HTTP status code is $1. Please check the web server."

  echo "$message" | mail -s "$subject" "$recipient"
}

WEB_SERVER_URL="http://nginx:80"
http_status=$(curl -s -o /dev/null -w "%{http_code}" $WEB_SERVER_URL)

if [[ "$http_status" -lt 200 || "$http_status" -ge 400 ]]; then
    send_email $http_status
fi
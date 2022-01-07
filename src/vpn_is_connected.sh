#!/bin/sh

res=$(/usr/bin/curl --head --silent --max-time 1 https://s3.gwdg.de | head -1 | cut -d ' ' -f 3 | tr -d '\r')

if [ ! "$res" = 'OK' ]; then
    exit 1
fi



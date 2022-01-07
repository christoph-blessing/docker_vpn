#!/bin/sh

echo "$PASSWORD" | /usr/sbin/openconnect --user "$USER" --passwd-on-stdin "$URL"

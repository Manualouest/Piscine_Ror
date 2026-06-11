#!/bin/sh

curl -s $1 | grep -P -i '".*"' | cut -d '"' -f 2
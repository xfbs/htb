#!/bin/bash

# make initial request, save response and headers.
curl -v "$1" > response 2> headers

# extract phpsessid.
grep PHPSESSID headers | egrep -o '[a-z0-9]{26}' > phpsessid

# extract random string.
grep h3 response | egrep -o '[a-zA-Z0-9]{20}' > string

# generate md5.
echo -n $(< string) | md5sum | tr -d ' -' > md5

curl "$1" -XPOST -H "Cookie: PHPSESSID=$(< phpsessid)" --data "hash=$(< md5)"

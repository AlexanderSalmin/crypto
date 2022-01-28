#!/usr/bin/env bash

for human in alice bob; do
 openssl genrsa -out $human.key
 openssl rsa -in $human.key -pubout -out $human.pub
done

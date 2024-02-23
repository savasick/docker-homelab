#!/bin/bash

while true; do
  sleep 1m
  rsync -avz --delete /downloads/ /shared-files/
done

#!/usr/bin/env bash

# Restart docker containers in services.txt one by one.
# An empty line will wait for 10 seconds.

ABSPATH=$(readlink -f $0)
basis=$(dirname $ABSPATH)

while read line;  do
	if [ "$line" != "" ]; then
		cd "$basis/$line"
		docker-compose down
		docker-compose up -d
		cd $basis
	else
		sleep 10
	fi
done < "$basis/services.txt"


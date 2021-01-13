#!/usr/bin/env bash

# Restart docker containers in services.txt one by one.
# An empty line will wait for 10 seconds.

ABSPATH=$(readlink -f $0)
basis=$(dirname $ABSPATH)

while read line;  do
	if [ "$line" != "" ]; then
		cd "$basis/$line"
		docker-compose down
		cd $basis
	else
		sleep 0
	fi
done < "$basis/services.txt"


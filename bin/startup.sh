#!/bin/bash

figlet -m smushmode $APP_NAME $APP_VERSION

echo

source $BIN_DIR/functions.sh

if [ -z "$ETCD_LISTEN_CLIENT_URLS" ]; then
	echo "Gathering the service settings..."
	
	SETTINGS=$(getSettings)
	PORT=
	
	if [ ! -z "$SETTINGS" ]; then
		PORT=`echo $SETTINGS | jq -r .port`
	fi
	
	echo "Service settings were gathered!"
fi

$BIN_DIR/install.sh

echo "Starting the service..."

if [ ! -z "$1" ]; then
	eval $1
fi

if [ ! -z "$PORT" ]; then
	while [ true ];
	do
		RESULT=`netstat -an|grep $PORT|grep LISTEN`
		
		if [ -z "$RESULT" ]; then
			sleep 1
		else
			break
		fi
	done
fi

echo "Service started!"

crond -f -l 0
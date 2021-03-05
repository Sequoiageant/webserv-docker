#!/bin/bash

# List of the services, comment the ones you don't want to run
services=(	\
	mysql	\
	php		\
	# apache	\
	nginx	\
	pma		\
	adminer	\
)

if [[ -n "$1" ]]  && [[ " ${services[@]} " =~ " $1 " ]];
then
	docker stop websrv_${1}_1
	docker rm websrv_${1}_1
	docker image rm -f websrv_${1}:latest
else
	for service in "${services[@]}"
	do
		docker stop websrv_${service}_1
		docker rm websrv_${service}_1
		docker image rm -f websrv_${service}:latest
	done
fi
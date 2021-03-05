#!/bin/bash

# Prefix of all containers
prefix='webserv42'

# List of the services, comment the ones you don't want to run
services=(	\
	php		\
	nginx	\
)

if [[ -n "$1" ]]  && [[ " ${services[@]} " =~ " $1 " ]];
then
	docker stop ${prefix}_${1}_1
	docker rm ${prefix}_${1}_1
	docker image rm -f ${prefix}_${1}:latest
else
	for service in "${services[@]}"
	do
		docker stop ${prefix}_${service}_1
		docker rm ${prefix}_${service}_1
		docker image rm -f ${prefix}_${service}:latest
	done
fi
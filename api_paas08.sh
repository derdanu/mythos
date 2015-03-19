#!/bin/bash
# Check https://access.redhat.com/documentation/en-US/OpenShift/2.0/html/REST_API_Guide/ for details


# Get environment
source ./set-env_poc.sh
APPLICATION_NAME=paas08

# Services
true=/bin/true
ADD_LIBERTY_INSTANCE=${true}

# Add liberty instance 
if [ ${ADD_LIBERTY_INSTANCE} ] ; then
	application_name=$APPLICATION_NAME
	cartridge="hoffmann-liberty-8.5.5.4"
	result=`$CURL -k -X POST "${BROKER_URL}broker/rest/domain/${USER_DOMAIN}/applications" --user "${USERNAME}:${PASSWORD}" --data "name=${application_name}&cartridge=${cartridge}&scale=false"`
    if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
    else
		echo ${result} | less
    fi
fi


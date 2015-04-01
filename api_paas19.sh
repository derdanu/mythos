#!/bin/bash
# Check https://access.redhat.com/documentation/en-US/OpenShift/2.0/html/REST_API_Guide/ for details


# Get environment
source ./set-env_poc.sh

APPLICATION_NAME=myapp

# Services
true=/bin/true
START=${true}
STOP=

# Start
if [ ${START} ] ; then
	result=`$CURL -k -X POST "${BROKER_URL}broker/rest/domains/${USER_DOMAIN}/applications/${APPLICATION_NAME}/events" --user "${USERNAME}:${PASSWORD}" --data "event=start"`
    if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
    else
		echo ${result} | less
    fi
fi

# Stop
if [ ${STOP} ] ; then
	result=`$CURL -k -X POST "${BROKER_URL}broker/rest/domains/${USER_DOMAIN}/applications/${APPLICATION_NAME}/events" --user "${USERNAME}:${PASSWORD}" --data "event=stop"`
    if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
    else
		echo ${result} | less
    fi
fi


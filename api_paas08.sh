#!/bin/bash
# Check https://access.redhat.com/documentation/en-US/OpenShift/2.0/html/REST_API_Guide/ for details


# Get environment
source ./set-env_poc.sh

APPLICATION_NAME=myapp

# Services
true=/bin/true
SCALE_UP=${true}
SCALE_DOWN=

# Scale Up
if [ ${SCALE_UP} ] ; then
	result=`$CURL -k -X POST "${BROKER_URL}broker/rest/domains/${USER_DOMAIN}/applications/${APPLICATION_NAME}/events" --user "${USERNAME}:${PASSWORD}" --data "event=scale-up"`
    if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
    else
		echo ${result} | less
    fi
fi

# Scale Down
if [ ${SCALE_DOWN} ] ; then
	result=`$CURL -k -X POST "${BROKER_URL}broker/rest/domains/${USER_DOMAIN}/applications/${APPLICATION_NAME}/events" --user "${USERNAME}:${PASSWORD}" --data "event=scale-down"`
    if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
    else
		echo ${result} | less
    fi
fi


#!/bin/bash
# Check https://access.redhat.com/documentation/en-US/OpenShift/2.0/html/REST_API_Guide/ for details

# Get environment
source ./set-env_poc.sh

# Services
true=/bin/true
SHOW_API_DETAILS=${true}
SHOW_AVAILABLE_CARTRIDGES=
SHOW_DOMAINS=
SHOW_APPLICATIONS=
ADD_LIBERTY_INSTANCE=

# Show API Details
if [ ${SHOW_API_DETAILS} ] ; then
	result=`$CURL -k "${BROKER_URL}broker/rest/api" --user "${USERNAME}:${PASSWORD}"`
	if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
	else
		echo ${result} | less
	fi
fi

# Show available cartridges
if [ ${SHOW_AVAILABLE_CARTRIDGES}] ; then
	result=`$CURL -k "${BROKER_URL}broker/rest/cartridges" --user "${USERNAME}:${PASSWORD}"`
	if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
	else
		echo ${result} | less
	fi
fi

# Show domains
if [ ${SHOW_DOMAINS} ] ; then
	result=`$CURL -k "${BROKER_URL}broker/rest/domains" --user "${USERNAME}:${PASSWORD}"`
	if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
	else
		echo ${result} | less
	fi
fi

# Show applications
if [ ${SHOW_APPLICATIONS} ] ; then
	result=`$CURL -k "${BROKER_URL}broker/rest/domain/${USER_DOMAIN}/applications" --user "${USERNAME}:${PASSWORD}"`
	if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
	else
		echo ${result} | less
	fi
fi

# Add liberty instance 
if [ ${ADD_LIBERTY_INSTANCE} ] ; then
	application_name="myapp02"
	cartridge="hoffmann-liberty-8.5.5.4"
	result=`$CURL -k -X POST "${BROKER_URL}broker/rest/domain/${USER_DOMAIN}/applications" --user "${USERNAME}:${PASSWORD}" --data "name=${application_name}&cartridge=${cartridge}&scale=false"`
    if ! [ -z "${JSON_FORMAT}" ]; then
		echo ${result} | ${JSON_FORMAT} | less
    else
		echo ${result} | less
    fi
fi


#!/bin/bash
SCRIPTNAME="scan"
SCRIPTVERSION="v0.1"

# Print usage
usage() {
	echo -n "$SCRIPTNAME [OPTION] TARGET

main options are described below.

	Options:
		-v,--verbose Verbose output
		-d,--debug Debug output
		-h,--help Display this help and exit
		--version Displays versions and exits
"
}

version() {
	echo -n "$SCRIPTNAME $SCRIPTVERSION (C) 2021. No warranty."
}

# DEPENDENCY: getopt command tool
TEMP=`getopt -o vdh --long verbose,debug,help,version -n "$SCRIPTNAME" -- "$@"`
# Note the quotes around ‘$TEMP’: they are essential!
eval set -- "$TEMP"

# default values for options
while true; do
	case "$1" in
		-v | --verbose ) VERBOSE=true; shift ;;
		-d | --debug ) DEBUG=true; set -x; shift ;;
		-h | --help ) usage; exit 1 ;;
		--version ) version; exit 1 ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

##############################################
### error handling ###
##############################################

func_unexpected() {
	echo "Error due to an unexpected error";
	echo "Try again or consult the manual";
	exit 1;
}

##############################################
### signals ###
##############################################
trap "func_unexpected" 1 # Generic code error

##############################################
### main ###
##############################################

# main body

# exit
exit 0;

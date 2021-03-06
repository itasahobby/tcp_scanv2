#!/bin/bash
SCRIPTNAME="scan"
SCRIPTVERSION="v0.1"

# Variable definitions
TARGET=""
PARANOIC=""
NMAPCOMM=""
FURIOUS=""
PORTS=""

# Print usage
usage() {
	echo -n "$SCRIPTNAME [OPTIONS]

main options are described below.

	Options:
		-v,--verbose Verbose output only showing nmap command without executing
		-t,--target Target to scan (mandatory)
		-p,--paranoic Slow scan
		-h,--help Display this help and exit
		--version Displays versions and exits
"
}

# Print current version
version() {
	echo -n "$SCRIPTNAME $SCRIPTVERSION (C) 2021. No warranty."
}

# Makes sure target is set
check_target() {
	if [[ -z "$TARGET" ]]
	then
		usage
		exit 2
	fi
}

# Gets furious binary path to avoid path hijacking
get_furious() {
	go_dir=$(go env | grep GOPATH | awk -F'"' '{print $2}');
	ls $go_dir/bin/furious &>/dev/null;
	if [[ -z "$?" ]]
	then
		>&2 echo "Furious is not installed"
		exit 3
	else
		FURIOUS=$go_dir/bin/furious
	fi
}

get_ports() {
	PORT_REGEX="(0|[1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])/tcp"
	UNFILTERED_PORTS=$($FURIOUS -s connect -p 1-65535 $TARGET);
	SPACED_PORTS=$(echo $UNFILTERED_PORTS | grep -E -o $PORT_REGEX | sed -e 's/\/tcp//g');
	PORTS=$(echo $SPACED_PORTS | tr ' ' ',');
	if  [ -z "$PORTS" ]
	then
		>&2 echo "No open ports"
		exit 4
	fi
}

get_nmapcomm() {
	NMAPCOMM="nmap $TARGET -p$PORTS"
	if [[ $PARANOIC ]]; then
		NMAPCOMM+=" -sC -sV -Pn -T1 -n"
	else
		NMAPCOMM+=" -sC -sV -Pn -T5 -n"
	fi
}

# DEPENDENCY: getopt command tool
TEMP=`getopt -o vt:ph --long verbose,target:,paranoic,help,version -n "$SCRIPTNAME" -- "$@"`
# Note the quotes around ‘$TEMP’: they are essential!
eval set -- "$TEMP"

# default values for options
while true; do
	case "$1" in
		-t | --target ) TARGET=$2; shift 2 ;;
		-p | --paranoic ) PARANOIC=true; shift ;;
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

missing_dependency() {
	echo "Error with dependencies";
	echo "Make sure it is correctly installed or reinstall it";
	exit 2;
}

##############################################
### signals ###
##############################################
trap "func_unexpected" 1 # Generic code error
trap "missing_dependency" 2 # Error with dependencies

##############################################
### main ###
##############################################

# main body
check_target
get_furious
get_ports
get_nmapcomm
if [ $VERBOSE ]; then
	echo $NMAPCOMM;
else
	$NMAPCOMM;
fi

# exit
exit 0;

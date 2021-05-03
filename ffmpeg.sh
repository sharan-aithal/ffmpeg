#!/usr/bin/env bash
# call ffmpeg by passing command line arguments

show_help() {
# TODO: Print help message
echo "Usage: $0 "
}

do_ffmpeg() {
	ffmpeg -i $1 $2
}

check_input_output() {
	if [ "$1" == "" ]; then
		echo "input file is required"
	elif [ "$2" == "" ]; then
		echo "output file is required"
	elif [ $# -le 2 -a $# -gt 0 ]; then
		do_ffmpeg $1 $2
	else
		echo "invalid arguments"
	fi
}

parse_args() {
ARGS=$@
if [ $# -eq 0 ]; then
	echo "No arguments passed"
	show_help
else
while [ $# -gt 0 ]; do
	# TODO: Parse arguments
	case "$ARGS" in
		--help|-h)
			show_help
			;;
		*)
			check_input_output $@
			shift
			;;
	esac
	echo "$# $@" # debugging only
	shift
done
fi
}

check_install() {
path=$(command -v $1) || echo "$1 not in PATH variable"
}


check_install "ffmpeg"

parse_args $@

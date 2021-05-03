#!/usr/bin/env bash
# call ffmpeg by passing command line arguments

show_help() {
# TODO: Print help message
echo "Usage: $0 "
}

parse_args() {
ARGS=$@
while [ $# -gt 0 ]; do
	# TODO: Parse arguments
	case "$ARGS" in
		--help|-h)
			show_help
			;;
		*)
			echo "Invalid option"
			;;
	esac
	echo "$# $@" # debugging only
	shift
done
}

check_install() {
path=$(command -v $1) || echo "$1 not in PATH variable"
}

parse_args $@

check_install "ffmpeg"

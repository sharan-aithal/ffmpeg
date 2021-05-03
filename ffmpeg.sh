#!/usr/bin/env bash

# call ffmpeg by passing command line arguments

parse_args() {
while [ $# -gt 0 ]; do
	# TODO: Parse arguments
	echo "$@"
	shift
done
}

check_install() {
path=$(command -v $1) || echo "$1 not in PATH variable"
}

parse_args $@

check_install "ffmpeg"

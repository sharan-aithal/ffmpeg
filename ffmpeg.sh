#!/usr/bin/env bash

# call ffmpeg by passing command line arguments

parse_args() {
while [ $# -gt 0 ]; do
	echo "$@"
	shift
done
}

parse_args $@

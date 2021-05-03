#!/usr/bin/env bash
# call ffmpeg by passing command line arguments

show_help() {
# TODO: Print help message
cat <<- EOF
Usage: $0 [-h|--help] <input-file> <output-file>
	<input-file>	is required and used to convert media to given output-file
	<output-file>	is required to save output media.
EOF
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
	echo "Try to run $0 --help"
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
		shift
	done
fi
}

check_install() {
path=$(command -v $1) || echo "$1 not in PATH variable"
}


check_install "ffmpeg"

parse_args $@

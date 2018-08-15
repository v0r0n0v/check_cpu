#!/bin/bash

CPU_USAGE=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.f\n", prefix, 100 - v }')

CPU_USAGE="$CPU_USAGE"

#echo $CPU_USAGE

if [ $CPU_USAGE -gt 80 ];
	then
	curl http://site-name.com
        exit 1
    else
#       echo "the processor is ok, load no more > 80"
       exit 0
    fi


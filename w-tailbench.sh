#!/usr/bin/env bash

#apps=( "img-dnn" "masstree" "moses" "shore" "silo" "specjbb" "sphinx" "xapian" )
apps=( "img-dnn" "masstree" "moses" "silo" "specjbb" "sphinx" )
#apps=( "silo" )

for app in ${apps[*]}; do
	sudo ./w-tailbench-impl.sh "$app"
	sleep 30
done

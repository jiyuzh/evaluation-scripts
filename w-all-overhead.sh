#!/usr/bin/env bash

apps=( "xapian" )

for app in ${apps[*]}; do
        sudo ./w-tailbench-impl.sh "$app"
        sleep 30
done

appsP=( "blackscholes" "ferret" "fluidanimate" "swaptions" "bodytrack" "vips" )

for appP in ${appsP[*]}; do
        sudo ./w-parsec-pthread.sh "$appP"
        sleep 30
done

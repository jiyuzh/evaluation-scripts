#!/usr/bin/env bash

#appsP=( "blackscholes" "canneal" "facesim" "ferret" "fluidanimate" "raytrace" "streamcluster" "swaptions" "bodytrack" "dedup" "vips" "x264" "splash2x.barnes" "splash2x.cholesky" "splash2x.fft" "splash2x.fmm" "splash2x.ocean_cp" "splash2x.ocean_ncp" "splash2x.radiosity" "splash2x.radix" "splash2x.raytrace" "splash2x.volrend" "splash2x.water_nsquared" "splash2x.water_spatial")
#appsG=( "freqmine" "splash2x.lu_cb" "splash2x.lu_ncb" )

appsP=( "canneal" "facesim" "raytrace" "streamcluster" "dedup" "x264" "splash2x.fft" )
#appsP=( "dedup" )

for appP in ${appsP[*]}; do
	sudo ./w-parsec-pthread.sh "$appP"
	sleep 30
done

#for appG in ${appsG[*]}; do
#	sudo ./w-parsec-gcc.sh "$appG"
#	sleep 30
#done

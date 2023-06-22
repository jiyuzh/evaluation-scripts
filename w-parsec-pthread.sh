#!/usr/bin/env bash

SUFFIX="-parsec-$1"

source ./init.sh

function pre_hook { :; }

function post_hook { :; }

COMMAND="/home/nkvm1/parsec-3.0/bin/parsecmgmt -a run -i native -n 1 -c gcc-pthreads -p $1"

source ./common.sh

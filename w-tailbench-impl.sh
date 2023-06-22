#!/usr/bin/env bash

SUFFIX="-tailbench-$1"

source ./init.sh

function pre_hook { :; }

function post_hook { :; }

COMMAND="/home/nkvm1/tailbench-vcolor/$1/myrun-total-perf.sh"

source ./common.sh

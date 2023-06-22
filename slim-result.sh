#!/usr/bin/env bash

shopt -s globstar

sudo rm -rf ./results-slim/
sudo cp -lR ./results/ ./results-slim/
sudo rm -rf ./results-slim/**/perf.data
sudo chmod -R 777 ./results-slim/

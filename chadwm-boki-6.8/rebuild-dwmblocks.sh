#!/usr/bin/env bash

cd "$(dirname "$0")/dwmblocks-async"

make clean

make

sudo make install

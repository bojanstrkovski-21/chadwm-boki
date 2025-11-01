#!/usr/bin/env bash

sudo rm config.h
make clean

make

sudo make clean install

sudo rm config.h

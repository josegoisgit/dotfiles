#!/bin/bash

for f in A B C D E;
do
	mkdir $f
	cp /mnt//template/dp.cpp $f/${f}.cpp
	touch $f/in
done

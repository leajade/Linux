#!/bin/bash

for files in /tmp/in/*
do
	ls $files
	gzip -r -f $files
	mv $files.gz  /tmp/out/
done

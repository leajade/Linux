#!/bin/bash

filelock=/tmp/out/*.lock

if test -f $filelock 
then
	exit
else
	touch /tmp/out/file.lock
	for files in /tmp/in/*
	do
		ls $files
		gzip -r -f $files
		mv $files.gz  /tmp/out/
	done
	rm /tmp/out/file.lock
fi

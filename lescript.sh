#!/bin/bash

filelock=/tmp/out/*.lock

if test -f $filelock 
then
	exit 2>>tmp/out/fileerror.log
else
	touch /tmp/out/file.lock
	for files in /tmp/in/*
	do
		if test -e -f $files
		then
			ls $files
			gzip -r -f $files
			mv $files.gz  /tmp/out/
		else
			rm /tmp/out/file.lock
			echo $? 2>>tmp/out/fileerror.log
		fi
	done
	rm /tmp/out/file.lock
	echo "le fichier $files a été déplacé dans /tmp/out" 2>> /tmp/out/fileerror.log
fi

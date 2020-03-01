#!/bin/bash

filelock=/tmp/out/*.lock
exec  &> /tmp/out/fileerror.log


if test -f $filelock
then
	exit >> /tmp/out/fileerror.log
else
	touch /tmp/out/file.lock
	for files in /tmp/in/*
	do
		if test -e $files && test -f $files
		then
			ls $files
			gzip -r -f $files
			mv $files.gz  /tmp/out/
		else
			rm /tmp/out/file.lock
			echo $? >> /tmp/out/fileerror.log
		fi
	done
	rm /tmp/out/file.lock
	echo "le fichier $files a été déplacé dans /tmp/out" >> /tmp/out/fileerror.log
fi

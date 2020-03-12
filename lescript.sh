#!/bin/bash

filelock=/tmp/out/file.lock
exec  &>> /tmp/out/fileerror.log


if test -e $filelock
then
	exit 22
else
	touch $filelock
	for files in /tmp/in/*
	do
		if test -e $files && test -f $files
		then
			gzip -r -f $files
			mv $files.gz  /tmp/out/
			echo "le fichier $files a été déplacé dans /tmp/out" >> /tmp/out/fileerror.log
		else
			echo "le fichier $files n'a pas pu être compressé ou bien déplacé dans /tmp/out ou bien n'existait pas" >> /tmp/out/fileerror.log
		fi
	done
	rm /tmp/out/file.lock
fi

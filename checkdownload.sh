#!/bin/bash
STAGINGDIR=/srv/staging/downloads
# Check the engineering files
MD5S=${STAGINGDIR}/eng/*.md5
GOODFILELIST=${STAGINGDIR}/eng.txt
for f in $MD5S
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./eng/${f%.*}" >> $GOODFILELIST # if they match append file name to good file list
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done
# Check the ins files
MD5S=${STAGINGDIR}/ins/*.md5
GOODFILELIST=${STAGINGDIR}/ins.txt
for f in $MD5S
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./ins/${f%.*}" >> $GOODFILELIST # if they match append file name to good file list
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done
# Check the ngrx files
MD5S=${STAGINGDIR}/ngrx/*.md5
GOODFILELIST=${STAGINGDIR}/ngrx.txt
for f in $MD5S
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./ngrx/${f%.*}" >> $GOODFILELIST # if they match append file name to good file list
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done
# Check the ngrx files
MD5S=${STAGINGDIR}/ngrx_raw/*.md5
GOODFILELIST=${STAGINGDIR}/ngrx_raw.txt
for f in $MD5S
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./ngrx_raw/${f%.*}" >> $GOODFILELIST # if they match append file name to good file list
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done

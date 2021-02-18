#!/bin/bash
SAFEDELETE=/srv/data/safe_delete.txt
# Check the engineering files and construct a list to be deleted next time the NGRx connects
ENGFILES=/srv/data/downloads/eng/*.md5
for f in $ENGFILES
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./eng/${f%.*}" >> $SAFEDELETE # if they match append file name to safe_deletion file
	newfile="$(dirname $f)/processed/$(basename $f)"
	mv $f $newfile
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done
# Check the ims files and construct a list to be deleted next time the NGRx connects
IMSFILES=/srv/data/downloads/ims/*.md5
for f in $IMSFILES
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./ims/${f%.*}" >> $SAFEDELETE # if they match append file name to safe_deletion file
	newfile="$(dirname $f)/processed/$(basename $f)"
        mv $f $newfile
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done
# Check the NGRx files and construct a list to be deleted next time the NGRx connects
NGRXFILES=/srv/data/downloads/ngrx/*.md5
for f in $NGRXFILES
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./ngrx/${f%.*}" >> $SAFEDELETE # if they match append file name to safe_deletion file
	newfile="$(dirname $f)/processed/$(basename $f)"
        mv $f $newfile
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done
# Check the NGRx Raw files and construct a list to be deleted next time the NGRx connects
NGRXRAWFILES=/srv/data/downloads/ngrx_raw/*.md5
for f in $NGRXRAWFILES
do
    good_checksum=`cat $f | awk '{ print $1 }'` # Get checksum from .md5 file
    test_checksum=`md5sum ${f%.*} | awk '{ print $1 }' ` # Calculate local checksum
    if [[ "$good_checksum" == "$test_checksum" ]]
    then
	echo "./ngrx_raw/${f%.*}" >> $SAFEDELETE # if they match append file name to safe_deletion file
	newfile="$(dirname $f)/processed/$(basename $f)"
        mv $f $newfile
    else # log error message
        echo "`date -u` ERROR Bad checksum for file: ${f%.*}" >> /home/ubuntu/logs/checksums.log
    fi
done

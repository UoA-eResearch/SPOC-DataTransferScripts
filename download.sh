#!/bin/bash
# download.sh - this script uses rsync over an ssh tunnel to copy the files from the remote server to the datacentre
# Usage ./download.sh PORT_NUMBER where PORT_NUMBER is the port used for the reverse tunnel
STAGINGDIR=/srv/staging/downloads
rsync --out-format="%n" --exclude-from ${STAGINIGDIR}/eng.txt -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/eng/* /srv/staging/downloads/eng/ #>> ${STAGINGDIR}/downloads_eng.txt
rsync --out-format="%n" --exclude-from=${STAGINIGDIR}/ins.txt -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ins/* /srv/staging/downloads/ins/ #>> ${STAGINIGDIR}/downloads_ins.txt
rsync --out-format="%n" --exclude-from=${STAGINIGDIR}/ngrx.txt -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ngrx/* /srv/staging/downloads/ngrx/ #>> ${STAGINIGDIR}/downloads_ngrx.txt
rsync --out-format="%n" --exclude-from=${STAGINIGDIR}/ngrx_raw.txt -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ngrx_raw/* /srv/staging/downloads/ngrx_raw/ #>> ${STAGINIGDIR}/downloads_ngrx_raw.txt


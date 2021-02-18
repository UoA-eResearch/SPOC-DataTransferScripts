#!/bin/bash
# download.sh - this script uses rsync over an ssh tunnel to copy the files from the remote server to the datacentre
# Usage ./download.sh PORT_NUMBER where PORT_NUMBER is the port used for the reverse tunnel
rsync -avhe --output-format="%n" "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/eng/* /srv/data/downloads/eng/ --dry-run >> test.txt
#rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ins/* /srv/data/downloads/ins/
#rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ngrx/* /srv/data/downloads/ngrx/
#rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ngrx_raw/* /srv/data/downloads/ngrx_raw/


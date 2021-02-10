#!/bin/bash
# download.sh - this script uses rsync over an ssh tunnel to copy the files from the remote server to the datacentre
# Usage ./download.sh PORT_NUMBER where PORT_NUMBER is the port used for the reverse tunnel
rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/eng/* /srv/staging/downloads/eng/
rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ins/* /srv/staging/downloads/ins/
rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ngrx/* /srv/staging/downloads/ngrx/
rsync -avhe "ssh -p $1 -i ~/.ssh/michigansoc" spoc@localhost:/mnt/int-ssd/download/ngrx_raw/* /srv/staging/downloads/ngrx_raw/


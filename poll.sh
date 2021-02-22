#!/bin/bash
# Using netcat, poll to see if the port is open, indicating that the NGRx is connected. If so, begin a download and validate that the files downloaded are good.
# Poll port
PORT=45503
nc -z 127.0.0.1 ${PORT}
if [ $? -eq 0 ] # port is open
then
    ./download.sh ${PORT} # Run the download script
    # Run the upload script here
    ./validate_download.sh # Check the download and update the good download files so we don't re-download files unnecessariliy
fi

#!/bin/bash
# Using netcat, poll to see if the port is open, indicating that the NGRx is connected. If so, begin a download and validate that the files downloaded are good.
# Poll port
PORT=45500
nc -z 127.0.0.1 ${PORT}
if [ $? -eq 0 ]
then
fi

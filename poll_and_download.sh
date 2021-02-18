#!/bin/bash
# Using netcat, poll to see if the port is open, indicating that the NGRx is connected. If so, begin a download and validate that the files downloaded are good.
# Poll port
PORT=45500
PORT_OPEN=`nc -z 127.0.0.1 ${PORT}`
echo $PORT_OPEN

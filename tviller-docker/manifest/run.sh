#!/bin/bash
echo "Welcome to tviller server"

pm2 start app.json
/etc/init.d/nginx start

#exit
exit $?


#!/bin/bash
echo "Welcome to tviller server"
/etc/init.d/nginx start
pm2 start app.json


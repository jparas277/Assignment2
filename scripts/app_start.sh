#!/bin/bash
cd /home/ubuntu/server

#npm start

pm2 start npm --name "reactapp" -- start
pm2 startup
pm2 save
pm2 restart all

# sudo rm -rf /var/www/html/*
# sudo cp -rf build/* /var/www/html/ 
# npm install -g serve
# serve -s build

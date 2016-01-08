#!/bin/sh

if [ -z "$EC2_USER" ]; then echo "set EC2_USER environment variable"; exit; fi
if [ -z "$EC2_HOST" ]; then echo "set EC2_HOST environment variable"; exit; fi

ssh $EC2_USER@$EC2_HOST sudo apt-get install npm
ssh $EC2_USER@$EC2_HOST sudo npm install -g analytics-reporter

scp ../../ONS-Analytics-95eb94bbb46f.json $EC2_USER@$EC2_HOST:ONS-Analytics-95eb94bbb46f.json
scp reports.json $EC2_USER@$EC2_HOST:reports.json
scp daily.sh $EC2_USER@$EC2_HOST:daily.sh
ssh $EC2_USER@$EC2_HOST chmod +x daily.sh
scp realtime.sh $EC2_USER@$EC2_HOST:realtime.sh
ssh $EC2_USER@$EC2_HOST chmod +x realtime.sh

ssh $EC2_USER@$EC2_HOST mkdir ons-data

ssh $EC2_USER@$EC2_HOST crontab -r
cat crontab | ssh $EC2_USER@$EC2_HOST crontab -

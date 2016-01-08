#!/bin/sh

# Temporary helper script to export GA stats
# See ../reports/ons.json for custom ONS reports

export ANALYTICS_REPORT_EMAIL=ons-analytics@ons-analytics.iam.gserviceaccount.com
export ANALYTICS_REPORT_IDS=ga:104040341
export ANALYTICS_KEY_PATH=../../ONS-Analytics-95eb94bbb46f.json
export ANALYTICS_REPORTS_PATH=../reports/ons.json
export ANALYTICS_HOSTNAME=https://beta.ons.gov.uk

mkdir ons-data
analytics --output=ons-data
analytics --output=ons-data --csv

aws s3 cp --recursive --acl=public-read --cache-control="max-age=0" ./ons-data s3://analytics-ons-gov-uk/ons-data

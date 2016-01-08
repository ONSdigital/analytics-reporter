# #!/bin/bash

export ANALYTICS_REPORT_EMAIL=ons-analytics@ons-analytics.iam.gserviceaccount.com
export ANALYTICS_REPORT_IDS=ga:104040341
export ANALYTICS_KEY_PATH=/home/ubuntu/ONS-Analytics-95eb94bbb46f.json
export ANALYTICS_REPORTS_PATH=reports.json
export ANALYTICS_HOSTNAME=https://beta.ons.gov.uk

export PATH=$PATH:/usr/bin:/usr/local/bin
source $HOME/.bashrc
analytics --output=ons-data --frequency=daily --slim --verbose
analytics --output=ons-data --frequency=daily --slim --verbose --csv

aws s3 cp --recursive --acl=public-read --cache-control="max-age=0" ./ons-data s3://analytics-ons-gov-uk/ons-data

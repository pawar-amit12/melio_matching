#!/bin/bash

#####################################################################################
# This script will get executed as part of the task execution. It does the following
#   - Creates a temp directory (/tmp/var/appdir)
#   - Copies the content from S3 bucket into /tmp/var/appdir
#   - Executes the script 'run_pipeline.sh'; found in the s3 bucket content
#####################################################################################

# set 

echo "========================================="
echo "Creating the workdir /app/matching/melio_matching ..."
ls lrth
cd matching
ls -lrth

# echo "DBT snapshot running..."
# dbt snapshot

echo "DBT run ..."
dbt run

echo " ------------------------------------- "
echo " Finished!!! "

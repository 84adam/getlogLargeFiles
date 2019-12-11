#!/bin/sh

# Author: Adam Anderson
# Code Repo: https://github.com/84adam/getlogLargeFiles/

# Use this script to locate, list, and log your largest files
# Modify 'size' parameter as needed, i.e. `-size +{###(M/G)}`, e.g. "-size +1G"

# First, create the log file based on today's date.
# This script is intended to be used once a day, for example via a cron job.
# Running this more than once a day will overwrite, instead of appending to, the $LOGFILE

# Exit if not root/sudo user
if [ ! "`whoami`" = "root" ]
then
    echo "This script must be run as root. Exiting..."
    exit 1
fi

# Location to store the logs, appending today's 'Month-day-Year'

LOGFILE="$HOME/LARGEFILES-$(date -u +%b-%d-%Y).log"

# Create this file for today

touch $LOGFILE

# superfluous delay and formatting

sleep .5

echo "All files larger than 100M, logged to: $(echo "$LOGFILE")"
echo " "
echo "##################################################"
echo " "

sleep .5

# List all files greater than 100M in size; 
# print results to terminal 
# log to $LOGFILE using `tee`

find / -xdev -type f -size +100M -exec ls -lah {} \; | sort -k 3,3 -k 5rn | cut -d " " -f 2- | tee $LOGFILE

echo " "
echo "##################################################"
echo " "
echo "Have fun!"

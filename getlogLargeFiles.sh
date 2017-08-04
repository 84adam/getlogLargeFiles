#!/bin/sh

# Use this script to locate, list, and log your largest files
# Modify 'size' parameter as needed, i.e. `-size +{###(M/G)}`, e.g. "-size +1G"

# First, create the log file based on today's date.
# This script is intended to be used once a day, for example via a cron job.
# Running this more than once a day will overwrite, instead of appending to, the $LOGFILE

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

# List all files greater than 100M in size; print results to terminal and log to $LOGFILE using `tee`

find / -xdev -type f -size +100M -exec ls -lah {} \; | tee $LOGFILE

echo " "
echo "##################################################"
echo " "
echo "Have fun!"

# github repo: https://github.com/84adam/getlogLargeFiles/
# download .git: $ wget https://github.com/84adam/getlogLargeFiles.git
# download .zip:  $ wget https://github.com/84adam/getlogLargeFiles/archive/master.zip

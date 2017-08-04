# getlogLargeFiles

### Locates, lists, and logs all files over 100MB in size on your system.

Logs results to `$HOME/LARGEFILES-$(date -u +%b-%d-%Y).log` (one log per day/UTC).

To run, first make executable: `$ sudo chmod +x getlogLargeFiles.sh`

Then run from current directory:

- with sudo: `$ sudo ./getlogLargeFiles.sh` 
- or as root: `# ./getlogLargeFiles.sh`

To list larger size files only, simply edit the "-size" parameter, for example to search for 500MB+ files, do:

`find / -xdev -type f -size +500M -exec ls -la {} \; | sort -k 3,3 -k 5rn | tee $LOGFILE`

Enjoy!

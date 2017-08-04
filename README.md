# getlogLargeFiles

Locates, lists, and logs all files over 100MB in size on your system.

Logs results to `$HOME/LARGEFILES-$(date -u +%b-%d-%Y).log` (one log per day/UTC).

To run, first make executable: `$ sudo chmod +x getlogLargeFiles.sh`

Then run from current directory:

- with sudo: `$ sudo ./getlogLargeFiles.sh` 
- or as root: `# ./getlogLargeFiles.sh`

Enjoy!

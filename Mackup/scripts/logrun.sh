#!/usr/bin/env bash

if [ -z "$2" ]; then
    LOG_DIR=$HOME/var/log
else
    LOG_DIR=$2
fi

LOG_FILE="$LOG_DIR/$(date +'%FT%H%M%S%z')_$1.log"


"$@" 2>&1 | tee $LOG_FILE

##====================================================================
##  Resources
# https://unix.stackexchange.com/questions/278939/how-do-you-put-date-and-time-in-a-file-name
# https://en.wikipedia.org/wiki/ISO_8601
# https://www.baeldung.com/linux/date-command

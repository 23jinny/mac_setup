#!/bin/bash

### Check if input project name was provided
if [ -z "$1" ]; then
    echo "Enter project name"
    exit 1
fi

### Set up
PROJECT=$1
REMOTE_IP=jane.kaist.ac.kr
REMOTE_USER=guest
REMOTE_HOME=/home/$REMOTE_USER/sjlee
REMOTE_PROJECT_DIR=$REMOTE_HOME/projects/$PROJECT
REMOTE_BACKUP_DIR=$REMOTE_HOME/backup/projects/$PROJECT
LOCAL_HOME=$HOME
LOCAL_PROJECT_DIR=$LOCAL_HOME/projects/$PROJECT
# LOCAL_BACKUP_DIR=$LOCAL_HOME/backup/projects/$PROJECT

### Create remote backup folder
##====================================================================
##  Remote operations
#> Create remote backup dir
ssh $REMOTE_USER@$REMOTE_IP "mkdir -p $REMOTE_BACKUP_DIR"

#> Temporarily move files in remote .rsync_exclude

##====================================================================
##  Sync: local -> remote
#> https://linux.die.net/man/1/rsync
rsync --verbose --archive --partial --progress --delete --backup --backup-dir=$REMOTE_BACKUP_DIR $LOCAL_PROJECT_DIR/ $REMOTE_USER@$REMOTE_IP:$REMOTE_PROJECT_DIR

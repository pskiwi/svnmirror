#!/bin/bash
REMOTE=$1
LOCAL=file:///repo
SYNCINIT=/repo/format

if [ ! -f $SYNCINIT ]; then
	echo "syncing with [$REMOTE]"
	if [ -z "$REMOTE" ]; then
	   echo "REMOTE URL not appended"
	   exit 1
	fi	
	svnadmin create /repo
	cp -rf /repo.temp/* /repo/
	svnsync initialize --sync-password syncpasswd --sync-username syncuser $LOCAL $REMOTE
	if [ $? -ne 0 ]; then
       echo "Init sync failed. Remote URL correct ?"
	   exit 2
    fi
	touch $SYNCINIT
fi	

svnsync synchronize $LOCAL

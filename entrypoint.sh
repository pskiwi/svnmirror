#!/bin/bash
REMOTE=$1
echo "syncing with [$REMOTE]"
if [ -z "$REMOTE" ]; then
   echo "REMOTE not set"
   exit 1
fi
svnsync initialize --sync-password syncpasswd --sync-username syncuser file:///repo  $REMOTE
/bin/bash
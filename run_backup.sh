#!/bin/bash
# This is run from cron by /etc/cron.d/CTR-git-backup
# Or run immediately with
# # sudo -i -u gitbackup /data/backups/wbic-git-backup/GitLabBackup/run_backup.sh

# EDIT CONFIGURATION HERE:
ROOTDIR=/data/backups/wbic-git-backup/GitLabBackup
# API KEY must be stored in api.key file with limited permissions
APIKEY=$(< $ROOTDIR/../keys/api.key)
LOGDIR="$ROOTDIR/log"
LOGFILE="$LOGDIR/GitLabBackup.log"


cd "$ROOTDIR"

[ ! -d "$LOGDIR" ] && mkdir "$LOGDIR" && echo "Log folder '$LOGDIR' created successfully."

date "+GitLabBackup running at %Y%m%d-%H%M%S" >> "$LOGFILE"
echo " running as $(id)" >> "$LOGFILE"

DESTDIR="$ROOTDIR/bkup/auto-$(date +%A)"
echo " DESTDIR=$DESTDIR" >> "$LOGFILE"

[ ! -d "$DESTDIR" ] && mkdir "$ROOTDIR/bkup/auto-$(date +%A)"

export GIT_SSH_COMMAND="ssh -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -i $ROOTDIR/../keys/wbic-backup-key"
exec /usr/bin/python3 GitLabBackup.py --backup_dir bkup/auto-$(date +%A) -- https://gitlab.com "$APIKEY" >> "$LOGFILE" 2>&1


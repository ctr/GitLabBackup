## DELETE THIS LINE, AND INSERT YOUR PRIVATE KEY FILENAME AND API KEY BELOW
#!/bin/bash
cd /home/ctr28/wbic-git-backup/GitLabBackup

date "+GitLabBackup running at %Y%m%d-%H%M%S" >> /home/ctr28/wbic-git-backup/GitLabBackup/GitLabBackup.log
echo " running as $(id)" >> /home/ctr28/wbic-git-backup/GitLabBackup/GitLabBackup.log

mkdir bkup-auto-$(date +%A)

export GIT_SSH_COMMAND='ssh -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -i /home/ctr28/wbic-git-backup/keys/wbic-backup-key'
exec /usr/bin/python3 GitLabBackup.py --backup_dir bkup-auto-$(date +%A) -- https://gitlab.com "INSERT_API_KEY_HERE"



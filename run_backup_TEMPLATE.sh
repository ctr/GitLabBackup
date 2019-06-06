## DELETE THIS LINE, AND INSERT YOUR PRIVATE KEY FILENAME AND API KEY BELOW
#!/bin/bash
cd /home/.../GitLabBackup
mkdir bkup-auto-$(date +%A)

export GIT_SSH_COMMAND='ssh -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -i /home/.../backup-key'
exec /usr/bin/python3 GitLabBackup.py --backup_dir bkup-auto-$(date +%A) -- https://gitlab.com "INSERT_API_KEY_HERE"



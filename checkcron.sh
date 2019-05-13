# # !/bin/bash
HOME=/root
LOGNAME=root
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
LANG=en_US.UTF-8
SHELL=/bin/bash
PWD=/root
if [[ $(($(date +%s) - $(date +%s -r /var/spool/cron/crontabs/root))) -lt 86400 ]]
then
	echo "Crontab file has been modified" | sudo /usr/sbin/sendmail root
fi

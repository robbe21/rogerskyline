# !/bin/bash
HOME=/root
LOGNAME=root
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
LANG=en_US.UTF-8
SHELL=/bin/bash
PWD=/root
echo "[DEFAULT]

destmail = root@debian
sender = root@debian
mta = sendmail

action = %(action_mwl)s

[sshd]
enabled = true
port = 60
filter = sshd
bantime = 1m
findtime = 1m
maxretry = 3" >> /etc/fail2ban/jail.local

/etc/init.d/fail2ban restart

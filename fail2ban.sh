# !/bin/bash
HOME=/root
LOGNAME=root
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
LANG=en_US.UTF-8
SHELL=/bin/bash
PWD=/root
echo "[sshd]
port = 60
bantime = 600
maxretry = 3" >> /etc/fail2ban/jail.local

/etc/init.d/fail2ban restart

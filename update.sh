# !/bin/bash
HOME=/root
LOGNAME=root
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
LANG=en_US.UTF-8
SHELL=/bin/bash
PWD=/root
apt-get update >> /var/log/update_script.log
apt-get upgrade >> /var/log/update_script.log
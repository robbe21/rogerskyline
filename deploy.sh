#install yo shiet
apt-get -y install sudo emacs fail2ban apache2 openssh-server
#give user sudo
usermod -aG sudo skrt
#add host-only adapter to network file (for ssh)
cp interfaces /etc/network/interfaces
service networking restart

#set ssh settings
sed -i 's/#Port 22/Port 60/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

#set fail2ban
sh ./fail2ban.sh
#set scripts
chmod 777 update.sh
chmod 777 checkcron.sh
chmod 777 iptables.sh
mv update.sh /etc/cron.d/
mv checkcron.sh /etc/cron.d/
#iptables run on startup (because it is not presistant)
mv iptables.sh /etc/cron.d/

echo "0 4 * * 0 /bin/sh /etc/cron.d/update.sh
@reboot /bin/sh /etc/cron.d/update.sh
0 0 * * * /bin/sh /etc/cron.d/checkcron.sh
@reboot /bin/sh /etc/cron.d/iptables.sh" >> /var/spool/cron/crontabs/root

reboot

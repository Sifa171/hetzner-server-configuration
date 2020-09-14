#/bin/bash
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sed -i 's/#Port 22/Port '"$SSH_PORT"'/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

semanage port -a -t ssh_port_t -p tcp $SSH_PORT
firewall-cmd --add-port=$SSH_PORT/tcp --permanent
firewall-cmd --reload
firewall-cmd --remove-service=ssh --permanent
firewall-cmd --reload
systemctl restart sshd

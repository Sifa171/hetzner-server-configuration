#!/bin/bash
useradd $NEW_USER
usermod -aG wheel $NEW_USER 

echo ''"$NEW_USER"' ALL=(ALL) NOPASSWD: ALL' >> ./$NEW_USER
mv ./$NEW_USER /etc/sudoers.d/

mkdir /home/$NEW_USER/.ssh/
echo ''"$PUBLIC_KEY"'' >> /home/$NEW_USER/.ssh/authorized_keys
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh

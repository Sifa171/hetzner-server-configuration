#!/bin/bash
echo "#### Subscribing System and do an update ####"
sh /root/my-root/server-conf-files/subscribe.sh
echo "#### Configuring SSH ####"
sh /root/my-root/server-conf-files/configureSSH.sh
echo "#### Creating a new user and grant him sudo rights ####"
sh /root/my-root/server-conf-files/createAndConfigureUser.sh
echo "#### Installing tools ####"
sh /root/my-root/server-conf-files/installTools.sh
echo "#### Starting and enabling libvirtd and cockpit ####"
sh /root/my-root/server-conf-files/configureSystem.sh
echo "#### Successfully finished ####"

# my-root

Please checkout https://keithtenzer.com/2019/10/24/how-to-create-a-rhel-8-image-for-hetzner-root-servers/ and learn how to create a RHEL8 image for Hetzner. <br>

First have a look at config.txt and adjust it to your needs.
Copy this repo to local system. Boot Hetzner in rescue mode. Upload RHEL file and config.txt to Hetzner via SCP. <br>

Do in rescue mode:

```
installimage -a -c config.txt
```
Reboot afterwards. <br>


Upload the whole repo via SCP to the fresh system in /root 

Connect via ssh and root user to your system! 
Set all necessary environment variables.
```
export SSH_PORT=
export NEW_USER=
export TOOLS="git ansible @virt tmux cockpit-machines"
export RHN_USER=
export RHN_PASSWORD=
export PUBLIC_KEY=""
```

Finally excute the following script. It will configure:
* subscription for your system
* necessary repositories
* SSH port and relevant changes to firewalld and SELinux
* no RootLogin via SSH and public key authentication only
* a new user
* wheel group for the new user
* passwordless sudo
* authorized keys in new user's home/.ssh/ directory
* all tools set in TOOLS environment variable
* autostarting cockpit and libvirt 

```
sh /root/hetzner-server-configuration/server-conf-files/configureServer.sh
```

Finished!

You can validate your configuration by connecting to your system with user $NEW_USER <br>
You may want to expose cockpit by yourself :-) 

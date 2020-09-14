#!/bin/bash
systemctl start cockpit
systemctl start libvirtd
systemctl enable cockpit
systemctl enable libvirtd

#!/bin/bash
rm /etc/multipath.conf
echo "1. Removed /etc/multipath.conf"
rm /etc/dbus-1/system.d/org.ganesha.nfsd.conf
systemctl restart messagebus
echo "2. Removed /etc/dbus-1/system.d/org.ganesha.nfsd.conf"
systemctl stop metacache
systemctl disable metacache
rm /etc/systemd/system/metacache.service
echo "3. Stopped, disabled, and removed /etc/systemd/system/metacache.service"

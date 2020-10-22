#!/bin/bash
rm /etc/multipath.conf
echo "removed /etc/multipath.conf"
rm /etc/dbus-1/system.d/org.ganesha.nfsd.conf
systemctl restart messagebus
echo "removed /etc/dbus-1/system.d/org.ganesha.nfsd.conf"
systemctl stop metacache
systemctl disable metacache
rm /etc/systemd/system/metacache.service
echo "stopped, disabled, and removed /etc/systemd/system/metacache.service"

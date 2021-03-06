#!/bin/bash
systemctl enable iscsid
systemctl start iscsid
echo YmxhY2tsaXN0IHsKCWRldmljZSB7CgkJdmVuZG9yICJfSEVEVklHXyIKCX0KfQo= | base64 -d > /etc/multipath.conf
echo "1. Created /etc/multipath.conf"
echo PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4gPCEtLSAtKi0gWE1MIC0qLSAtLT4KCjwhRE9DVFlQRSBidXNjb25maWcgUFVCTElDCiItLy9mcmVlZGVza3RvcC8vRFREIEQtQlVTIEJ1cyBDb25maWd1cmF0aW9uIDEuMC8vRU4iCiJodHRwOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zdGFuZGFyZHMvZGJ1cy8xLjAvYnVzY29uZmlnLmR0ZCI+CjxidXNjb25maWc+CiAgPCEtLSBPbmx5IHJvb3QgY2FuIG93biB0aGUgc2VydmljZSAtLT4KICA8cG9saWN5IHVzZXI9InJvb3QiPgogICAgPGFsbG93IG93bj0ib3JnLmdhbmVzaGEubmZzZCIvPgogICAgPGFsbG93IHNlbmRfZGVzdGluYXRpb249Im9yZy5nYW5lc2hhLm5mc2QiLz4KICA8L3BvbGljeT4KICA8cG9saWN5IGNvbnRleHQ9ImRlZmF1bHQiPgogICAgPGRlbnkgb3duPSJvcmcuZ2FuZXNoYS5uZnNkIi8+CgogICAgPGFsbG93IHNlbmRfZGVzdGluYXRpb249Im9yZy5nYW5lc2hhLm5mc2QiCiAgICAgICAgICAgc2VuZF9pbnRlcmZhY2U9Im9yZy5mcmVlZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlIi8+CgogICAgPGFsbG93IHNlbmRfZGVzdGluYXRpb249Im9yZy5nYW5lc2hhLm5mc2QiCiAgICAgICAgICAgc2VuZF9pbnRlcmZhY2U9Im9yZy5nYW5lc2hhLm5mc2QuQ0JTSU0iLz4KCiAgICA8YWxsb3cgc2VuZF9kZXN0aW5hdGlvbj0ib3JnLmdhbmVzaGEubmZzZCIKICAgICAgICAgICBzZW5kX2ludGVyZmFjZT0ib3JnLmdhbmVzaGEubmZzZC5hZG1pbiIvPgoKICAgIDxhbGxvdyBzZW5kX2Rlc3RpbmF0aW9uPSJvcmcuZ2FuZXNoYS5uZnNkIgogICAgICAgICAgIHNlbmRfaW50ZXJmYWNlPSJvcmcuZ2FuZXNoYS5uZnNkLkV4cG9ydE1nciIvPgogIDwvcG9saWN5Pgo8L2J1c2NvbmZpZz4K | base64 -d > /etc/dbus-1/system.d/org.ganesha.nfsd.conf
systemctl restart messagebus
echo "2. Created /etc/dbus-1/system.d/org.ganesha.nfsd.conf"
echo IFtVbml0XQpEZXNjcmlwdGlvbj1TZXR1cCBNZXRhY2FjaGUKQWZ0ZXI9bmV0d29yay50YXJnZXQgdGd0LnNlcnZpY2UgaGVkdmlnZnNjLnNlcnZpY2UKCiBbU2VydmljZV0KVHlwZT1vbmVzaG90CkV4ZWNTdGFydD0vYmluL2Jhc2ggLWMgIi9iaW4vbW91bnQgLXQgdG1wZnMgLW8gc2l6ZT00ZyB0bXBmcyAvdG1wL2hlZHZpZy9jYWNoZSIKRXhlY1N0YXJ0UHJlPS9iaW4vYmFzaCAtYyAiL2Jpbi9ta2RpciAtcCAvdG1wL2hlZHZpZy9jYWNoZSIKUmVtYWluQWZ0ZXJFeGl0PXRydWUKRXhlY1N0b3A9L2Jpbi90cnVlClN0YW5kYXJkT3V0cHV0PWpvdXJuYWwKCiBbSW5zdGFsbF0KV2FudGVkQnk9bXVsdGktdXNlci50YXJnZXQK | base64 -d > /etc/systemd/system/metacache.service
systemctl enable metacache
systemctl start metacache
echo "3. Created and started /etc/systemd/system/metacache.service"
systemctl status iscsid
systemctl status messagebus
systemctl status metacache
df -hk | grep /hedvig/cache
lsmod | grep iscsi

#!/bin/bash

echo -n "Set password survival time: "
sed -i '/^PASS_MAX_DAYS/c PASS_MAX_DAYS   90' /etc/login.defs
sed -i '/^PASS_MIN_DAYS/c PASS_MIN_DAYS   10' /etc/login.defs
sed -i '/^PASS_WARN_AGE/c PASS_WARN_AGE   7' /etc/login.defs
echo "done."

echo -n "Change /etc/passwd permissions: "
chmod 644 /etc/passwd
echo "done."

echo -n "Change /etc/shadow permissions: "
chmod 400 /etc/shadow
echo "done."

echo -n "Change /etc/group permissions: "
chmod 644 /etc/group
echo "done."

echo -n "Change /etc/group permissions: "
chmod 644 /etc/group
echo "done."

#!/bin/bash

echo -n "Set the password complexity ... "
sed -i '/^password\trequisite\t\t\tpam_cracklib.so retry=3 minlen=8 difok=3/c password\trequisite\t\t\tpam_cracklib.so retry=3 minlen=8 difok=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1' /etc/pam.d/common-password
echo "done."

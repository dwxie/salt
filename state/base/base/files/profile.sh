#!/bin/bash

if grep '# Set Idle Interrupt Time' /etc/profile;
then
    true
else
    cat >> /etc/profile << EOF

# Set Idle Interrupt Time
export TMOUT=900
EOF
fi

#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export HOME="/var/lib/rabbitmq"

sudo rabbitmqctl list_queues -p /tracker_app |  sed '1d' | awk '{if ($2 > 250) print $1": "$2" queues"}'


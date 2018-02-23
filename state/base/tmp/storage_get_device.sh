#!/bin/bash

ls -l /dev/disk/by-id/ | grep `grep '9007' -B 9 /opt/storage/storage.conf  | grep 'index_partition_name' | awk -F '-' '{print $3}'` | sed -n 1p

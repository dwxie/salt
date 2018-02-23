#!/bin/bash

echo "New"
grep "part2" /opt/storage.conf
#grep -E "public_ip|local_ip|tracker_server_ip" /opt/storage.conf

echo "Old"
grep "part2" /opt/storageV1/storage.conf
#grep -E "public_ip|local_ip|tracker_server_ip" /opt/storageV1/storage.conf
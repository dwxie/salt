#!/bin/bash

cd /opt/storage
sleep 30s

chmod +x CStorage
./CStorage > /dev/null 2>&1 &

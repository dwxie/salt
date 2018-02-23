#!/bin/bash


curl -L http://127.0.0.1/stat 2>/dev/null|egrep "nginx_rtmp_version"

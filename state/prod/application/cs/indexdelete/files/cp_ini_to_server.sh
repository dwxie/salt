#!/bin/bash

cwd=$(cd `dirname $0` && pwd)
cd $cwd


salt-cp "sjz-web2" ./sjz_server.ini /opt/indexdelete/server.ini
salt-cp "tz-web2" ./tz_server.ini /opt/indexdelete/server.ini
salt-cp "fs-web1" ./fs_server.ini /opt/indexdelete/server.ini
salt-cp "cs-hhy-a2-05-web2" ./cs_server.ini /opt/indexdelete/server.ini

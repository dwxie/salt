#!/bin/bash

cwd=$(cd `dirname $0` && pwd)
cd $cwd


for i in `ls ./cs/*.ini`
do
    salt-cp "cs-hhy-a2-05-stofnd1" $i /opt/index_rec/
done

for i in `ls ./fs/*.ini`
do
    salt-cp "fs-stofnd1" $i /opt/index_rec/
done

for i in `ls ./tz/*.ini`
do
    salt-cp "tz-stofnd1" $i /opt/index_rec/
done

for i in `ls ./sjz/*.ini`
do
    salt-cp "sjz-stofnd1" ./$i /opt/index_rec/
done


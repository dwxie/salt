#!/bin/bash

folders=(bji-relay1 bz-relay1 cs-relay2 cs-relay3 cz-relay1 dal-relay1 gl-relay1 gzi-relay1 haerbi-relay1 jnan-relay1 lx-sjz-relay2 ly-relay1 lz-relay1 nd-relay1 nj-relay1 nning-relay1 nning-relay2 nt-relay1 ny-relay1 qd-relay1 qz-relay1 tj-relay1 ty-relay1 ty-relay2 wf-relay1 wh-relay1 wz-relay1 xf-relay1 xian-relay1 yj-relay1 yyang-relay1 yz-relay1 yz-relay2 zj-relay1 zj-relay2 zjk-relay1 zzi-relay1)

for hostname in ${folders[*]};
do
    touch "${hostname}.sls"
done

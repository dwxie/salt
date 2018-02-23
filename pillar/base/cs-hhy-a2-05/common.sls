hosts:
  present:
    -
      ip: '192.168.2.24'
      hostnames:
        - cs-hhy-a2-05-tracker
    -
      ip: '192.168.2.17'
      hostnames:
        - cs-hhy-a2-05-lvs1
    -
      ip: '192.168.2.20'
      hostnames:
        - cs-hhy-a2-05-lvs2
    -
      ip: '192.168.2.15'
      hostnames:
        - cs-hhy-a2-05-db1
        - cs.index.web.mongo1
        - 1.mongodb.private
        - 1.cs.mongodb.dynamic
    -
      ip: '192.168.2.18'
      hostnames:
        - cs-hhy-a2-05-db2
        - cs.index.web.mongo2
        - 2.mongodb.private
        - 2.cs.mongodb.dynamic
    -
      ip: '192.168.2.21'
      hostnames:
        - cs-hhy-a2-05-db3
        - cs.index.web.mongo3
        - 3.mongodb.private
        - 3.cs.mongodb.dynamic
    -
      ip: '192.168.2.23'
      hostnames:
        - cs-hhy-a2-05-db4
        - cs.index.web.mongo4
        - 4.mongodb.private
        - 4.cs.mongodb.dynamic
    -
      ip: '192.168.2.16'
      hostnames:
        - cs-hhy-a2-05-web1
    -
      ip: '192.168.2.19'
      hostnames:
        - cs-hhy-a2-05-web2
        - disktracker.private
    -
      ip: '192.168.2.22'
      hostnames:
        - cs-hhy-a2-05-web3
        - indexserver.private
    -
      ip: '192.168.2.2'
      hostnames:
        - cs-hhy-a2-05-sto1
    -
      ip: '192.168.2.3'
      hostnames:
        - cs-hhy-a2-05-sto2
    -
      ip: '192.168.2.4'
      hostnames:
        - cs-hhy-a2-05-sto3
    -
      ip: '192.168.2.5'
      hostnames:
        - cs-hhy-a2-05-sto4
    -
      ip: '192.168.2.6'
      hostnames:
        - cs-hhy-a2-05-sto5
    -
      ip: '192.168.2.7'
      hostnames:
        - cs-hhy-a2-05-sto6
    -
      ip: '192.168.2.8'
      hostnames:
        - cs-hhy-a2-05-sto7
    -
      ip: '192.168.2.9'
      hostnames:
        - cs-hhy-a2-05-sto8
    -
      ip: '192.168.2.14'
      hostnames:
        - cs-hhy-a2-05-sto9
    -
      ip: '192.168.2.11'
      hostnames:
        - cs-hhy-a2-05-sto10
    -
      ip: '192.168.2.12'
      hostnames:
        - cs-hhy-a2-05-sto11
    -
      ip: '192.168.2.13'
      hostnames:
        - cs-hhy-a2-05-sto12
    -
      ip: '192.168.2.10'
      hostnames:
        - cs-hhy-a2-05-sto13
    -
      ip: '192.168.2.31'
      hostnames:
        - cs-hhy-a2-05-stofnd1
        - 5.mongodb.private
        - 5.cs.mongodb.dynamic
        - 5.zookeeper.private
        - 5.kafka.private
        - healthchecker.private
    -
      ip: '192.168.2.32'
      hostnames:
        - cs-hhy-a2-05-stofnd2
        - 6.mongodb.private
        - 6.cs.mongodb.dynamic
        - 6.zookeeper.private
        - 6.kafka.private
        - codproducer.private
    -
      ip: '192.168.2.33'
      hostnames:
        - cs-hhy-a2-05-stofnd3
        - 7.mongodb.private
        - 7.cs.mongodb.dynamic
        - 7.zookeeper.private
        - 7.kafka.private
        - codisktracker.private
    -
      ip: '192.168.2.25'
      hostnames:
        - cs-hhy-a2-05-ceph1
    -
      ip: '223.202.103.133'
      hostnames:
        - central.web.mongo1
        - 1.bj.mongodb.dynamic
    -
      ip: '223.202.103.132'
      hostnames:
        - central.web.mongo2
        - 2.bj.mongodb.dynamic
    -
      ip: '223.202.103.141'
      hostnames:
        - central.web.mongo3
        - 3.bj.mongodb.dynamic
    -
      ip: '223.202.103.140'
      hostnames:
        - central.web.mongo4
        - 4.bj.mongodb.dynamic
  only:
  absent:

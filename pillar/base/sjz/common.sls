hosts:
  present:
    -
      ip: '192.168.2.216'
      hostnames:
        - sjz-lvs1
    -
      ip: '192.168.2.217'
      hostnames:
        - sjz-lvs2
    -
      ip: '192.168.2.207'
      hostnames:
        - sjz-db1
        - sjz.index.web.mongo1
        - 1.mongodb.private
        - 1.sjz.mongodb.dynamic
    -
      ip: '192.168.2.208'
      hostnames:
        - sjz-db2
        - sjz.index.web.mongo2
        - 2.mongodb.private
        - 2.sjz.mongodb.dynamic
    -
      ip: '192.168.2.209'
      hostnames:
        - sjz-db3
        - sjz.index.web.mongo3
        - 3.mongodb.private
        - 3.sjz.mongodb.dynamic
    -
      ip: '192.168.2.210'
      hostnames:
        - sjz-db4
        - sjz.index.web.mongo4
        - 4.mongodb.private
        - 4.sjz.mongodb.dynamic
    -
      ip: '192.168.2.211'
      hostnames:
        - sjz-stofnd1
        - 5.mongodb.private
        - 5.sjz.mongodb.dynamic
        - 5.zookeeper.private
        - 5.kafka.private
        - healthchecker.private
    -
      ip: '192.168.2.213'
      hostnames:
        - sjz-stofnd2
        - 6.mongodb.private
        - 6.sjz.mongodb.dynamic
        - 6.zookeeper.private
        - 6.kafka.private
        - codproducer.private
    -
      ip: '192.168.2.214'
      hostnames:
        - sjz-stofnd3
        - 7.mongodb.private
        - 7.sjz.mongodb.dynamic
        - 7.zookeeper.private
        - 7.kafka.private
        - codisktracker.private
    -
      ip: '192.168.2.204'
      hostnames:
        - sjz-web1
    -
      ip: '192.168.2.205'
      hostnames:
        - sjz-web2
        - disktracker.private
    -
      ip: '192.168.2.206'
      hostnames:
        - sjz-web3
        - indexserver.private
    -
      ip: '192.168.2.218'
      hostnames:
        - sjz-sto1
    -
      ip: '192.168.2.219'
      hostnames:
        - sjz-sto2
    -
      ip: '192.168.2.220'
      hostnames:
        - sjz-sto3
    -
      ip: '192.168.2.221'
      hostnames:
        - sjz-sto4
    -
      ip: '192.168.2.222'
      hostnames:
        - sjz-sto5
    -
      ip: '192.168.2.223'
      hostnames:
        - sjz-sto6
    -
      ip: '192.168.2.224'
      hostnames:
        - sjz-sto7
    -
      ip: '192.168.2.225'
      hostnames:
        - sjz-sto8
    -
      ip: '192.168.2.226'
      hostnames:
        - sjz-sto9
    -
      ip: '192.168.2.227'
      hostnames:
        - sjz-sto10
    -
      ip: '192.168.2.228'
      hostnames:
        - sjz-sto11
    -
      ip: '192.168.2.229'
      hostnames:
        - sjz-sto12
    -
      ip: '192.168.2.230'
      hostnames:
        - sjz-sto13
    -
      ip: '192.168.2.212'
      hostnames:
        - sjz-relay3
    -
      ip: '192.168.2.215'
      hostnames:
        - sjz-relay6
    -
      ip: '192.168.2.231'
      hostnames:
        - sjz-relay7
    -
      ip: '192.168.2.232'
      hostnames:
        - sjz-relay8
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

hosts:
  present:
    -
      ip: '192.168.2.216'
      hostnames:
        - tz-lvs1
    -
      ip: '192.168.2.217'
      hostnames:
        - tz-lvs2
    -
      ip: '192.168.2.207'
      hostnames:
        - tz-db1
        - index.web.mongo1
        - tz.index.web.mongo1
        - 1.mongodb.private
        - 1.tz.mongodb.dynamic
    -
      ip: '192.168.2.208'
      hostnames:
        - tz-db2
        - index.web.mongo2
        - tz.index.web.mongo2
        - 2.mongodb.private
        - 2.tz.mongodb.dynamic
    -
      ip: '192.168.2.209'
      hostnames:
        - tz-db3
        - index.web.mongo3
        - tz.index.web.mongo3
        - 3.mongodb.private
        - 3.tz.mongodb.dynamic
    -
      ip: '192.168.2.210'
      hostnames:
        - tz-db4
        - index.web.mongo4
        - tz.index.web.mongo4
        - 4.mongodb.private
        - 4.tz.mongodb.dynamic
    -
      ip: '192.168.2.204'
      hostnames:
        - tz-web1
    -
      ip: '192.168.2.205'
      hostnames:
        - tz-web2
        - disktracker.private
    -
      ip: '192.168.2.206'
      hostnames:
        - tz-web3
        - indexserver.private
    -
      ip: '192.168.2.218'
      hostnames:
        - tz-storage1
    -
      ip: '192.168.2.219'
      hostnames:
        - tz-storage2
    -
      ip: '192.168.2.220'
      hostnames:
        - tz-storage3
    -
      ip: '192.168.2.221'
      hostnames:
        - tz-storage4
    -
      ip: '192.168.2.222'
      hostnames:
        - tz-storage5
    -
      ip: '192.168.2.223'
      hostnames:
        - tz-storage6
    -
      ip: '192.168.2.224'
      hostnames:
        - tz-storage7
    -
      ip: '192.168.2.225'
      hostnames:
        - tz-storage8
    -
      ip: '192.168.2.226'
      hostnames:
        - tz-storage9
    -
      ip: '192.168.2.227'
      hostnames:
        - tz-storage10
    -
      ip: '192.168.2.228'
      hostnames:
        - tz-storage11
    -
      ip: '192.168.2.229'
      hostnames:
        - tz-storage12
    -
      ip: '192.168.2.230'
      hostnames:
        - tz-storage13
    -
      ip: '192.168.2.211'
      hostnames:
        - tz-relay3
    -
      ip: '192.168.2.212'
      hostnames:
        - tz-relay4
    -
      ip: '192.168.2.213'
      hostnames:
        - tz-relay5
    -
      ip: '192.168.2.214'
      hostnames:
        - tz-relay6
    -
      ip: '192.168.2.215'
      hostnames:
        - tz-relay7
    -
      ip: '192.168.2.242'
      hostnames:
        - tz-relay8
    -
      ip: '192.168.2.243'
      hostnames:
        - tz-relay9
    -
      ip: '192.168.2.248'
      hostnames:
        - tz-stofnd1
        - 5.mongodb.private
        - 5.tz.mongodb.dynamic
    -
      ip: '192.168.2.249'
      hostnames:
        - tz-stofnd2
        - 6.mongodb.private
        - 6.tz.mongodb.dynamic
    -
      ip: '192.168.2.251'
      hostnames:
        - tz-stofnd3
        - codisktracker.private
        - 7.mongodb.private
        - 7.tz.mongodb.dynamic
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

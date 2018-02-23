hosts:
  present:
    -
      ip: '192.168.2.228'
      hostnames:
        - fs-lvs1
    -
      ip: '192.168.2.229'
      hostnames:
        - fs-lvs2
    -
      ip: '192.168.2.211'
      hostnames:
        - fs-db1
        - index.web.mongo1
        - 1.mongodb.private
        - 1.fs.mongodb.dynamic
    -
      ip: '192.168.2.212'
      hostnames:
        - fs-db2
        - index.web.mongo2
        - 2.mongodb.private
        - 2.fs.mongodb.dynamic
    -
      ip: '192.168.2.237'
      hostnames:
        - fs-db3
        - index.web.mongo3
        - 3.mongodb.private
        - 3.fs.mongodb.dynamic
    -
      ip: '192.168.2.234'
      hostnames:
        - fs-db4
        - index.web.mongo4
        - 4.mongodb.private
        - 4.fs.mongodb.dynamic
    -
      ip: '192.168.2.216'
      hostnames:
        - fs-stofnd1
        - 5.mongodb.private
        - 5.fs.mongodb.dynamic
        - 5.zookeeper.private
        - 5.kafka.private
        - healthchecker.private
    -
      ip: '192.168.2.217'
      hostnames:
        - fs-stofnd2
        - 6.mongodb.private
        - 6.fs.mongodb.dynamic
        - 6.zookeeper.private
        - 6.kafka.private
        - codproducer.private
    -
      ip: '192.168.2.218'
      hostnames:
        - fs-stofnd3
        - 7.mongodb.private
        - 7.fs.mongodb.dynamic
        - 7.zookeeper.private
        - 7.kafka.private
        - codisktracker.private
    -
      ip: '192.168.2.213'
      hostnames:
        - fs-web1
        - disktracker.private
    -
      ip: '192.168.2.214'
      hostnames:
        - fs-web2
    -
      ip: '192.168.2.215'
      hostnames:
        - fs-web3
        - indexserver.private
    -
      ip: '192.168.2.239'
      hostnames:
        - fs-web4
    -
      ip: '192.168.2.240'
      hostnames:
        - fs-web5
    -
      ip: '192.168.2.244'
      hostnames:
        - fs-sto14
    -
      ip: '192.168.2.242'
      hostnames:
        - fs-sto15
    -
      ip: '192.168.2.243'
      hostnames:
        - fs-sto16
    -
      ip: '192.168.2.241'
      hostnames:
        - fs-sto17
    -
      ip: '192.168.2.249'
      hostnames:
        - fs-sto18
    -
      ip: '192.168.2.250'
      hostnames:
        - fs-sto19
    -
      ip: '192.168.2.246'
      hostnames:
        - fs-sto20
    -
      ip: '192.168.2.251'
      hostnames:
        - fs-sto21
    -
      ip: '192.168.2.252'
      hostnames:
        - fs-sto22
    -
      ip: '192.168.2.248'
      hostnames:
        - fs-sto23
    -
      ip: '192.168.2.245'
      hostnames:
        - fs-sto24
    -
      ip: '192.168.2.247'
      hostnames:
        - fs-sto25
    -
      ip: '192.168.2.253'
      hostnames:
        - fs-sto26
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

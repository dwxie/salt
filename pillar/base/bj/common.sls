hosts:
  present:
    -
      ip: '192.168.2.203'
      hostnames:
        - bj-lvs1
    -
      ip: '192.168.2.204'
      hostnames:
        - bj-lvs2
    -
      ip: '192.168.2.205'
      hostnames:
        - bj-mongo1
        - camera.web.mongo1
        - central.web.mongo1
    -
      ip: '192.168.2.206'
      hostnames:
        - bj-mongo2
        - camera.web.mongo2
        - central.web.mongo2
    -
      ip: '192.168.2.207'
      hostnames:
        - bj-mongo3
        - camera.web.mongo3
        - central.web.mongo3
    -
      ip: '192.168.2.208'
      hostnames:
        - bj-mongo4
    -
      ip: '192.168.2.200'
      hostnames:
        - bj-appweb1
    -
      ip: '192.168.2.218'
      hostnames:
        - bj-appweb4
    -
      ip: '192.168.2.220'
      hostnames:
        - bj-appweb5
    -
      ip: '192.168.2.212'
      hostnames:
        - bj-platweb4
    -
      ip: '192.168.2.213'
      hostnames:
        - bj-platweb5
    -
      ip: '192.168.2.201'
      hostnames:
        - bj-platweb6
    -
      ip: '192.168.2.216'
      hostnames:
        - bj-log3
    -
      ip: '183.57.151.201'
      hostnames:
        - index.web.mongo1
        - 1.fs.mongodb.dynamic
    -
      ip: '183.57.151.202'
      hostnames:
        - index.web.mongo2
        - 2.fs.mongodb.dynamic
    -
      ip: '183.57.151.219'
      hostnames:
        - index.web.mongo3
        - 3.fs.mongodb.dynamic
    -
      ip: '183.57.151.179'
      hostnames:
        - index.web.mongo4
        - 4.fs.mongodb.dynamic
    -
      ip: '122.226.181.21'
      hostnames:
        - tz.index.web.mongo1
        - 1.tz.mongodb.dynamic
    -
      ip: '122.226.181.22'
      hostnames:
        - tz.index.web.mongo2
        - 2.tz.mongodb.dynamic
    -
      ip: '122.226.181.23'
      hostnames:
        - tz.index.web.mongo3
        - 3.tz.mongodb.dynamic
    -
      ip: '122.226.181.24'
      hostnames:
        - tz.index.web.mongo4
        - 4.tz.mongodb.dynamic
    -
      ip: '61.55.189.136'
      hostnames:
        - sjz.index.web.mongo1
        - 1.sjz.mongodb.dynamic
    -
      ip: '61.55.189.137'
      hostnames:
        - sjz.index.web.mongo2
        - 2.sjz.mongodb.dynamic
    -
      ip: '61.55.189.138'
      hostnames:
        - sjz.index.web.mongo3
        - 3.sjz.mongodb.dynamic
    -
      ip: '61.55.189.139'
      hostnames:
        - sjz.index.web.mongo4
        - 4.sjz.mongodb.dynamic
    -
      ip: '103.38.42.82'
      hostnames:
        - cs.index.web.mongo1
        - 1.cs.mongodb.dynamic
    -
      ip: '103.38.42.85'
      hostnames:
        - cs.index.web.mongo2
        - 2.cs.mongodb.dynamic
    -
      ip: '103.38.42.88'
      hostnames:
        - cs.index.web.mongo3
        - 3.cs.mongodb.dynamic
    -
      ip: '103.38.42.90'
      hostnames:
        - cs.index.web.mongo4
        - 4.cs.mongodb.dynamic
  only:
  absent:

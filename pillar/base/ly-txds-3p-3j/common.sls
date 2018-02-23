hosts:
  present:
    -
      ip: '192.168.2.202'
      hostnames:
        - ly-txds-3p-3j-lvs1
    -
      ip: '192.168.2.206'
      hostnames:
        - ly-txds-3p-3j-lvs2
    -
      ip: '192.168.2.200'
      hostnames:
        - ly-txds-3p-3j-web1
    -
      ip: '192.168.2.204'
      hostnames:
        - ly-txds-3p-3j-web2
    -
      ip: '192.168.2.201'
      hostnames:
        - ly-txds-3p-3j-db1
    -
      ip: '192.168.2.205'
      hostnames:
        - ly-txds-3p-3j-db2
    -
      ip: '192.168.2.203'
      hostnames:
        - ly-txds-3p-3j-tracker
    -
      ip: '192.168.2.207'
      hostnames:
        - ly-txds-3p-3j-saltstack
    -
      ip: '192.168.2.210'
      hostnames:
        - ly-txds-3p-3j-logstash1
    -
      ip: '192.168.2.214'
      hostnames:
        - ly-txds-3p-3j-logstash2
    -
      ip: '192.168.2.218'
      hostnames:
        - ly-txds-3p-3j-logstash3
    -
      ip: '192.168.2.208'
      hostnames:
        - ly-txds-3p-3j-elastic1
    -
      ip: '192.168.2.209'
      hostnames:
        - ly-txds-3p-3j-elastic2
    -
      ip: '192.168.2.212'
      hostnames:
        - ly-txds-3p-3j-elastic3
    -
      ip: '192.168.2.213'
      hostnames:
        - ly-txds-3p-3j-elastic4
    -
      ip: '192.168.2.216'
      hostnames:
        - ly-txds-3p-3j-elastic5
    -
      ip: '192.168.2.225'
      hostnames:
        - ly-txds-3p-3j-elastic6
    -
      ip: '192.168.2.226'
      hostnames:
        - ly-txds-3p-3j-elastic7
    -
      ip: '192.168.2.227'
      hostnames:
        - ly-txds-3p-3j-elkstaging1
    -
      ip: '192.168.2.211'
      hostnames:
        - ly-txds-3p-3j-stat1
    -
      ip: '192.168.2.215'
      hostnames:
        - ly-txds-3p-3j-stat2
    -
      ip: '192.168.2.219'
      hostnames:
        - ly-txds-3p-3j-stat3
    -
      ip: '192.168.2.217'
      hostnames:
        - ly-txds-3p-3j-free4
  only:
  absent:

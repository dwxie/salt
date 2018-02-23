hosts:
  present:
    -
      ip: '192.168.1.179'
      hostnames:
        - sh-tyy-1374-db1
        - 1.mongodb.private
        - 1.shty.mongodb.dynamic
    -
      ip: '192.168.1.84'
      hostnames:
        - sh-tyy-2398-web1
        - rabbitmq.private
        - tracker.private
        - disktracker.private
        - indexserver.private
    -
      ip: '192.168.1.34'
      hostnames:
        - sh-tyy-9228-sto1
    -
      ip: '192.168.1.234'
      hostnames:
        - sh-tyy-9228-sto2
    -
      ip: '192.168.1.149'
      hostnames:
        - sh-tyy-9228-sto3
    -
      ip: '192.168.1.13'
      hostnames:
        - sh-tyy-9228-sto4
  only:
  absent:

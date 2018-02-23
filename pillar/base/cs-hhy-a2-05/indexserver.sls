indexserver:
  RUN_QUEUE:
    - 1
    - 2
    - 3
    - 4
    - 5
    - 6
    - 7
    - 8
    - 9
    - 10
    - 11
    - 12
    - 13
    - 14
  GLOBAL:
    log_dir: '/opt/indexserver/logs'
    log_preName: 'indexserver'
    areaID: '5'
    log_level: '5'
    cleanTime: '604800'
    serverName: 'indexserver'
  BLOCKS:
    log_dir: '/opt/indexserver/blocks'
  RABBITMQ_CONSUMER_DISK:
    url_1: 'amqp://orange:831206@192.168.2.16:5672'
    url_2: 'amqp://orange:831206@192.168.2.19:5672'
    url_3: 'amqp://orange:831206@192.168.2.22:5672'
    vhost: '/topvdn'
    exchange: 'storage_msg'
    queue: 'report_'
    routing_key: 'report_key_'
    prefetch: 10
  RABBITMQ_PRODUCTOR_CONFIRM:
    url_1: 'amqp://orange:831206@192.168.2.16:5672'
    url_2: 'amqp://orange:831206@192.168.2.19:5672'
    url_3: 'amqp://orange:831206@192.168.2.22:5672'
    vhost: '/topvdn'
    exchange: 'confirm'
    queue: 'confirm_queue_'
    routing_key: 'confirm_key_'
  MONGODB:
    timeline_host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.15:27017,192.168.2.18:27017,192.168.2.21:27017/?authSource=topvdn&replicaSet=index'
    timelineinfo_host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.15:28017,192.168.2.18:28017,192.168.2.21:28017/?authSource=topvdn&replicaSet=cs_public'
    disk_host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.15:27017,192.168.2.18:27017,192.168.2.21:27017/?authSource=topvdn&replicaSet=index'
  HTTPAGENT:
    http_host: 'http://api.topvdn.com'
    http_appid: 'X-APP-ID:cpmq'
    http_appkey: 'X-APP-Key:414dcb26882e4cdfc93b10152e82c8e4'
  RECOVERY:
    log_fmt: '%Y%m%d'
    log_dir: 'recovey'

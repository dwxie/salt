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
    areaID: '3'
    log_level: '5'
    cleanTime: '604800'
  BLOCKS:
    log_dir: '/opt/indexserver/blocks'
  RABBITMQ_CONSUMER_DISK:
    url_1: 'amqp://orange:831206@192.168.2.204:5672'
    url_2: 'amqp://orange:831206@192.168.2.205:5672'
    url_3: 'amqp://orange:831206@192.168.2.206:5672'
    vhost: '/topvdn'
    exchange: 'storage_msg'
    queue: 'report_'
    routing_key: 'report_key_'
    prefetch: 10
  RABBITMQ_PRODUCTOR_CONFIRM:
    url_1: 'amqp://orange:831206@192.168.2.204:5672'
    url_2: 'amqp://orange:831206@192.168.2.205:5672'
    url_3: 'amqp://orange:831206@192.168.2.206:5672'
    vhost: '/topvdn'
    exchange: 'confirm'
    queue: 'confirm_queue_'
    routing_key: 'confirm_key_'
  MONGODB:
    timeline_host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.207:27017,192.168.2.208:27017,192.168.2.209:27017/?authSource=topvdn&replicaSet=index'
    timelineinfo_host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.207:28017,192.168.2.208:28017,192.168.2.209:28017/?authSource=topvdn&replicaSet=tz_public'
    disk_host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.207:27017,192.168.2.208:27017,192.168.2.209:27017/?authSource=topvdn&replicaSet=index'
  HTTPAGENT:
    http_host: 'http://api.topvdn.com'
    http_appid: 'X-APP-ID:cpmq'
    http_appkey: 'X-APP-Key:414dcb26882e4cdfc93b10152e82c8e4'
  RECOVERY:
    log_fmt: '%Y%m%d'
    log_dir: 'recovey'

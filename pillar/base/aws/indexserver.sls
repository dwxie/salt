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
    areaID: '9'
    log_level: '5'
  BLOCKS:
    log_dir: '/opt/indexserver/blocks'
  RABBITMQ_CONSUMER_DISK:
    url_1: 'amqp://orange:831206@172.31.15.49:5672'
    vhost: '/topvdn'
    exchange: 'storage_msg'
    queue: 'report_'
    routing_key: 'report_key_'
    prefetch: 10
  RABBITMQ_PRODUCTOR_CONFIRM:
    url_1: 'amqp://orange:831206@172.31.15.49:5672'
    vhost: '/topvdn'
    exchange: 'confirm'
    queue: 'confirm_queue_'
    routing_key: 'confirm_key_'
  MONGODB:
    timeline_host: 'mongodb://topvdn:Megaium!@172.31.15.49:27017/?authSource=topvdn'
    timelineinfo_host: 'mongodb://topvdn:Megaium!@172.31.15.49:28017/?authSource=topvdn'
    disk_host: 'mongodb://topvdn:Megaium!@172.31.15.49:27017/?authSource=topvdn'
  HTTPAGENT:
    http_host: '122.226.182.221'
    http_appid: 'X-APP-ID:cpmq'
    http_appkey: 'X-APP-Key:414dcb26882e4cdfc93b10152e82c8e4'
  RECOVERY:
    log_dir: 'recovery'
    log_fmt: '%Y%m%d'

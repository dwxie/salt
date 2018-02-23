indexserver:
  RUN_QUEUE:
    - 1
  GLOBAL:
    log_dir: '/opt/indexserver/logs'
    log_preName: 'indexserver'
    areaID: '1'
    log_level: '5'
    cleanTime: '604800'
    serverName: 'indexserver'
  BLOCKS:
    log_dir: '/opt/indexserver/blocks'
  RABBITMQ_CONSUMER_DISK:
    url_1: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672'
    url_2: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672'
    url_3: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672'
    vhost: '/topvdn'
    exchange: 'storage_msg'
    queue: 'report_'
    routing_key: 'report_key_'
    prefetch: 10
  RABBITMQ_PRODUCTOR_CONFIRM:
    url_1: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672'
    url_2: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672'
    url_3: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672'
    vhost: '/topvdn'
    exchange: 'confirm'
    queue: 'confirm_queue_'
    routing_key: 'confirm_key_'
  MONGODB:
    timeline_host: 'mongodb://topvdn:RcjC677y7V9qm6gCT7c8P5r3G@1.mongodb.private:27017/?authSource=topvdn'
    timelineinfo_host: 'mongodb://topvdn:RcjC677y7V9qm6gCT7c8P5r3G@1.mongodb.private:27017/?authSource=topvdn'
    disk_host: 'mongodb://topvdn:RcjC677y7V9qm6gCT7c8P5r3G@1.mongodb.private:27017/?authSource=topvdn'
  HTTPAGENT:
    http_host: 'http://shty-api.antelopecloud.cn'
    http_appid: 'X-APP-ID:aiis'
    http_appkey: 'X-APP-Key:yk3xruoazf609l6ie7hpbhf71pjnogh0'
  RECOVERY:
    log_fmt: '%Y%m%d'
    log_dir: 'recovey'

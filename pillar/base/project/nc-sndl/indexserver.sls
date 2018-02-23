indexserver:
  RUN_QUEUE:
    - 1
    - 2
    - 3
    - 4
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
    url_1: 'amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.34:5672'
    url_2: 'amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.43:5672'
    url_3: 'amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.13:5672'
    vhost: '/topvdn'
    exchange: 'storage_msg'
    queue: 'report_'
    routing_key: 'report_key_'
    prefetch: 10
  RABBITMQ_PRODUCTOR_CONFIRM:
    url_1: 'amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.34:5672'
    url_2: 'amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.43:5672'
    url_3: 'amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.13:5672'
    vhost: '/topvdn'
    exchange: 'confirm'
    queue: 'confirm_queue_'
    routing_key: 'confirm_key_'
  MONGODB:
    timeline_host: 'mongodb://topvdn:r3aK291srKSjGihelYzoeY2Q@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/?authSource=topvdn'
    timelineinfo_host: 'mongodb://topvdn:r3aK291srKSjGihelYzoeY2Q@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/?authSource=topvdn'
    disk_host: 'mongodb://topvdn:r3aK291srKSjGihelYzoeY2Q@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/?authSource=topvdn'
  HTTPAGENT:
    http_host: 'http://jxsr-api.antelopecloud.cn'
    http_appid: 'X-APP-ID:fkiu'
    http_appkey: 'X-APP-Key:30caf39887ecce47b0d3653d236028b4'
  RECOVERY:
    log_fmt: '%Y%m%d'
    log_dir: 'recovey'

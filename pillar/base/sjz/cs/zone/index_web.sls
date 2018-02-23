index_web:
  nginx:
    user:
      user: 'www-data'
      group: 'www-data'
    worker_processes: {{ grains['num_cpus'] }}
    http:
      include:
        - '/etc/nginx/sites-enabled/*'
    events:
      worker_connections: 65535

  config:
    INDEX_WEB_DEBUG: "True"
    INDEX_WEB_DOMAIN: "http://zone4.topvdn.com"
    INDEX_WEB_SERVER_ID: "4"
    INDEX_WEB_INDEX_PUBLIC_MONGO: "mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@1.mongodb.private:27017,3.mongodb.private:27017/?authSource=topvdn"
    INDEX_WEB_INDEX_PUBLIC_MONGO_PASSWD: ""
    INDEX_WEB_INDEX_PRIVATE_MONGO: "mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@1.mongodb.private:27017,3.mongodb.private:27017/?authSource=topvdn"
    INDEX_WEB_INDEX_PRIVATE_MONGO_PASSWD: ""
    INDEX_WEB_MONGO_HOST: "mongodb://1.mongodb.private:27117,2.mongodb.private:27117,3.mongodb.private:27117/?replicaSet=index_web"
    INDEX_WEB_MONGO_PORT: 27117
    INDEX_WEB_MONGO_DB_NAME: "camera"
    INDEX_WEB_MONGO_USER: "camera"
    INDEX_WEB_MONGO_PWD: "ZumHPRN8WCJkCDFU6Kuvpub9"
    INDEX_WEB_CENTRAL_PLATFORM_HOST: "api.topvdn.com"
    INDEX_WEB_CENTRAL_PLATFORM_PORT: 80
    INDEX_WEB_PLATFORM_APP_ID: "bN2X"
    INDEX_WEB_PLATFORM_APP_KEY: "mgJ7mY3d6Vvu6tpGgk8QYGcUebmNREmv"
    INDEX_WEB_VIDEO_CLIP_EXEC: "/var/www/tools/record_clip_downloader"
    INDEX_WEB_VIDEO_CLIP_DIR: "/data2/download/videos"
    INDEX_WEB_STATS_REQUEST: "True"
    INDEX_WEB_STATSD_HOST: "127.0.0.1"
    INDEX_WEB_STATSD_PORT: "8125"
    INDEX_WEB_STATSD_APP_NAME: "index_web_sjz"
    INDEX_WEB_SENTRY_DSN: "http://d55af15cefe54778be6873ac0fbb89cc:ceb2aabc56e54cc7ab0c85829909107d@121.40.200.9:8088/7"
    INDEX_WEB_FLV_PATH: "/data2/index_web/flv"
    INDEX_WEB_TS_PATH: "/data2/index_web/hls"
    INDEX_WEB_LIB_INDEX: "/var/www/index_web/libs/index/libindex_interface.so"
    INDEX_WEB_LIB_COMMON: "/var/www/index_web/libs/common/libcommon.so"
    INDEX_WEB_LIB_HASH: "/var/www/index_web/libs/hash/libhash.so"
    INDEX_WEB_LIB_TOKEN: "/var/www/index_web/libs/hash/libtoken.so"
    INDEX_WEB_LIB_H2J: "/var/www/index_web/libs/h2j/libh2j.so"
    INDEX_WEB_LIB_FLVDOWNLOAD: "/var/www/index_web/libs/flvdownload/libflvdownload.so"
    INDEX_WEB_LIB_REMUXING: "/var/www/index_web/libs/remuxing/libremuxing.so"
    INDEX_PUBLIC_MONGO_DB: "topvdn"
    INDEX_WEB_CEPH_UPLOAD_POOL: "camera_upload"
    INDEX_WEB_ENCRYPT_KEY: "ffHcbvjZ8PBNQ9s4"
    INDEX_WEB_EVENT_STORAGE_EXCHANGE: 'event_storage'
    INDEX_WEB_EVENT_STORAGE_MQ:
      HOST: '192.168.2.204'
      PORT: 5672
      USER: 'tracker_app'
      PASS: 'Megaium!'
      VHOST: '%2ftracker_app'
      HEARTBEAT_INTERVAL: 30
    INDEX_WEB_INDEX_SYNC_MONGO: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@1.mongodb.private:28017,2.mongodb.private:28017,3.mongodb.private:28017/?authSource=topvdn'
    INDEX_WEB_EVENT_ATTACHMENT_HOST: ''
    INDEX_WEB_KAFKA_SERVERS: ''
    INDEX_WEB_KAFKA_EVENT_TOPIC: 'eventinfo'
    INDEX_WEB_KAFKA_PARTITION_NUM: '0'
    INDEX_WEB_EVENT_MONGO_URL: 'mongodb://topvdn:ZumHPRN8WCJkCDFU6Kuvpub9@1.mongodb.private:27117,2.mongodb.private:27117,3.mongodb.private:27117/?authSource=camera'
    INDEX_WEB_EVENT_MONGO_DB_NAME: 'camera'
    INDEX_WEB_SERVER_IP: '0.0.0.0'
    INDEX_WEB_SERVER_PORT: 8004
    INDEX_WEB_ADFS_HOST: "http://61.55.189.158:8088"
    INDEX_WEB_CELERY_TIMEZONE: "Asia/Shanghai"

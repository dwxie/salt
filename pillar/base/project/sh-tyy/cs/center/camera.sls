camera:
  config:
    CAMERA_DEBUG: "True"
    CAMERA_DOMAIN: "http://shty-api.antelopecloud.cn"
    CAMERA_MONGO_HOST: "mongodb://1.mongodb.private:27017/"
    CAMERA_MONGO_PORT: 27017
    CAMERA_MONGO_DB_NAME: 'camera'
    CAMERA_MONGO_USER: 'camera'
    CAMERA_MONGO_PWD: 'HT351Gb545607T4V99O5Pv6lF'
    CAMERA_REDIS_HOST: '127.0.0.1'
    CAMERA_REDIS_PORT: 6800
    CAMERA_REDIS_DB: 0
    CAMERA_REDIS_PASSWD: 'B0mhHrAn7B62fTwacftB'
    CAMERA_APP_LOG_PATH: '/data/log/supervisor/camera'
    CAMERA_APP_LOG_ROTATE: 'midnight'
    CAMERA_APP_LOG_BACKUPS: 7
    CAMERA_CELERY_BROKER_URL: 'redis://:B0mhHrAn7B62fTwacftB@127.0.0.1:6800/1'
    CAMERA_TRACKER_RELOAD_SCRIPT: '/var/www/camera/scripts/tracker_reload_state.py'
    CAMERA_TRACKER_MQ_HOST: 'rabbitmq.private'
    CAMERA_TRACKER_MQ_PORT: 5672
    CAMERA_TRACKER_MQ_VHOST: '/topvdn'
    CAMERA_TRACKER_MQ_USER: 'topvdn'
    CAMERA_TRACKER_MQ_PASSWD: 'UK2at138w7rB4ob9nYaO'
    CAMERA_MQ_OPTIONS: '{"passwd": "PV8fYL00FykaNOdfLd53", "vhost": "/topvdn", "host": "rabbitmq.private", "user": "topvdn", "port": 5672}'
    CAMERA_TRACKER_MQ_EXCHANGE: 'tracker_msg'
    CAMERA_DEVICE_MQ_EXCHANGE: 'device_state'
    CAMERA_EVENT_STORAGE_EXCHANGE: 'event_storage'
    CAMERA_STATS_REQUEST: True
    CAMERA_STATSD_HOST: '127.0.0.1'
    CAMERA_STATSD_PORT: 8125
    CAMERA_INDEX_HOSTS: '{"1": ["shty-qss1.antelopecloud.cn", 80]}'
    CAMERA_INDEX_TIMELINE_DBS: '{"1": {"passwd": "RcjC677y7V9qm6gCT7c8P5r3G", "db": "topvdn", "host": "mongodb://1.mongodb.private", "replica": "", "user": "topvdn", "port": 27017}}'
    CAMERA_STORAGE_AREAS: '{"1": "shty-qss1.antelopecloud.cn"}'
    CAMERA_SENTRY_DSN: 'http://a0df00936c294fe5b7a687ba4b2e42f2:1fca29905a0e43488dfd5edb9269feac@121.40.200.9:8088/1'
    CAMERA_HLS_FMT: 'http://hls{}.public.server.antelopecloud.cn/live/{}/index.m3u8'
    CAMERA_RTMP_FMT: 'rtmp://rtmp{}.public.server.antelopecloud.cn/'
    CAMERA_PUBLIC_COVER_FMT: 'http://rtmp{}.public.server.antelopecloud.cn/snapshot/{}.jpg?client_token={}'
    CAMERA_IP_DATA: '/var/www/camera/data/ip.dat'
    CAMERA_ENCRYPT_KEY: 'ffHcbvjZ8PBNQ9s4'
    CAMERA_PASSWD_SALT: '8mDdGXEBJWtrNdYCuhDMgfXa4dNXUwvM'
    CAMERA_HLS_URL: 'http://hls{}.public.server.antelopecloud.cn/live/{}/index.m3u8'
    CAMERA_LIB_HASH: '/var/www/camera/libs/hash/libhash.so'
    CAMERA_LIB_COMMON: '/var/www/camera/libs/common/libcommon.so'
    CAMERA_LIB_TOKEN: '/var/www/camera/libs/hash/libtoken.so'
    CAMERA_UPLOAD_SERVERS: '[]'
    CAMERA_STORAGE_AREA_INDEX_MAP: '{}'
    CAMERA_PRIVATE_COVER_FMT: 'http://{}/snapshot/{}.jpg?client_token={}'
    CAMERA_TRACKER_MQ_INFOS: '{"101.89.178.44": {"ip": "101.89.178.44", "mq": "amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672/%2ftopvdn?heartbeat_interval=30"}}'
    CAMERA_EVENT_STORAGE_MQ: 'amqp://topvdn:UK2at138w7rB4ob9nYaO@rabbitmq.private:5672/%2ftopvdn?heartbeat_interval=30'
    CAMERA_INTERNAL_SERVER_APPIDS: '[]'
    CAMERA_OPS_SERVER_APPIDS: '[]'
    CAMERA_HLS_COMMON_FMT: 'http://{}/live/{}/index.m3u8'
    CAMERA_RTMP_COMMON_FMT: 'rtmp://{}/'
    CAMERA_STATS_SERVER_APPIDS: '[]'
    CAMERA_RELAY_PUSH_EXCHANGE: 'relay_push_state'
    CAMERA_PRIVATE_RECORD_DOMAIN: '{}.server.antelopecloud.cn'
    CAMERA_REQUEST_TIMEOUT: 30
    CAMERA_SNAPSHOT_UPLOAD_DURATION: 300
    CAMERA_EVENT_STORAGE_SUPPORT: 'False'
    CAMERA_PUSH_TIMEOUT: 25
    CAMERA_AUTH_GRANT_APPIDS: '[]'
    CAMERA_AUTH_PROVIDE_APPIDS: '[]'
    CAMERA_AUTH_RECEIVE_APPIDS: '[]'
    CAMERA_EVENT_KAFKA_CLIENT_ID: ''
    CAMERA_EVENT_TRANSPORT_KAFKAS: '{}'
    CAMERA_EVENT_KAFKA_QUERY_TIMEOUT: '200'

cs:
  center:
    camera:
      nginx:
        vhosts:
          api.topvdn.com.conf:
            server_names:
              - 'api.topvdn.com'

camera:
  config:
    CAMERA_DEBUG: "True"
    CAMERA_DOMAIN: "http://api.topvdn.com"
    CAMERA_MONGO_HOST: "mongodb://192.168.2.205:27117,192.168.2.206:27117/?replicaSet=camera"
    CAMERA_MONGO_PORT: 27117
    CAMERA_MONGO_DB_NAME: 'camera'
    CAMERA_MONGO_USER: 'camera'
    CAMERA_MONGO_PWD: 'ZumHPRN8WCJkCDFU6Kuvpub9'
    CAMERA_REDIS_HOST: '127.0.0.1'
    CAMERA_REDIS_PORT: 6379
    CAMERA_REDIS_DB: 0
    CAMERA_REDIS_PASSWD: 'ebrWHLFzRrJv8dbJsJN2FRsL'
    CAMERA_APP_LOG_PATH: '/data/log/supervisor/camera'
    CAMERA_APP_LOG_ROTATE: 'midnight'
    CAMERA_APP_LOG_BACKUPS: 7
    CAMERA_CELERY_BROKER_URL: 'redis://:ebrWHLFzRrJv8dbJsJN2FRsL@127.0.0.1:6379/1'
    CAMERA_TRACKER_RELOAD_SCRIPT: '/var/www/camera/scripts/tracker_reload_state.py'
    CAMERA_TRACKER_MQ_HOST: '223.202.103.135'
    CAMERA_TRACKER_MQ_PORT: 5672
    CAMERA_TRACKER_MQ_VHOST: '/yuanman'
    CAMERA_TRACKER_MQ_USER: 'yuanman'
    CAMERA_TRACKER_MQ_PASSWD: 'yuanman_2015'
    CAMERA_MQ_OPTIONS: '{"passwd": "yuanman_2015", "vhost": "/yuanman", "host": "223.202.103.135", "user": "yuanman", "port": 5672}'
    CAMERA_TRACKER_MQ_EXCHANGE: 'tracker_msg'
    CAMERA_DEVICE_MQ_EXCHANGE: 'device_state'
    CAMERA_EVENT_STORAGE_EXCHANGE: 'event_storage'
    CAMERA_STATS_REQUEST: True
    CAMERA_STATSD_HOST: '127.0.0.1'
    CAMERA_STATSD_PORT: 8125
    CAMERA_INDEX_HOSTS: '{"1": ["183.57.151.208", 80],"3":["122.226.181.107",80],"4":["61.55.189.133",80], "5": ["103.38.42.99", 80]}'
    CAMERA_INDEX_TIMELINE_DBS: '{"1": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://192.168.2.205:28017,183.57.151.201:28017", "replica": "public", "user": "topvdn", "port": 28017}, "3": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://122.226.181.22:28017,192.168.2.206:28017", "replica": "tz_public", "user": "topvdn", "port": 28017}, "5": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://192.168.2.205:28037,103.38.42.85:28017", "replica": "cs_public", "user": "topvdn", "port": 28037}, "4": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://192.168.2.206:28027,61.55.189.137:28017", "replica": "sjz_public", "user": "topvdn", "port": 28027}}'
    CAMERA_STORAGE_AREAS: '{"8": "61.55.189.133", "4": "183.57.151.208", "7": "122.226.181.18", "1": "s.test.topvdn.com"}'
    CAMERA_SENTRY_DSN: 'http://a0df00936c294fe5b7a687ba4b2e42f2:1fca29905a0e43488dfd5edb9269feac@121.40.200.9:8088/1'
    CAMERA_HLS_FMT: 'http://hls{}.public.topvdn.cn/live/{}/index.m3u8'
    CAMERA_RTMP_FMT: 'rtmp://rtmp{}.public.topvdn.cn/'
    CAMERA_PUBLIC_COVER_FMT: 'http://rtmp{}.public.topvdn.cn/snapshot/{}.jpg?client_token={}'
    CAMERA_IP_DATA: '/var/www/camera/data/ip.dat'
    CAMERA_ENCRYPT_KEY: 'ffHcbvjZ8PBNQ9s4'
    CAMERA_PASSWD_SALT: '8mDdGXEBJWtrNdYCuhDMgfXa4dNXUwvM'
    CAMERA_HLS_URL: 'http://hls{}.public.topvdn.cn/live/{}/index.m3u8'
    CAMERA_LIB_HASH: '/var/www/camera/libs/hash/libhash.so'
    CAMERA_LIB_COMMON: '/var/www/camera/libs/common/libcommon.so'
    CAMERA_LIB_TOKEN: '/var/www/camera/libs/hash/libtoken.so'
    CAMERA_UPLOAD_SERVERS: '["3"]'
    CAMERA_STORAGE_AREA_INDEX_MAP: '{"8": "4","4": "1","7": "3"}'
    CAMERA_PRIVATE_COVER_FMT: 'http://{}/snapshot/{}.jpg?client_token={}'
    CAMERA_TRACKER_MQ_INFOS: '{"42.51.7.44": {"ip": "42.51.7.44", "mq": "amqp://tracker_app:Megaium!@42.51.7.38:5672/%2ftracker_app?heartbeat_interval=30"}, "103.38.42.91": {"ip": "103.38.42.91", "mq": "amqp://tracker_app:Megaium!@103.38.42.83:5672/%2ftracker_app?heartbeat_interval=31"}, "223.202.103.130": {"ip": "223.202.103.130", "mq": "amqp://tracker_app:Megaium!@223.202.103.142:5672/%2ftracker_app?heartbeat_interval=30"}, "61.55.189.131": {"ip": "61.55.189.131", "mq": "amqp://tracker_app:Megaium!@61.55.189.133:5672/%2ftracker_app?heartbeat_interval=30"}, "122.226.181.30": {"ip": "122.226.181.30", "mq": "amqp://tracker_app:Megaium!@122.226.181.18:5672/%2ftracker_app?heartbeat_interval=30"},"183.57.151.206": {"ip": "183.57.151.206", "mq": "amqp://tracker_app:Megaium!@183.57.151.203:5672/%2ftracker_app?heartbeat_interval=30"}}'
    CAMERA_EVENT_STORAGE_MQ: 'amqp://yuanman:yuanman_2015@223.202.103.135:5672/%2fyuanman?heartbeat_interval=30'
    CAMERA_INTERNAL_SERVER_APPIDS: '["RBWz", "ujU2", "bN2X", "fkgr", "cpmq", "b5f7"]'
    CAMERA_OPS_SERVER_APPIDS: '["qaaa"]'
    CAMERA_HLS_COMMON_FMT: 'http://{}/live/{}/index.m3u8'
    CAMERA_RTMP_COMMON_FMT: 'rtmp://{}/'
    CAMERA_STATS_SERVER_APPIDS: '["fkgr"]'
    CAMERA_RELAY_PUSH_EXCHANGE: 'relay_push_state'
    CAMERA_PRIVATE_RECORD_DOMAIN: '{}.server.topvdn.com'
    CAMERA_REQUEST_TIMEOUT: 30
    CAMERA_SNAPSHOT_UPLOAD_DURATION: 300
    CAMERA_EVENT_STORAGE_SUPPORT: 'False'
    CAMERA_PUSH_TIMEOUT: 25
    CAMERA_AUTH_GRANT_APPIDS: '["upwe", "Test", "yzmi","uprb", "kmku", "qmqb", "uihy", "tzov", "iuzc", "rnum", "ojib", "qsxg", "ttns", "vnrj"]'
    CAMERA_AUTH_PROVIDE_APPIDS: '["Test", "YjNG", "tzfi"]'
    CAMERA_AUTH_RECEIVE_APPIDS: '["upwe", "Test", "yzmi","uprb", "kmku", "qmqb", "uihy", "tzov", "iuzc", "rnum", "ojib", "qsxg", "ttns", "vnrj"]'
    CAMERA_EVENT_KAFKA_CLIENT_ID: 'platweb-event-kafka-consumer'
    CAMERA_EVENT_TRANSPORT_KAFKAS: '{"2":{"brokers":"223.202.132.166:9092,223.202.132.163:9092,223.202.132.169:9092"}}'
    CAMERA_EVENT_KAFKA_QUERY_TIMEOUT: '1000'
    CAMERA_LIMIT_ON: 'False'
    CAMERA_LIMIT_UPDATE_INTERVAL: '30'
    CAMERA_CELERYD_CONCURRENCY: '30'

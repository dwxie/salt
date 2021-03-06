developers:
  config:
    DEVELOPERS_DEBUG: 'True'
    DEVELOPERS_DOMAIN: 'http://console.topvdn.com'
    DEVELOPERS_TOPVDN_HOST: 'api.topvdn.com'
    DEVELOPERS_TOPVDN_PORT: 80
    DEVELOPERS_MONGO_HOST: 'mongodb://192.168.2.202:27517,192.168.2.201:27517,192.168.2.200:27517/?replicaSet=camera_app'
    DEVELOPERS_MONGO_PORT: 27517
    DEVELOPERS_MONGO_DB_NAME: 'developers'
    DEVELOPERS_MONGO_USER: 'developers'
    DEVELOPERS_MONGO_PWD: 'XwkqUz2a8cN8yAuHTMgXJAEC'
    DEVELOPERS_REDIS_HOST: '223.202.103.135'
    DEVELOPERS_REDIS_PORT: 6379
    DEVELOPERS_REDIS_DB: 0
    DEVELOPERS_REDIS_PASSWD: 'app135'
    DEVELOPERS_TRACKER_MQ_HOST: '223.202.103.135'
    DEVELOPERS_TRACKER_MQ_PORT: 5672
    DEVELOPERS_TRACKER_MQ_VHOST: '/yuanman'
    DEVELOPERS_TRACKER_MQ_USER: 'yuanman'
    DEVELOPERS_TRACKER_MQ_PASSWD: 'yuanman_2015'
    DEVELOPERS_TRACKER_MQ_EXCHANGE: 'tracker_msg'
    DEVELOPERS_DEVICE_MQ_EXCHANGE: 'device_state'
    DEVELOPERS_STATS_REQUEST: 'False'
    DEVELOPERS_STATSD_HOST: '127.0.0.1'
    DEVELOPERS_STATSD_PORT: 8125
    DEVELOPERS_SENTRY_DSN: 'http://77d4598881244c6f95fbe4fc89e0c802:20a8c06346764f8da61a21ac34fd44ff@121.40.200.9:8088/6'
    DEVELOPERS_IP_DATA: '/var/www/developers/data/ip.dat'
    DEVELOPERS_ENCRYPT_KEY: 'ffHcbvjZ8PBNQ9s4'
    DEVELOPERS_PASSWD_SALT: '8mDdGXEBJWtrNdYCuhDMgfXa4dNXUwvM'
    DEVELOPERS_HLS_URL: 'http://hlstest.public.topvdn.cn:8080/hls/{}/index.m3u8'
    DEVELOPERS_LIB_HASH: '/var/www/developers/libs/hash/libhash.so'
    DEVELOPERS_LIB_COMMON: '/var/www/developers/libs/common/libcommon.so'
    DEVELOPERS_LIB_TOKEN: '/var/www/developers/libs/hash/libtoken.so'

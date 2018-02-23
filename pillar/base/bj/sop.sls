sop:
  config:
    SOP_DEBUG: False
    SOP_DOMAIN: 'https://console.topvdn.com'
    SOP_USC_DOMAIN: 'https://console.topvdn.com'
    SOP_MONGO_URL: 'mongodb://camera:ZumHPRN8WCJkCDFU6Kuvpub9@192.168.2.205:27117,192.168.2.206:27117,192.168.2.207:27117/camera?authSource=camera&authMechanism=SCRAM-SHA-1&readPreference=primaryPreferred'
    SOP_MONGO_DB_NAME: 'camera'
    SOP_CELERY_BROKER_URL: 'redis://:f1c03d16c580972473367f5ad07edfd3@127.0.0.1:6800/1'
    SOP_CELERYD_CONCURRENCY: 20
    SOP_SERVER_IP: '127.0.0.1'
    SOP_SERVER_PORT: 7008
    SOP_GUNICORN_WORKER_NUM: 33
    SOP_PASSWD_SALT: 'bc6f093b1afca190d97b8ffa717dedae'
    SOP_SECRET_KEY: 'f251e5396a3919f6bceb7e67fc71e823'
    SOP_MAIL_SERVER: 'smtp.mxhichina.com'
    SOP_MAIL_PORT: 25
    SOP_MAIL_USERNAME: 'sysmail@topvdn.com'
    SOP_MAIL_PASSWORD: 'Megaium!'
    SOP_DEFAULT_MAIL_SENDER: 'sysmail@topvdn.com'
    SOP_LIB_TOKEN: '/var/www/sop/libs/token/libtoken.so'
    SOP_STATS_SERVER_HOST: '42.51.12.141'
    SOP_STATS_SERVER_PORT: 8077
    SOP_INDEX_TIMELINE_DBS: '{"1": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://223.202.103.133:28017,183.57.151.201:28017", "replica": "public", "user": "topvdn", "port": 28017},"3": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "223.202.103.132", "replica": "tz_public", "user": "topvdn", "port": 28017},"4": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "223.202.103.132", "replica": "sjz_public", "user": "topvdn", "port": 28027}, "5": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://192.168.2.205:28037,103.38.42.85:28017", "replica": "cs_public", "user": "topvdn", "port": 28037}}'
    SOP_INDEX_HOSTS: '{"1": ["183.57.151.208", 80],"3":["122.226.181.18",80],"4":["61.55.189.133",80], "5": ["103.38.42.83", 80]}'
    SOP_CELERY_TIMEZONE: 'Asia/Shanghai'
    SOP_IP_FILE: '/var/www/sop/static/ip.txt'
    SOP_DATA_ENCRYPT_KEY: '1Jd0d3pC-7G2C4nU7Td8tc7k9rQLlP99z_0zU7spC3M='

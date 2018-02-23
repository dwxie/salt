usc:
  config:
    CONSOLE_DEBUG: 'True'
    CONSOLE_DOMAIN: 'https://console.topvdn.com'
    CONSOLE_MONGO_HOST: 'mongodb://192.168.2.205:27117,192.168.2.206:27117,192.168.2.207:27117/?replicaSet=camera'
    CONSOLE_MONGO_PORT: 27117
    CONSOLE_MONGO_DB_NAME: 'camera'
    CONSOLE_MONGO_USER: 'camera'
    CONSOLE_MONGO_PWD: 'ZumHPRN8WCJkCDFU6Kuvpub9'
    CONSOLE_REDIS_HOST: '127.0.0.1'
    CONSOLE_REDIS_PORT: 6800
    CONSOLE_REDIS_DB: 2
    CONSOLE_REDIS_PASSWD: 'f1c03d16c580972473367f5ad07edfd3'
    CONSOLE_MAIL_SERVER: 'smtp.mxhichina.com'
    CONSOLE_MAIL_PORT: 25
    CONSOLE_MAIL_USERNAME: 'sysmail@topvdn.com'
    CONSOLE_MAIL_PASSWORD: 'Megaium!'
    CONSOLE_DEFAULT_MAIL_SENDER: 'sysmail@topvdn.com'
    CONSOLE_SENTRY_DSN: 'http://5c324a585e8842a4a40d8c9e3f97a819:cf8100b80a2740d4b1fcd709d60ca322@121.40.200.9:8088/9'
    CONSOLE_YTX_ACCOUNT_ID: 'aaf98f894f2efdde014f3996241f054c'
    CONSOLE_YTX_AUTH_TOKEN: 'a1d1489311984db4b55613d4dff7b39f'
    CONSOLE_YTX_APP_ID: '8a48b5514f2b46d0014f3998a91c1278'
    CONSOLE_INDEX_HOSTS: '{"1": ["183.57.151.208", 80],"3":["122.226.181.18",80],"4":["61.55.189.133",80], "5": ["103.38.42.83", 80]}'
    CONSOLE_RECORD_CLIP_URL: 'http://{ip}/download/videos/{path}?{token}'
    CONSOLE_ENCRYPT_KEY: '7fd9cb64a9cf9767'
    CONSOLE_PASSWD_SALT: 'bc6f093b1afca190d97b8ffa717dedae'
    CONSOLE_SECRET_KEY: 'f251e5396a3919f6bceb7e67fc71e823'
    CONSOLE_LIB_TOKEN: '/var/www/console/libs/hash/libtoken.so'
    CONSOLE_STORAGE_AREAS: '{"8": "61.55.189.133", "4": "183.57.151.208", "7": "122.226.181.18", "1": "s.test.topvdn.com"}'
    CONSOLE_INDEX_TIMELINE_DBS: '{"1": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://223.202.103.133:28017,183.57.151.201:28017", "replica": "public", "user": "topvdn", "port": 28017},"3": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "223.202.103.132", "replica": "tz_public", "user": "topvdn", "port": 28017},"4": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "223.202.103.132", "replica": "sjz_public", "user": "topvdn", "port": 28027}, "5": {"passwd": "XwkqUz2a8cN8yAuHTMgXJAEC", "db": "topvdn", "host": "mongodb://192.168.2.205:28037,103.38.42.85:28017", "replica": "cs_public", "user": "topvdn", "port": 28037}}'
    CONSOLE_CELERY_BROKER_URL: 'redis://:f1c03d16c580972473367f5ad07edfd3@127.0.0.1:6800/1'
    CONSOLE_LOGCENTER_HOST: '42.51.12.141'
    CONSOLE_LOGCENTER_PORT: 8077
    CONSOLE_DEFAULT_INIT_STRING: '[Config]\r\nIsDebug=0\r\nLocalBasePort=8200\r\nIsCaptureDev=1\r\nIsPlayDev=1\r\nUdpSendInterval=2\r\n[Tracker]\r\nCount=3\r\nIP1=103.38.42.91\r\nPort1=443\r\nIP2=122.226.181.30\r\nPort2=443\r\nIP3=42.51.7.44\r\nPort3=8000\r\n[LogServer]\r\nCount=1\r\nIP1=42.51.12.137\r\nPort1=80\r\n'
    CONSOLE_DATA_ENCRYPT_KEY: '1Jd0d3pC-7G2C4nU7Td8tc7k9rQLlP99z_0zU7spC3M='

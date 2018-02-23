sto_stat:
  config:
    STORAGESTAT_DATA_NUM: 8
    STORAGESTAT_REDUNDANCY_NUM: 4
    STORAGESTAT_INDEX_PUBLIC_MONGO: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@1.mongodb.private:28017,2.mongodb.private:28017,3.mongodb.private:28017/?authSource=topvdn'
    STORAGESTAT_INDEX_PUBLIC_MONGO_DB: topvdn
    STORAGESTAT_INDEX_MONGO: "mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@2.mongodb.private:27017,1.mongodb.private:27017/?authSource=topvdn&replicaSet=index"
    STORAGESTAT_INDEX_MONGO_DB: topvdn
    STORAGESTAT_CAMERA_MONGO: "mongodb://camera:ZumHPRN8WCJkCDFU6Kuvpub9@1.mongodb.private:27117,2.mongodb.private:27117,3.mongodb.private:27117/camera?replicaSet=index_web&authMechanism=SCRAM-SHA-1"
    STORAGESTAT_CAMERA_MONGO_DB: camera
    STORAGESTAT_CELERY_TIMEZONE: Asia/Shanghai
    STORAGESTAT_BROKER_URL: redis://:BzpUCHeuJjr4qZFDQ9zR2JkLyXeAejQCpVArDNHQfxPTkhuh@127.0.0.1:6800/0
    STORAGESTAT_STAT_LOG_DIR: '/opt/indexserver/blocks/'
    STORAGESTAT_LOG_BACK_UP_DIR: '/data/storage_log/'
    STORAGESTAT_ERROR_LOG_PATHCH: '/data/log/zabbix/storagestat.log'


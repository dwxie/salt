MachineID: 3079323567
index_web:
  config: {INDEX_WEB_BROKER_URL: 'redis://:123456@127.0.0.1:6800/3', INDEX_WEB_CEPH_CONFIG: '',
    INDEX_WEB_CEPH_TS_POOL: '', INDEX_WEB_CEPH_UPLOAD_POOL: '', INDEX_WEB_IP: 172.31.15.49,
    INDEX_WEB_REDIS_DB: '2', INDEX_WEB_REDIS_HOST: 127.0.0.1, INDEX_WEB_REDIS_PASSWD: '123456',
    INDEX_WEB_REDIS_PORT: '6800'}
mongodb:
  replications:
    index:
      instances:
      - net: {port: 27017}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/aws_mongo_key, salt_source_file: application/mongodb/files/aws_mongo_key}
    index_web:
      instances:
      - net: {port: 27117}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/aws_mongo_key, salt_source_file: application/mongodb/files/aws_mongo_key}
    public:
      instances:
      - net: {port: 28017}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/aws_mongo_key, salt_source_file: application/mongodb/files/aws_mongo_key}

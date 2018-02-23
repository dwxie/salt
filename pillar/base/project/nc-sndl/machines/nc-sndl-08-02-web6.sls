MachineID: 756363758
cs:
  zone:
    nginx:
      vhosts:
        zone.antelopecloud.cn.conf:
          server_names: [218.95.36.50, jxsr-qss1.antelopecloud.cn]
index_web:
  config: {INDEX_WEB_BROKER_URL: 'redis://:123456@127.0.0.1:6800/3', INDEX_WEB_CEPH_CONFIG: '',
    INDEX_WEB_CEPH_TS_POOL: event_storage, INDEX_WEB_IP: 218.95.36.13, INDEX_WEB_REDIS_DB: '2',
    INDEX_WEB_REDIS_HOST: 127.0.0.1, INDEX_WEB_REDIS_PASSWD: '123456', INDEX_WEB_REDIS_PORT: '6800'}
smpagent:
  plugins:
    collector:
      collector:
        config:
          tasks:
          - {args: python /opt/smpagent/scrpits/get_info/get_info.py, collector: cmd,
            cron: 1 * * * * *, type: service_sys}
          - {args: 'http://127.0.0.1:8004/stats/request', collector: http, cron: 1
              * * * * *, type: service_web}
          - {args: 'http://127.0.0.1:9527/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_tracker}
          - {args: 'http://127.0.0.1:7001/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_diskindex}
          - {args: 'http://127.0.0.1:7002/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_diskindex}
          - {args: 'http://127.0.0.1:7003/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_diskindex}
          - {args: 'http://127.0.0.1:7004/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_diskindex}
tracker:
  config:
    tracker:
      http_center_web: {local_ip: 218.95.36.13}
      max_peer_count: 32768
      max_relay_count: 256
      rabbitmq_message:
        exchange: tracker_msg
        queue_name: tracker_218.95.36.13_q
        routing_key: tracker_218.95.36.13
        url: ['amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.13:5672']
        vhost: /topvdn
      rabbitmq_status_report:
        exchange: device_state
        url: ['amqp://topvdn:W1rvtlViBO3RLwklImKO@192.168.2.13:5672']
        vhost: /topvdn
      recv_packet_queue_length: 65536
      send_packet_queue_length: 65536
      tracker_ip: 218.95.36.13

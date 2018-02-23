MachineID: 3272923129
index_web:
  config: {INDEX_WEB_BROKER_URL: 'redis://:B0mhHrAn7B62fTwacftB@127.0.0.1:6800/3', INDEX_WEB_CEPH_CONFIG: '',
    INDEX_WEB_CEPH_TS_POOL: event_storage, INDEX_WEB_IP: 101.89.178.44, INDEX_WEB_REDIS_DB: '2',
    INDEX_WEB_REDIS_HOST: 127.0.0.1, INDEX_WEB_REDIS_PASSWD: 'B0mhHrAn7B62fTwacftB', INDEX_WEB_REDIS_PORT: '6800'}
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
          - {args: 'http://127.0.0.1:8006/stats/request', collector: http, cron: 1
              * * * * *, type: service_web}
          - {args: 'http://127.0.0.1:9527/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_tracker}
          - {args: 'http://127.0.0.1:5731/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disktracker}
          - {args: 'http://127.0.0.1:7001/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_diskindex}
tracker:
  config:
    tracker:
      http_center_web: {local_ip: 101.89.178.44}
      max_peer_count: 32768
      max_relay_count: 256
      rabbitmq_message:
        exchange: tracker_msg
        queue_name: tracker_101.89.178.44_q
        routing_key: tracker_101.89.178.44
        url: ['amqp://topvdn:UK2at138w7rB4ob9nYaO@192.168.1.84:5672']
        vhost: /topvdn
      rabbitmq_status_report:
        exchange: device_state
        url: ['amqp://topvdn:UK2at138w7rB4ob9nYaO@192.168.1.84:5672']
        vhost: /topvdn
      recv_packet_queue_length: 65536
      send_packet_queue_length: 65536
      tracker_ip: 101.89.178.44

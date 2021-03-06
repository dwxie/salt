elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: tracker_business}
          fields_under_root: true
          paths: [/opt/tracker/log/business.log]
        - fields:
          - {type: tracker_statistic}
          fields_under_root: true
          paths: [/opt/tracker/log/statistic.log]
tracker:
  config:
    tracker:
      http_center_web: {local_ip: 61.55.189.131}
      max_peer_count: 32768
      max_relay_count: 256
      rabbitmq_message:
        exchange: tracker_msg
        queue_name: tracker_61.55.189.131_q
        routing_key: tracker_61.55.189.131
        url: ['amqp://tracker_app:Megaium!@61.55.189.133:5672']
        vhost: /tracker_app
      rabbitmq_status_report:
        exchange: device_state
        url: ['amqp://tracker_app:Megaium!@61.55.189.133:5672']
        vhost: /tracker_app
      recv_packet_queue_length: 65536
      send_packet_queue_length: 65536
      tracker_ip: 61.55.189.131

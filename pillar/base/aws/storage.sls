storage:
  ExpireDay: 7
  mem_cache: 512
  download_cache: 270
  tracker_server_ip: 'disktracker.private'
  tracker_server_port: 5730
  rabbitmq_cluster:
    -
      enable: 1
      ip: '192.168.2.204'
      port: 5672
      username: 'orange'
      password: '831206'
    -
      enable: 1
      ip: '192.168.2.205'
      port: 5672
      username: 'orange'
      password: '831206'
    -
      enable: 1
      ip: '192.168.2.206'
      port: 5672
      username: 'orange'
      password: '831206'

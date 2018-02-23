storage:
  ExpireDay: 7
  mem_cache: 512
  download_cache: 270
  tracker_server_ip: 'disktracker.private'
  tracker_server_port: 5730
  rabbitmq_cluster:
    -
      enable: 1
      ip: '192.168.2.34'
      port: 5672
      username: 'topvdn'
      password: 'W1rvtlViBO3RLwklImKO'
    -
      enable: 1
      ip: '192.168.2.43'
      port: 5672
      username: 'topvdn'
      password: 'W1rvtlViBO3RLwklImKO'
    -
      enable: 1
      ip: '192.168.2.13'
      port: 5672
      username: 'topvdn'
      password: 'W1rvtlViBO3RLwklImKO'

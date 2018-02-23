cos:
  nginx:
    config:
      config:
        center_server_config:
          server_ip: 'jxsr-api.antelopecloud.cn'
          server_port: 80
          app_id: 'kooo'
          app_key: 'aadbb26e307776fbfb5c9c8fbb2c4986'
    vhosts:
      jxsr-oss.antelopecloud.cn.conf:
        server_names:
          - 'jxsr-oss1.antelopecloud.cn'

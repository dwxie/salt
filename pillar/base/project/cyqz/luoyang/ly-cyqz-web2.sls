cyqz:
  backend:
    application:
      config:
        serverNode: 's2'
        mediaRoot: '/data2/cyqz/media/'
    web_api:
      application:
        server:
          port: 8090
        config:
          redisInit: 'false'
    web_service:
      application:
        server:
          port: 8091
        config:
          redisInit: 'false'
  frontend:
    node: '2'

elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
          -
            paths:
              - '/usr/local/services/nginx/logs/api.cyqzmain.netposa.com.access.log'
            fields:
              -
                type: 'cyqz_nginx'
                role: 'source'
                beats_role: 'source'
                beats_module: 'api'
            fields_under_root: true
          -
            paths:
              - '/usr/local/services/nginx/logs/service.cyqzmain.netposa.com.access.log'
            fields:
              -
                type: 'cyqz_nginx'
                role: 'source'
                beats_role: 'source'
                beats_module: 'service'
            fields_under_root: true

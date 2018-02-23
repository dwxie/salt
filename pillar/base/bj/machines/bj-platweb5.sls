elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: platweb_nginx}
          fields_under_root: true
          paths: [/opt/nginx/logs/api.topvdn.com.access.log]
        - fields:
          - {type: platweb_log}
          fields_under_root: true
          paths: [/data/log/supervisor/camera/application.log]

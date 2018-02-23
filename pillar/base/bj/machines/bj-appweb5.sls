elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: appweb_nginx}
          fields_under_root: true
          paths: [/opt/nginx/logs/console.topvdn.com.access.log]

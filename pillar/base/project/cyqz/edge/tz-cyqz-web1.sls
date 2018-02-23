elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
          -
            paths:
              - '/var/log/nginx/case.netposa.com.access.log'
            fields:
              -
                type: 'cyqz_nginx'
                role: 'edge'
                beats_role: 'edge'
            fields_under_root: true

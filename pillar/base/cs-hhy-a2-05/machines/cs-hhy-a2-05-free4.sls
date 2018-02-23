elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 4g
    elasticsearch:
      network: {host: 192.168.2.30}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'true'
        name: hot2
      path:
        data: [/disk/1, /disk/2]
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: tracker_business}
          fields_under_root: true
          paths: [/opt/tracker_business.log]
        - fields:
          - {type: tracker_statistic}
          fields_under_root: true
          paths: [/opt/tracker_statistic.log]
        - fields:
          - {type: rtmp_record}
          fields_under_root: true
          paths: [/opt/rtmp_record.log]
        - fields:
          - {type: platweb_log}
          fields_under_root: true
          paths: [/opt/platweb_log.log]
        - fields:
          - {type: storage}
          fields_under_root: true
          paths: [/opt/storage.log]
        - fields:
          - {type: http_access_log}
          fields_under_root: true
          paths: [/opt/http_access_log.log]
        - fields:
          - {type: rtmp_access_log}
          fields_under_root: true
          paths: [/opt/rtmp_access_log.log]

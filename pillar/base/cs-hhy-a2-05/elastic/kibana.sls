elastic:
  kibana:
    version: '5.2.2'
    sha1: 'a9c9a74a0684756bced3d0009a09a4006e5b258e'
    config:
      server:
        host: '0.0.0.0'
        port: 5601
        basePath: '/kibana'
        maxPayloadBytes: 1048576
      elasticsearch:
        url: 'http://127.0.0.1:9200'
        pingTimeout: 1500
        requestTimeout: 30000
        startupTimeout: 5000
      kibana:
        index: '.kibana'

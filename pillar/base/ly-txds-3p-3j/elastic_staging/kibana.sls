elastic:
  kibana:
    version: '5.3.0'
    sha1: 'b0191e833c83a348bbf6b09628756e898cceb73b'
    config:
      server:
        host: '0.0.0.0'
        port: 5601
        basePath: '/kibana'
        maxPayloadBytes: 1048576
      elasticsearch:
        url: 'http://192.168.2.227:9200'
        pingTimeout: 1500
        requestTimeout: 30000
        startupTimeout: 5000
      kibana:
        index: '.kibana'

gb:
  sipserver:
    config:
      listen:
        family: 4
        addr: '0.0.0.0'
        port: 15050
        tcp: false
        udp: true
      http:
        family: 4
        addr: '192.168.2.34'
        port: 15051
        timeout: 240
      log:
        path: 'logs/sipserver.log'
        level: 5
        maxsize: 1024
        kdays: 7
        cperiod: 60
      hash:
        bucket: 8
      mediasrv:
        family: 4
        addr: '192.168.2.34'
        port: 15061
        transport: 'tcp'
      websrv:
        host: 'http://192.168.2.34:8096'
        sid: '5a5863d4ac72cb7fbf3dee3e'
        secret: '91a2109133a602c3a4e66b7c4568481f'

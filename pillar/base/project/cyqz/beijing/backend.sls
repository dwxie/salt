cyqz:
  backend:
    application:
      spring:
        datasource:
          name: 'cyqz'
          url: 'jdbc:mysql://192.168.2.206:3306/cyqz?useUnicode=true&autoReconnect=true&characterEncoding=utf-8'
          username: 'cyqz'
          password: 'h8RvZkKTLQpzoaT7z6Vxewja'
        redis:
          host: '192.168.2.203'
          password: 'M68SF1TfJcfuc1HBXKp1wLE9'
          port: 8389
          sentinel:
            master: 'mymaster'
            nodes: '192.168.2.202:26379,192.168.2.201:26379,192.168.2.203:26379'
      config:
        webHost: 'https://cyqzmain.netposa.com/'
        caseCDN: 'https://case.netposa.com/'
  frontend:
    node: '1'

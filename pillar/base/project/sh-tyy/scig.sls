scig:
  nginx:
    vhosts:
      shty-cigweb.antelopecloud.cn.conf:
        server_names:
          - 'shty-cigweb.antelopecloud.cn'
  config:
    web:
      protocol: http
      port: :8088
      certFile: idfile
      keyFile:  idfile.key
      updatePath: /tmp
      debug: false
    log:
      level: DEBUG
      path: ./logs
      filename: scig.2006.01.02.log
      format: json
    transLog:
      level: DEBUG
      path: ./logs
      filename: scig.trans.2006.01.02.log
      format: json
    mongo:
      mongo_url: scig:password@192.168.1.179:27017/?authSource=scig
    mysql:
      scig: scigdb:PKE467O0mso3wE3N1WBCYp48z@tcp(192.168.1.179:3306)/scigdb?charset=utf8&parseTime=true
    redis:
      host: 127.0.0.1:6800
      database: 3
      maxActive: 1024
      maxIdle: 512
      idletimeout: 180
      password: B0mhHrAn7B62fTwacftB
    secert:
      appID: ojjr
      appKey: "86af462f4c4becdb50b8a2f6f5d86a31"
      adminName: scigadmin
      adminPasswords: scigamdin12345

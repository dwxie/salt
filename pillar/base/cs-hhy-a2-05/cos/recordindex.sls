cos:
  recordindex:
    config:
      generl:
        node: 1
        single_producer: 50
        rpcPort: :8041
      web:
        protocol: http
        port: :8230
        debugPort: :6230
        certFile: idfile
        keyFile:  idfile.key
        syncnum: 200
        debug: false
      log:
        level: INFO
        path: ./logs
        filename: recordindex.2006.01.02.log
        format: text
      mongo:
        mongo_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.mongodb.private:27417,6.mongodb.private:27417,7.mongodb.private:27417/?authSource=adfs'
        timelineinfo_url: 'topvdn:zCESs4AsdPY3ngr8J6Kx07McS@5.mongodb.private:27417,6.mongodb.private:27417,7.mongodb.private:27417/?authSource=topvdn'

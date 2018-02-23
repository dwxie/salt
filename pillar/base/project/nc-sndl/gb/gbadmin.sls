gb:
  gbadmin:
    config:
      core:
        bind: ':8096'
        host: 'http://218.95.36.34:8096'
        user_agent: 'lingyang-psrnc-gbadmin'
        lang: "zh"
      database:
        mongo:
          url: 'mongodb://gbadmin:CaOO4E8QBNHGZEhS0hUBw0Fzn@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/gbadmin'
          dbname: 'gbadmin'
      jwt:
        key: 'iOzHgeSgH74Aj2eKJIbAKfZPOj8g9r6VzJwxO9JjW2U='
        expire: 86400
      antelope:
        host: 'http://jxsr-api.antelopecloud.cn'
        lyid: 'odko'
        lykey: '90fb7d4d094b883ac64413d802f61359'
        push_url_fmt: 'topvdn://218.95.36.19:1935?protocolType=2&connectType=1&token=%v&mode=3'
        flv_live_url_fmt: "http://%v:80/flv_live?app=live&token=%v&type=.flv"
        lyrecord_confs:
            - storage: 0
              mode: 6
              control: 3222536192
            - storage: 3
              mode: 3
              control: 3223060480
            - storage: 7
              mode: 3
              control: 3223060480
            - storage: 30
              mode: 3
              control: 3224109056

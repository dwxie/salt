hosts:
  present:
    -
      ip: '172.31.4.206'
      hostnames:
        - aws-America-sto1
        - aws-America-relay1
    -
      ip: '172.31.15.96'
      hostnames:
        - aws-America-sto2
        - aws-America-relay2
    -
      ip: '172.31.3.161'
      hostnames:
        - aws-America-sto3
        - aws-America-relay3
    -
      ip: '172.31.8.109'
      hostnames:
        - aws-America-sto4
        - aws-America-relay4
    -
      ip: '172.31.15.49'
      hostnames:
        - aws-America-web1
        - indexserver
        - disktracker
        - mongodb.private
        - index.web

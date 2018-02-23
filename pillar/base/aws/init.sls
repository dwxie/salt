base:
  g_aws:
    - match: nodegroup
    - aws.common
  aws-America-web1:
    - aws.machines.aws-America-web1
    - aws.indexserver
    - aws.mongodb
    - aws.disktracker
    - aws.index_web
  aws-America-sto1:
    - aws.relay
    - aws.machines.aws-America-sto1
  aws-America-sto2:
    - aws.relay
    - aws.machines.aws-America-sto2
  aws-America-sto3:
    - aws.relay
    - aws.machines.aws-America-sto3
  aws-America-sto4:
    - aws.relay
    - aws.machines.aws-America-sto4

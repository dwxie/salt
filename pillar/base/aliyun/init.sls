base:
  g_aliyun:
    - match: nodegroup
    - aliyun.ntpdate
    - aliyun.zabbix
  # 羚羊项目 -> 循环存储 -> 转发调度 -> tracker
  # 羚羊项目 -> 循环存储 -> 转发调度 -> relay_group
  # 羚羊项目 -> 循环存储 -> 转发调度 -> cid_bond_relay
  # 羚羊项目 -> 循环存储 -> 转发调度 -> selection_strategy
  # 羚羊项目 -> 循环存储 -> 转发调度 -> white_list
  g_aliyun_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
  aliqd-tracker:
    - aliyun.machines.aliqd-tracker
  qgz-tracker:
    - aliyun.machines.qgz-tracker
  qsh-tracker:
    - aliyun.machines.qsh-tracker

base:
  g_tz:
    - match: nodegroup
    - tz.tz
    - tz.common
    - tz.ntpdate
    - tz.zabbix
  g_tz_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  g_tz_relay:
    - match: nodegroup
    - antelope.cs.relay.relay
    - tz.relay
  g_tz_web:
    - match: nodegroup
    - tz.cs.zone.index_web
    - tz.cs.zone.nginx
  g_tz_sto:
    - match: nodegroup
    - tz.storage
  g_tz_db:
    - match: nodegroup
    - tz.mongodb
  g_tz_cos_webserver:
    - match: nodegroup
    - tz.cos.webserver
    - tz.cos.codispatcher
    - tz.cos.pigeon
    - tz.kafka
    - tz.zookeeper
  g_tz_cos_filedelete:
    - match: nodegroup
    - tz.cos.filedelete
  g_tz_cos_sto:
    - match: nodegroup
    - tz.cos.costorage
  tz-lvs1:
    - tz.machines.tz-lvs1
  tz-db2:
    - tz.machines.tz-db2
  tz-relay3:
    - tz.machines.tz-relay3
  tz-relay4:
    - tz.machines.tz-relay4
  tz-relay5:
    - tz.machines.tz-relay5
  tz-relay6:
    - tz.machines.tz-relay6
  tz-relay7:
    - tz.machines.tz-relay7
  tz-relay8:
    - tz.machines.tz-relay8
  tz-relay9:
    - tz.machines.tz-relay9
  tz-sto1:
    - tz.machines.tz-sto1
  tz-sto2:
    - tz.machines.tz-sto2
  tz-sto3:
    - tz.machines.tz-sto3
  tz-sto4:
    - tz.machines.tz-sto4
  tz-sto5:
    - tz.machines.tz-sto5
  tz-sto6:
    - tz.machines.tz-sto6
  tz-sto7:
    - tz.machines.tz-sto7
  tz-sto8:
    - tz.machines.tz-sto8
  tz-sto9:
    - tz.machines.tz-sto9
  tz-sto10:
    - tz.machines.tz-sto10
  tz-sto11:
    - tz.machines.tz-sto11
  tz-sto12:
    - tz.machines.tz-sto12
  tz-sto13:
    - tz.machines.tz-sto13
  tz-web1:
    - tz.machines.tz-web1
  tz-web2:
    - tz.disktracker
    - tz.machines.tz-web2
  tz-web3:
    - tz.indexserver
    - tz.machines.tz-web3
  tz-stofnd1:
    - tz.cos.healthchecker
    - tz.cos.automatictool
    - tz.machines.tz-stofnd1
  tz-stofnd2:
    - tz.cos.loopdispatcher
    - tz.machines.tz-stofnd2
  tz-stofnd3:
    - tz.cos.codisktracker
    - tz.machines.tz-stofnd3

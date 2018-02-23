base:
  g_fs:
    - match: nodegroup
    - fs.common
    - fs.ntpdate
    - fs.zabbix
  g_fs_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  g_fs_relay:
    - match: nodegroup
    - antelope.cs.relay.relay
    - fs.relay
  g_fs_web:
    - match: nodegroup
    - fs.cs.zone.index_web
    - fs.cs.zone.nginx
  g_fs_sto:
    - match: nodegroup
    - fs.storage
  g_fs_db:
    - match: nodegroup
    - fs.mongodb
  g_fs_cos_webserver:
    - match: nodegroup
    - fs.cos.nginx
    - fs.cos.webserver
    - fs.cos.codispatcher
    - fs.cos.pigeon
    - fs.kafka
    - fs.zookeeper
  g_fs_cos_filedelete:
    - match: nodegroup
    - fs.cos.filedelete
  g_fs_cos_sto:
    - match: nodegroup
    - fs.cos.costorage
  fs-lvs1:
    - fs.machines.fs-lvs1
  fs-web1:
    - fs.disktracker
    - fs.machines.fs-web1
  fs-web2:
    - fs.machines.fs-web2
  fs-web3:
    - fs.indexserver
    - fs.machines.fs-web3
  fs-sto14:
    - fs.machines.fs-sto14
  fs-sto15:
    - fs.machines.fs-sto15
  fs-sto16:
    - fs.machines.fs-sto16
  fs-sto17:
    - fs.machines.fs-sto17
  fs-sto18:
    - fs.machines.fs-sto18
  fs-sto19:
    - fs.machines.fs-sto19
  fs-sto20:
    - fs.machines.fs-sto20
  fs-sto21:
    - fs.machines.fs-sto21
  fs-sto22:
    - fs.machines.fs-sto22
  fs-sto23:
    - fs.machines.fs-sto23
  fs-sto24:
    - fs.machines.fs-sto24
  fs-sto25:
    - fs.machines.fs-sto25
  fs-sto26:
    - fs.machines.fs-sto26
  fs-stofnd1:
    - fs.cos.healthchecker
    - fs.cos.automatictool
    - fs.machines.fs-stofnd1
  fs-stofnd2:
    - fs.cos.codproducer
    - fs.machines.fs-stofnd2
  fs-stofnd3:
    - fs.cos.codisktracker
    - fs.machines.fs-stofnd3

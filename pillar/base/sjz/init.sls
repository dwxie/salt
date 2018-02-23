base:
  g_sjz:
    - match: nodegroup
    - sjz.common
    - sjz.ntpdate
    - sjz.zabbix
  g_sjz_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  g_sjz_relay:
    - match: nodegroup
    - antelope.cs.relay.relay
    - sjz.relay
  g_sjz_web:
    - match: nodegroup
    - sjz.cs.zone.index_web
    - sjz.cs.zone.nginx
  g_sjz_sto:
    - match: nodegroup
    - sjz.storage
  g_sjz_db:
    - match: nodegroup
    - sjz.mongodb
  g_sjz_cos_webserver:
    - match: nodegroup
    - sjz.cos.nginx
    - sjz.cos.webserver
    - sjz.cos.codispatcher
    - sjz.cos.pigeon
    - sjz.kafka
    - sjz.zookeeper
  g_sjz_cos_filedelete:
    - match: nodegroup
    - sjz.cos.filedelete
  g_sjz_cos_sto:
    - match: nodegroup
    - sjz.cos.costorage
  sjz-lvs1:
    - sjz.machines.sjz-lvs1
  sjz-relay3:
    - sjz.machines.sjz-relay3
  sjz-relay6:
    - sjz.machines.sjz-relay6
  sjz-relay7:
    - sjz.machines.sjz-relay7
  sjz-relay8:
    - sjz.machines.sjz-relay8
  sjz-web1:
    - sjz.machines.sjz-web1
  sjz-web2:
    - sjz.disktracker
    - sjz.machines.sjz-web2
  sjz-web3:
    - sjz.indexserver
    - sjz.machines.sjz-web3
  sjz-sto1:
    - sjz.machines.sjz-sto1
  sjz-sto2:
    - sjz.machines.sjz-sto2
  sjz-sto3:
    - sjz.machines.sjz-sto3
  sjz-sto4:
    - sjz.machines.sjz-sto4
  sjz-sto5:
    - sjz.machines.sjz-sto5
  sjz-sto6:
    - sjz.machines.sjz-sto6
  sjz-sto7:
    - sjz.machines.sjz-sto7
  sjz-sto8:
    - sjz.machines.sjz-sto8
  sjz-sto9:
    - sjz.machines.sjz-sto9
  sjz-sto10:
    - sjz.machines.sjz-sto10
  sjz-sto11:
    - sjz.machines.sjz-sto11
  sjz-sto12:
    - sjz.machines.sjz-sto12
  sjz-sto13:
    - sjz.machines.sjz-sto13
  sjz-stofnd1:
    - sjz.cos.healthchecker
    - sjz.cos.automatictool
    - sjz.machines.sjz-stofnd1
  sjz-stofnd2:
    - sjz.cos.codproducer
    - sjz.machines.sjz-stofnd2
  sjz-stofnd3:
    - sjz.cos.codisktracker
    - sjz.machines.sjz-stofnd3

base:
  g_cs_hhy_a2_05:
    - match: nodegroup
    - cs-hhy-a2-05.common
    - cs-hhy-a2-05.ntpdate
    - cs-hhy-a2-05.zabbix
  g_cs_hhy_a2_05_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  g_cs_hhy_a2_05_relay:
    - match: nodegroup
    - antelope.cs.relay.relay
    - cs-hhy-a2-05.relay
    - cs-hhy-a2-05.cos.codispatcher
    - cs-hhy-a2-05.cos.recordindex
  g_cs_hhy_a2_05_web:
    - match: nodegroup
    - cs-hhy-a2-05.cs.zone.index_web
    - cs-hhy-a2-05.cs.zone.nginx
  g_cs_hhy_a2_05_sto:
    - match: nodegroup
    - cs-hhy-a2-05.storage
  g_cs_hhy_a2_05_db:
    - match: nodegroup
    - cs-hhy-a2-05.mongodb
  g_cs_hhy_a2_05_cos_webserver:
    - match: nodegroup
    - cs-hhy-a2-05.cos.nginx
    - cs-hhy-a2-05.cos.webserver
    - cs-hhy-a2-05.cos.codispatcher
    - cs-hhy-a2-05.cos.pigeon
    - cs-hhy-a2-05.kafka
    - cs-hhy-a2-05.zookeeper
  g_cs_hhy_a2_05_cos_filedelete:
    - match: nodegroup
    - cs-hhy-a2-05.cos.filedelete
  g_cs_hhy_a2_05_cos_sto:
    - match: nodegroup
    - cs-hhy-a2-05.cos.costorage
  cs-hhy-a2-05-tracker:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-tracker
  cs-hhy-a2-05-db1:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-db1
  cs-hhy-a2-05-db2:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-db2
  cs-hhy-a2-05-db3:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-db3
  cs-hhy-a2-05-db4:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-db4
  cs-hhy-a2-05-web1:
    - cs-hhy-a2-05.indexserver
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-web1
  cs-hhy-a2-05-web2:
    - cs-hhy-a2-05.disktracker
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-web2
  cs-hhy-a2-05-web3:
    - cs-hhy-a2-05.indexserver
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-web3
  cs-hhy-a2-05-sto1:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto1
  cs-hhy-a2-05-sto2:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto2
  cs-hhy-a2-05-sto3:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto3
  cs-hhy-a2-05-sto4:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto4
  cs-hhy-a2-05-sto5:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto5
  cs-hhy-a2-05-sto6:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto6
  cs-hhy-a2-05-sto7:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto7
  cs-hhy-a2-05-sto8:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto8
  cs-hhy-a2-05-sto9:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto9
  cs-hhy-a2-05-sto10:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto10
  cs-hhy-a2-05-sto11:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto11
  cs-hhy-a2-05-sto12:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto12
  cs-hhy-a2-05-sto13:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-sto13
  cs-hhy-a2-05-ceph1:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-ceph1
  cs-hhy-a2-05-stofnd1:
    - cs-hhy-a2-05.cos.healthchecker
    - cs-hhy-a2-05.cos.automatictool
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-stofnd1
  cs-hhy-a2-05-stofnd2:
    - cs-hhy-a2-05.cos.codproducer
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-stofnd2
  cs-hhy-a2-05-stofnd3:
    - cs-hhy-a2-05.cos.codisktracker
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-stofnd3
  g_cs_elastic:
    - match: nodegroup
    - cs-hhy-a2-05.elastic.elasticsearch
    - cs-hhy-a2-05.elastic.filebeat
  cs-hhy-a2-05-free1:
    - cs-hhy-a2-05.elastic.kibana
    - cs-hhy-a2-05.elastic.cerebro
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-free1
  cs-hhy-a2-05-free2:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-free2
  cs-hhy-a2-05-free4:
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-free4
  cs-hhy-a2-05-free5:
    - cs-hhy-a2-05.elastic.logstash
    - cs-hhy-a2-05.machines.cs-hhy-a2-05-free5

# init file for project
base:
  g_bj2_cyqz:
    - match: nodegroup
    #- project.cyqz.common
    - project.cyqz.beijing.ntpdate
    - project.cyqz.beijing.zabbix
  g_bj2_cyqz_web:
    - match: nodegroup
    - project.cyqz.beijing.backend
  bj2-cyqz-sql1:
    - project.cyqz.beijing.bj2-cyqz-sql1
  bj2-cyqz-web1:
    - project.cyqz.beijing.bj2-cyqz-web1
  bj2-cyqz-web2:
    - project.cyqz.beijing.bj2-cyqz-web2
  bj2-cyqz-web3:
    - project.cyqz.beijing.bj2-cyqz-web3

  g_ly_cyqz:
    - match: nodegroup
    #- project.cyqz.common
    - project.cyqz.luoyang.ntpdate
    - project.cyqz.luoyang.zabbix
  g_ly_cyqz_web:
    - match: nodegroup
    - project.cyqz.luoyang.backend
  ly-cyqz-web1:
    - project.cyqz.luoyang.ly-cyqz-web1
  ly-cyqz-web2:
    - project.cyqz.luoyang.ly-cyqz-web2

  cs-cyqz-web1:
    - project.cyqz.edge.cs-cyqz-web1
  fs-cyqz-web1:
    - project.cyqz.edge.fs-cyqz-web1
  sjz-cyqz-web1:
    - project.cyqz.edge.sjz-cyqz-web1
  tz-cyqz-web1:
    - project.cyqz.edge.tz-cyqz-web1

  g_nc_sndl:
    - match: nodegroup
    - project.nc-sndl.common
    - project.nc-sndl.ntpdate
    - project.nc-sndl.zabbix
    - project.nc-sndl.smpagent.smpagent
    - project.nc-sndl.smpagent.plugins.collector
    - project.nc-sndl.smpagent.plugins.mongosender
  g_nc_sndl_lvs:
    - match: nodegroup
    - project.nc-sndl.lvs
  g_nc_sndl_tracker:
    - match: nodegroup
    - project.nc-sndl.tracker.tracker
    - project.nc-sndl.tracker.relay_group
    - project.nc-sndl.tracker.cid_bond_relay
    - project.nc-sndl.tracker.selection_strategy
    - project.nc-sndl.tracker.white_list
    - project.nc-sndl.tracker.relay_extra_info
  g_nc_sndl_platweb:
    - match: nodegroup
    - project.nc-sndl.cs.center.camera
    - project.nc-sndl.cs.center.nginx
    - project.nc-sndl.cs.center.mawar.mawar
    - project.nc-sndl.cs.center.mawar.projects
  g_nc_sndl_web:
    - match: nodegroup
    - project.nc-sndl.cs.zone.index_web
    - project.nc-sndl.cs.zone.nginx
    - project.nc-sndl.cs.zone.goindexweb
  g_nc_sndl_relay:
    - match: nodegroup
    - antelope.cs.relay.relay
    - project.nc-sndl.relay
  g_nc_sndl_sto:
    - match: nodegroup
    - project.nc-sndl.storage
  g_nc_sndl_cos_webserver:
    - match: nodegroup
    - project.nc-sndl.cos.nginx
    - project.nc-sndl.cos.webserver
    - project.nc-sndl.cos.pigeon
    - project.nc-sndl.kafka
    - project.nc-sndl.zookeeper
  g_nc_sndl_cos_filedelete:
    - match: nodegroup
    - project.nc-sndl.cos.filedelete
  g_nc_sndl_db:
    - match: nodegroup
    - project.nc-sndl.mongodb
  g_nc_sndl_cos_sto:
    - match: nodegroup
    - project.nc-sndl.cos.costorage
  g_nc_sndl_gb:
    - match: nodegroup
    - project.nc-sndl.keeper
    - project.nc-sndl.gb.gbadmin
    - project.nc-sndl.gb.sipserver
    - project.nc-sndl.gb.sipmediaserver
  nc-sndl-08-02-db1:
    - project.nc-sndl.machines.nc-sndl-08-02-db1
  nc-sndl-09-07-db2:
    - project.nc-sndl.machines.nc-sndl-09-07-db2
  nc-sndl-09-10-db3:
    - project.nc-sndl.machines.nc-sndl-09-10-db3
  #nc-sndl-09-12-db4:
  #  - project.nc-sndl.machines.nc-sndl-09-12-db4
  #nc-sndl-08-02-db5:
  #  - project.nc-sndl.machines.nc-sndl-08-02-db5
  #nc-sndl-09-07-db6:
  #  - project.nc-sndl.machines.nc-sndl-09-07-db6
  #nc-sndl-09-10-db7:
  #  - project.nc-sndl.machines.nc-sndl-09-10-db7
  #nc-sndl-09-12-db8:
  #  - project.nc-sndl.machines.nc-sndl-09-12-db8
  nc-sndl-09-07-lvs1:
    - project.nc-sndl.machines.nc-sndl-09-07-lvs1
  nc-sndl-09-10-lvs2:
    - project.nc-sndl.machines.nc-sndl-09-10-lvs2
  nc-sndl-09-12-web1:
    - project.nc-sndl.cs.center.eye
    - project.nc-sndl.machines.nc-sndl-09-12-web1
  nc-sndl-08-02-web2:
    - project.nc-sndl.machines.nc-sndl-08-02-web2
  nc-sndl-09-07-web3:
    - project.nc-sndl.machines.nc-sndl-09-07-web3
  nc-sndl-09-10-web4:
    - project.nc-sndl.machines.nc-sndl-09-10-web4
  nc-sndl-09-12-web5:
    - project.nc-sndl.disktracker
    - project.nc-sndl.machines.nc-sndl-09-12-web5
  nc-sndl-08-02-web6:
    - project.nc-sndl.indexserver
    - project.nc-sndl.machines.nc-sndl-08-02-web6
  #nc-sndl-09-07-web7:
  #  - project.nc-sndl.machines.nc-sndl-09-07-web7
  #nc-sndl-09-10-web8:
  #  - project.nc-sndl.machines.nc-sndl-09-10-web8
  #nc-sndl-09-12-web9:
  #  - project.nc-sndl.machines.nc-sndl-09-12-web9
  nc-sndl-08-02-sto1:
    - project.nc-sndl.machines.nc-sndl-08-02-sto1
  nc-sndl-09-07-sto2:
    - project.nc-sndl.machines.nc-sndl-09-07-sto2
  nc-sndl-09-10-sto3:
    - project.nc-sndl.machines.nc-sndl-09-10-sto3
  nc-sndl-09-12-sto4:
    - project.nc-sndl.machines.nc-sndl-09-12-sto4
  nc-sndl-08-02-sto5:
    - project.nc-sndl.machines.nc-sndl-08-02-sto5
  nc-sndl-09-07-sto6:
    - project.nc-sndl.machines.nc-sndl-09-07-sto6
  nc-sndl-09-10-sto7:
    - project.nc-sndl.machines.nc-sndl-09-10-sto7
  nc-sndl-09-12-sto8:
    - project.nc-sndl.machines.nc-sndl-09-12-sto8
  nc-sndl-08-02-sto9:
    - project.nc-sndl.machines.nc-sndl-08-02-sto9
  nc-sndl-09-07-sto10:
    - project.nc-sndl.machines.nc-sndl-09-07-sto10
  nc-sndl-09-10-sto11:
    - project.nc-sndl.machines.nc-sndl-09-10-sto11
  nc-sndl-09-12-sto12:
    - project.nc-sndl.machines.nc-sndl-09-12-sto12
  nc-sndl-08-02-sto13:
    - project.nc-sndl.machines.nc-sndl-08-02-sto13
  nc-sndl-09-07-sto14:
    - project.nc-sndl.machines.nc-sndl-09-07-sto14
  nc-sndl-09-10-sto15:
    - project.nc-sndl.machines.nc-sndl-09-10-sto15
  nc-sndl-09-12-sto16:
    - project.nc-sndl.machines.nc-sndl-09-12-sto16
  nc-sndl-08-02-sto17:
    - project.nc-sndl.machines.nc-sndl-08-02-sto17
  nc-sndl-09-10-sto18:
    - project.nc-sndl.machines.nc-sndl-09-10-sto18
  nc-sndl-08-02-stofnd1:
    - project.nc-sndl.cos.healthchecker
    - project.nc-sndl.machines.nc-sndl-08-02-stofnd1
  nc-sndl-09-07-stofnd2:
    - project.nc-sndl.cos.codproducer
    - project.nc-sndl.cos.codispatcher
    - project.nc-sndl.machines.nc-sndl-09-07-stofnd2
  nc-sndl-09-07-stofnd3:
    - project.nc-sndl.cos.codisktracker
    - project.nc-sndl.machines.nc-sndl-09-07-stofnd3
  #nc-sndl-09-07-log1:
  #  - project.nc-sndl.machines.nc-sndl-09-07-log1
  #nc-sndl-09-10-log2:
  #  - project.nc-sndl.machines.nc-sndl-09-10-log2

  g_sh_tyy:
    - match: nodegroup
    - project.sh-tyy.common
    - project.sh-tyy.ntpdate
    - project.sh-tyy.smp.smpagent.smpagent
    - project.sh-tyy.smp.smpagent.plugins.collector
    - project.sh-tyy.smp.smpagent.plugins.mongosender
  g_sh_tyy_tracker:
    - match: nodegroup
    - project.sh-tyy.tracker.tracker
    - project.sh-tyy.tracker.relay_group
    - project.sh-tyy.tracker.cid_bond_relay
    - project.sh-tyy.tracker.selection_strategy
    - project.sh-tyy.tracker.white_list
    - project.sh-tyy.tracker.relay_extra_info
  g_sh_tyy_platweb:
    - match: nodegroup
    - project.sh-tyy.cs.center.camera
    - project.sh-tyy.cs.center.nginx
  g_sh_tyy_web:
    - match: nodegroup
    - project.sh-tyy.cs.zone.index_web
    - project.sh-tyy.cs.zone.nginx
    - project.sh-tyy.cs.zone.goindexweb
  g_sh_tyy_relay:
    - match: nodegroup
    - antelope.cs.relay.relay
    - project.sh-tyy.relay
  g_sh_tyy_sto:
    - match: nodegroup
    - project.sh-tyy.storage
  g_sh_tyy_db:
    - match: nodegroup
    - project.sh-tyy.mongodb
  sh-tyy-2398-web1:
    - project.sh-tyy.disktracker
    - project.sh-tyy.indexserver
    - project.sh-tyy.scig
    - project.sh-tyy.eye
    - project.sh-tyy.machines.sh-tyy-2398-web1
  sh-tyy-1374-web2:
    - project.sh-tyy.machines.sh-tyy-1374-web2
  sh-tyy-1374-db1:
    - project.sh-tyy.machines.sh-tyy-1374-db1
  sh-tyy-9228-sto1:
    - project.sh-tyy.machines.sh-tyy-9228-sto1
  sh-tyy-9228-sto2:
    - project.sh-tyy.machines.sh-tyy-9228-sto2
  sh-tyy-9228-sto3:
    - project.sh-tyy.machines.sh-tyy-9228-sto3
  sh-tyy-9228-sto4:
    - project.sh-tyy.machines.sh-tyy-9228-sto4

base:
  g_bj:
    - match: nodegroup
    - bj.common
    - bj.ntpdate
    - bj.zabbix
  g_bj_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  g_bj_appweb:
    - match: nodegroup
    - bj.developers
  g_bj_platweb:
    - match: nodegroup
    - bj.cs.center.camera
  g_list_sop:
    - match: nodegroup
    - bj.sop
  g_list_usc:
    - match: nodegroup
    - bj.usc
  bj-lvs1:
    - bj.machines.bj-lvs1
  bj-platweb4:
    - bj.machines.bj-platweb4
  bj-platweb5:
    - bj.machines.bj-platweb5
  bj-platweb6:
    - bj.machines.bj-platweb6
  bj-appweb4:
    - bj.machines.bj-appweb4
  bj-appweb5:
    - bj.machines.bj-appweb5

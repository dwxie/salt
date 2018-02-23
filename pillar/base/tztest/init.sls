base:
  g_tztest_cos_sto:
    - match: nodegroup
    - tztest.cos.costorage
  tztest-lvs1:
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  tztest-sto5:
    - tztest.cos.automatictool
    - tztest.machines.tztest-sto5
  tztest-sto6:
    - tztest.machines.tztest-sto6
  tztest-web2:
    - tztest.tztest-web2
    - tztest.kafka
  tztest-db1:
    - tztest.tztest-db1
    - tztest.kafka
  tztest-db2:
    - tztest.tztest-db2
    - tztest.kafka

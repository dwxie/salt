MachineID: 706008938
disk:
- {device: xvde, device_uuid: 42162de5-57b0-4191-b4bc-029d8188876c, mount_dir: /data,
  options: 'defaults,noatime', type: xfs}
mongodb:
  replications:
    mo_shty:
      instances:
      - net: {port: 27017}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/shty_mongo_key, salt_source_file: application/mongodb/files/shty_mongo_key}

disk:
- {device: sdb, device_uuid: 6deab41e-bd83-42df-98df-86a678502adb, mount_dir: /data,
  options: 'defaults,noatime', type: xfs}
mongodb:
  replications:
    mo_psrnc:
      instances:
      - net: {port: 27017}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/psrnc_mongo_key, salt_source_file: application/mongodb/files/psrnc_mongo_key}

disk:
- {device: sdb, device_uuid: 89fa4199-220d-4727-9ecd-b9cb9cd12545, mount_dir: /data,
  options: 'defaults,noatime', type: xfs}
mongodb:
  replications:
    mo_psrnc:
      instances:
      - net: {port: 27017}
        role: third
      security: {authorization: enabled, keyFile: /etc/mongodb/psrnc_mongo_key, salt_source_file: application/mongodb/files/psrnc_mongo_key}

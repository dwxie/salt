disk:
- {device: sdb, device_uuid: ab69c934-50cf-4e6e-8515-7516cfca07f5, mount_dir: /data,
  options: 'defaults,noatime', type: xfs}
mongodb:
  replications:
    mo_psrnc:
      instances:
      - net: {port: 27017}
        role: secondary
      security: {authorization: enabled, keyFile: /etc/mongodb/psrnc_mongo_key, salt_source_file: application/mongodb/files/psrnc_mongo_key}

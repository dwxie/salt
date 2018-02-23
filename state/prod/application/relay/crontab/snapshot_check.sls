present crontab for snapshot_check:
  cmd.script:
    - source: salt://application/relay/files/crontab_snapshot_check.sh
    - cwd: /tmp

#absent user for sysadmin:
#  user.absent:
#    - name: sysadmin

absent sysadmin home directory:
  file.absent:
    - name: /home/sysadmin/.ssh/authorized_keys

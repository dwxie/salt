#absent user for wangyi:
#  user.absent:
#    - name: wangyi

absent wangyi home directory:
  file.absent:
    - name: /home/wangyi/.ssh/authorized_keys

#absent user for zhangjingqiu:
#  user.absent:
#    - name: zhangjingqiu

absent zhangjingqiu home directory:
  file.absent:
    - name: /home/zhangjingqiu/.ssh/authorized_keys

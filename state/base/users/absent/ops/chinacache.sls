absent user for chinacache:
  user.absent:
    - name: chinacache

absent chinacache home directory:
  file.absent:
    - name: /home/chinacache

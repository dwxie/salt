absent user for weil:
  user.absent:
    - name: weil

absent weil home directory:
  file.absent:
    - name: /home/weil

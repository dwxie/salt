{% set prefix = '/usr/local/services/nginx' %}

reload nginx:
  cmd.run:
    - name: /usr/local/services/nginx/sbin/nginx
    - cwd: {{ prefix }}
    - mode: 644
    - onlyif:
      - ! /usr/local/services/nginx/sbin/nginx -t

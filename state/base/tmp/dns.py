import commands
import time
import sys

dns_server = sys.argv[1]
start = float(time.time())
ip = commands.getoutput('nslookup www.baidu.com %s'%dns_server)
end = float(time.time())
overtime = end - start
print overtime

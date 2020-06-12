## Install Mysql8 + memcached plugin ( Docker )
Command  `./mysql8_memcached.sh` runs main script. 
Before executing the script, set the `chmod 755 mysql8_memcached.sh` permissions.
You wait 30 seconds and get message `Installation passed successfully`.

You can make sure that the installation was successful with the command  `docker ps -a` (
```
33060/tcp, 
mysql            => 0.0.0.0:4311->3306/tcp, 
memcached plugin => 0.0.0.0:4315->11211/tcp)
```


### Example connect client on Python

`pip install pymemcache`

```
from pymemcache.client import base
client = base.Client( ('localhost', 4315) )
c = client

c.get("q") #b'firs first'

c.set('some_key', 'some value')

c.get('some_key') # 'some value'
```
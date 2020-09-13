# nginx keepalived with docker compose

A small demo to run two nginx containers in active-passive mode by using keepalived.

## How to run

Run the following command: 

```bash
$ docker-compose up -d
```

Now, visit `http://localhost` and you would see `hello I’m master!`. 

```bash
$ docker ps
CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                  NAMES
c0260ce7c6ed        nginx-slave          "/entrypoint.sh"         24 minutes ago      Up 24 minutes       80/tcp                 keepalived_slave
36631c84697b        haproxy:1.7-alpine   "/docker-entrypoint.…"   24 minutes ago      Up 24 minutes       0.0.0.0:80->6301/tcp   nginx-keepalived-docker-test_proxy_1
fae17d476f82        nginx-master         "/entrypoint.sh"         24 minutes ago      Up 24 minutes       80/tcp                 keepalived_master
```

Try to pause the master server: 

```bash
$ docker pause keepalived_master
```

Now, visit `http://localhost` and you should see `hello I’m Slave!`. 

Recover the master server and pause the slave server: 
```bash
$ docker unpause keepalived_master
$ docker pause keepalived_slave
```

Visit `http://localhost` and you should see `hello I’m Master!` again. 

As you can see, when a master server is down, a backup server does automatic failover. 

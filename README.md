## openshift-nginx-keycloak

Nginx container with KeyCloak authorization support

### Tags

There is only latest

### Default behaviour

```
KEYCLOAK_CACHE_STRATEGY = shared_dict
```

These environment variables will need to be set according to your KeyCloak:

```
KEYCLOAK_ENDPOINT (eg. https://keycloak.example.com/auth)
KEYCLOAK_REALM (eg. master)
KEYCLOAK_CLIENT_ID (eg. nginx)
KEYCLOAK_CLIENT_SECRET (eg. 00000000-0000-0000-0000-000000000000)
```

### How to run with default behaviour

Set the ENV vars properly and it should "just work" (tm)

### Redis session storage

See https://github.com/bungle/lua-resty-session for available options

```
SESSION_STORAGE    = redis
SESSION_REDIS_HOST = redis
```

### Redis shared cache

The options for resty-keycloak Redis cache are the same as resty-session, but with "KEYCLOAK" as the prefix, obvs.

```
KEYCLOAK_CACHE_STRATEGY                 = redis;
KEYCLOAK_REDIS_HOST                     = 127.0.0.1;
```

Other options available:
```
KEYCLOAK_REDIS_PREFIX                   = sessions
KEYCLOAK_REDIS_DATABASE                 = 0
KEYCLOAK_REDIS_CONNECT_TIMEOUT          = 1000
KEYCLOAK_REDIS_SEND_TIMEOUT             = 1000
KEYCLOAK_REDIS_READ_TIMEOUT             = 1000
KEYCLOAK_REDIS_SOCKET                   = unix:///var/run/redis/redis.sock
KEYCLOAK_REDIS_PORT                     = 6379
KEYCLOAK_REDIS_SSL                      = off
KEYCLOAK_REDIS_SSL_VERIFY               = off
KEYCLOAK_REDIS_SERVER_NAME              = example.com
KEYCLOAK_REDIS_AUTH                     = password
KEYCLOAK_REDIS_USELOCKING               = on
KEYCLOAK_REDIS_SPINLOCKWAIT             = 150
KEYCLOAK_REDIS_MAXLOCKWAIT              = 30
KEYCLOAK_REDIS_POOL_NAME                = sessions
KEYCLOAK_REDIS_POOL_TIMEOUT             = 1000
KEYCLOAK_REDIS_POOL_SIZE                = 10
KEYCLOAK_REDIS_POOL_BACKLOG             = 10
KEYCLOAK_REDIS_CLUSTER_NAME             = redis-cluster
KEYCLOAK_REDIS_CLUSTER_DICT             = sessions
KEYCLOAK_REDIS_CLUSTER_MAXREDIRECTIONS  = 5
KEYCLOAK_REDIS_CLUSTER_NODES            = '127.0.0.1:30001 127.0.0.1:30002 127.0.0.1:30003 127.0.0.1:30004 127.0.0.1:30005 127.0.0.1:30006'
```
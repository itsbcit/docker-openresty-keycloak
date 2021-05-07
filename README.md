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

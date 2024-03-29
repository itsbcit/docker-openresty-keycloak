FROM bcit.io/openresty:latest

ENV KEYCLOAK_ANONYMOUS_POLICY_MODE "permissive"
ENV KEYCLOAK_ANONYMOUS_SCOPE       "read-public"
ENV KEYCLOAK_AUTH_SERVER_URL       "https://keycloak.example.com/auth"
ENV KEYCLOAK_CALLBACK_URI          "/callback"
ENV KEYCLOAK_CLIENT_ID             "nginx"
ENV KEYCLOAK_CLIENT_SECRET         "00000000-0000-0000-0000-000000000000"
ENV KEYCLOAK_REALM                 "master"

LABEL maintainer="jesse@weisner.ca, chriswood.ca@gmail.com"
LABEL build_id="1648150199"
LABEL resty_keycloak_version="0.2.2-alpha"

USER root

RUN opm install \
        bungle/lua-resty-session \
        zmartzone/lua-resty-openidc \
        3scale/lua-resty-env \
        fperrad/lua-messagepack

ADD https://github.com/jweisner/lua-resty-keycloak/releases/download/v0.2.2-alpha/keycloak.lua /usr/local/openresty/site/lualib/resty/keycloak.lua

RUN chmod 0664 /usr/local/openresty/site/lualib/resty/keycloak.lua

COPY default.conf               /usr/local/openresty/nginx/conf.d
COPY nginx-log_format.conf      /usr/local/openresty/nginx/conf
COPY openid-auth.conf           /usr/local/openresty/nginx/conf
COPY openid-authz.conf          /usr/local/openresty/nginx/conf
COPY openid-callback.conf       /usr/local/openresty/nginx/conf
COPY resty-env.conf             /usr/local/openresty/nginx/conf
COPY resty-keycloak.conf        /usr/local/openresty/nginx/conf
COPY resty-lua_shared_dict.conf /usr/local/openresty/nginx/conf
COPY resty-session.conf         /usr/local/openresty/nginx/conf

RUN chown -R :root /usr/local/openresty \
 && chmod -R g+rw  /usr/local/openresty

USER nginx

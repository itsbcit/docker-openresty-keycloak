kc_config="/usr/local/openresty/nginx/conf/resty-01-keycloak.conf"

# abort if keycloak config is removed
[ -f $kc_config ] || return

# check for "keycloak_endpoint" already set
if (! grep -q "^set \$keycloak_endpoint" $kc_config );then
    echo "set \$keycloak_endpoint ${KEYCLOAK_ENDPOINT};" >> $kc_config
fi

# check for "keycloak_realm" already set
if (! grep -q "^set \$keycloak_realm" $kc_config );then
    echo "set \$keycloak_realm ${KEYCLOAK_REALM};" >> $kc_config
fi

# check for "keycloak_client_id" already set
if (! grep -q "^set \$keycloak_client_id" $kc_config );then
    echo "set \$keycloak_client_id ${KEYCLOAK_CLIENT_ID};" >> $kc_config
fi

# check for "keycloak_client_secret" already set
if (! grep -q "^set \$keycloak_client_secret" $kc_config );then
    echo "set \$keycloak_client_secret ${KEYCLOAK_CLIENT_SECRET};" >> $kc_config
fi

FROM fabos4ai/ansible-core:2.11.9

#ENV AWX_URL=http://localhost \
ENV AWX_URL=http://awxweb:8052 \
    AWX_ADMIN_USERNAME=admin \
    AWX_ADMIN_PASSWORD=password \
    AWX_SCM_USERNAME=SCMDefaultUser \
    AWX_SCM_PASSWORD=SCMDefaultPassword \
    CONSUL_CONFIG_VIA=SHARED_VOLUME \
#    CONSUL_CONFIG_VIA=ENVIRONMENT_VARIABLES \
#    CONSUL_TOKEN=password \
    VAULT_CONFIG_VIA=SHARED_VOLUME \
#    VAULT_CONFIG_VIA=ENVIRONMENT_VARIABLES \
#    VAULT_APPROLE_ROLE_ID=awx \
#    VAULT_APPROLE_SECRET_ID=gsagasfdh234hjasfdgaf2 \
    AWX_JWT_PROXY_USERNAME=awx-jwt-proxy \
    AWX_JWT_PROXY_PASSWORD=password

COPY src /src

WORKDIR src

RUN ansible-galaxy install -r requirements.yml

CMD ansible-playbook main.yml

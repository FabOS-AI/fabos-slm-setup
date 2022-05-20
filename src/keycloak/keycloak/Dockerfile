FROM quay.io/keycloak/keycloak:12.0.4

ENV DB_VENDOR=mariadb \
    DB_ADDR=keycloak-database \
    DB_DATABASE=keycloak \
    DB_USER=keycloak \
    DB_PASSWORD=password \
    KEYCLOAK_ADMIN_USER=admin \
    KEYCLOAK_ADMIN_PASSWORD=password

USER 0

COPY themes/fabos /opt/jboss/keycloak/themes/fabos

COPY themes/base/login/login.ftl /opt/jboss/keycloak/themes/base/login/login.ftl


COPY startup.sh /keycloak/startup.sh

RUN chmod +x /keycloak/startup.sh

USER 1000

ENTRYPOINT [ "/keycloak/startup.sh" ]

CMD [ "/keycloak/startup.sh" ]

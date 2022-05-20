FROM mariadb:10.5

ENV MYSQL_DATABASE=keycloak \
    MYSQL_USER=keycloak

COPY startup.sh /opt/startup.sh

RUN chmod +x /opt/startup.sh

CMD [ "/opt/startup.sh" ]

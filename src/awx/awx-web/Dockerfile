FROM fabos4ai/slm-awx-fixed-files:15.0.1

ENV AWX_ADMIN_USER=admin \
    AWX_ADMIN_PASSWORD=password \
    DATABASE_NAME=awx \
    DATABASE_USER=awx \
    DATABASE_PASSWORD=awxpass \
    DATABASE_HOST=awx-postgres \
    DATABASE_PORT=5432 \
    http_proxy="" \
    https_proxy="" \
    no_proxy=""

USER root

COPY nginx.conf /etc/nginx/nginx.conf

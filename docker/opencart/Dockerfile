FROM webdevops/php-apache-dev:7.3

# https://github.com/ocStore/ocStore/tags
ENV OCSTORE_VERSION=v3.0.3.7
ENV WEB_DOCUMENT_ROOT=/web/upload
ENV DB_HOST=localhost
ENV DB_USERNAME=root
ENV DB_PASSWORD=""
ENV DB_DATABASE="not_set"
ENV DB_DRIVER=mysqli
ENV DB_PORT=3306
ENV ADMIN_USERNAME=admin
ENV ADMIN_PASSWORD=admin
ENV ADMIN_EMAIL="youremail@example.com"

COPY docker/opencart/scripts /scripts

# RUN apt-get update && apt-get -y install mysql-client

RUN /scripts/download_oc_store.sh

COPY docker/apache2/cors.conf /opt/docker/etc/httpd/vhost.common.d/cors.conf

ENTRYPOINT ["/scripts/entrypoint.sh"]

FROM postgres:9.6-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG POSTGRESQL_VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="Metastore for Hive" \
        org.label-schema.description="An Metastore for Hive docker image based on Alpine Linux" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/nvtienanh/docker-metastore" \
        org.label-schema.vendor="nvtienanh" \
        org.label-schema.version=$POSTGRESQL_VERSION \
        org.label-schema.schema-version="1.0"

COPY hive-schema-2.3.0.postgres.sql /opt/hive/hive-schema-2.3.0.postgres.sql
COPY hive-txn-schema-2.3.0.postgres.sql /opt/hive/hive-txn-schema-2.3.0.postgres.sql

COPY init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh

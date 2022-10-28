FROM 'postgis/postgis'
ADD create_tables.sql /docker-entrypoint-initdb.d/
RUN chmod a+r /docker-entrypoint-initdb.d/*
CMD ["docker-entrypoint.sh", "postgres"]

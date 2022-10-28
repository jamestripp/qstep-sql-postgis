# QSTEP SQL Masterclass - PostGIS docker image

This repository contains the files for a docker image. The docker image will be used in an SQL workshop delivered for the QSTEP centre at the University of Warwick.

The docker file (see below) builds on the rather nice postgis/postgis image. 

```dockerfile
FROM 'postgis/postgis'
LABEL maintainer="James Tripp - https://jamestripp.net"
ADD create_tables.sql /docker-entrypoint-initdb.d/
RUN chmod a+r /docker-entrypoint-initdb.d/*
CMD ["docker-entrypoint.sh", "postgres"]
```

The sql dump create_tables.sql is copied into the folder /docker-entrypoint-initdb.d/ and the files in this folder are marked as executable. The docker-entrypoint.sh script then starts the database and imports the data for the workshop.

The dockerfile is released under GPL-3, however the data sets are downloaded from other sources so please do check the current licenses. The world borders dataset was download from [here](http://thematicmapping.org/downloads/world_borders.php). World indicators were downloaded from [here](https://databank.worldbank.org/reports.aspx?source=world-development-indicators). Details on how the datasets were prepared are available [here](https://github.com/jamestripp/qstep-sql/tree/master/1_preparation).

The .github/workflows/github_registry.yml action builds the container and makes it available at ghcr.io. You can download this image via the below docker comamnd.

```bash
docker pull ghcr.io/jamestripp/qstep-sql-postgis:main
```

In the full workshop this image is used along with other images via a docker compose file.
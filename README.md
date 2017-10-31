# SuiteCRM (dockerized)
### 1. Installation
1. clone this repo
2. cp example.env to .env
3. edit .env

### 2. Deployment
Build the docker image and bring all services up:
```
docker-compose build
docker-compose up -d
```
### 3. Initial startup
Automatic silent installer:
```
docker-compose run --rm app init
```

### 4. DB import/export
Dump db to file dbdump.sql:
```
docker-compose run --rm app dbdump > dbdump.sql
```
Import db file dbdump.sql:
```
docker-compose run --rm app dbimport < dbdump.sql
```

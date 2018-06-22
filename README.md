# Mapbox GL JS feature state

Mapbox GL JS feature state usage example.

## Prerequisites

- [Docker](https://www.docker.com/get-docker)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Step 1. Start database service

```shell
docker-compose up -d db
```

## Step 2. Get stations

```shell
curl https://layer.bicyclesharing.net/map/v1/nyc/stations -o ./data/stations.geojson
```

```shell
docker-compose exec db ogr2ogr -f "PostgreSQL" PG:"dbname=db user=postgres" /data/stations.geojson -nln stations
```

# Mapbox GL JS feature state

Mapbox GL JS feature state usage example.

## Prerequisites

- [Docker](https://www.docker.com/get-docker)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Step 1. Get the source code

```shell
git clone https://github.com/stepankuzmin/mapbox-gl-js-feature-state.git
cd mapbox-gl-js-feature-state
```

## Step 2. Start database service

```shell
docker-compose up -d db
```

## Step 3. Get stations

Get latest NYC stations

```shell
curl https://layer.bicyclesharing.net/map/v1/nyc/stations -o ./data/stations.geojson
```

Upload stations into database

```shell
docker-compose exec db ogr2ogr -f "PostgreSQL" PG:"dbname=db user=postgres" /data/stations.geojson -nln stations
```

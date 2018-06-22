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

## Step 3. Get trip data

Get Citi Bike trip data

```shell
curl https://s3.amazonaws.com/tripdata/201805-citibike-tripdata.csv.zip -o ./data/tripdata.zip
unzip ./data/tripdata.zip -d ./data
```

Upload trips into database

```shell
docker-compose exec db psql -d db -U postgres -c "copy trips from '/data/201805-citibike-tripdata.csv' delimiter ',' csv header"
```

...and aggregate them by hour

```shell
docker-compose exec db psql -d db -U postgres -f /aggregate_trips.sql
```

## Step 4. Review your data

Open [http://localhost:3000](http://localhost:3000/)

# Citi Bike NYC

Mapbox GL JS feature state usage example.

![Screenshot](https://raw.githubusercontent.com/urbica/citibike-nyc/master/screenshot.png)

## Prerequisites

- [Docker](https://www.docker.com/get-docker)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Step 1. Get the source code

```shell
git clone https://github.com/urbica/citibike-nyc.git
cd citibike-nyc
```

## Step 2. Start services

```shell
docker-compose up -d
```

## Step 3. Get trip data

Get Citi Bike trip data and unzip it into the `./data` folder

```shell
curl https://s3.amazonaws.com/tripdata/201805-citibike-tripdata.csv.zip -o ./data/tripdata.zip
unzip ./data/tripdata.zip -d ./data
```

Insert trip data in the database and aggregate trips by hour

```shell
docker-compose exec db psql -d db -U postgres -f /scripts/aggregate_trips.sql
```

## Step 4. Review your data

Open [http://localhost:3000](http://localhost:3000/)

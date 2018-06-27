-- create trips table
create table trips (
  "tripduration" numeric,
  "starttime" timestamp,
  "stoptime" timestamp,
  "start station id" varchar,
  "start station name" varchar,
  "start station latitude" numeric,
  "start station longitude" numeric,
  "end station id" varchar,
  "end station name" varchar,
  "end station latitude" numeric,
  "end station longitude" numeric,
  "bikeid" varchar,
  "name_localizedValue0" varchar,
  "usertype" varchar,
  "birth year" varchar,
  "gender" varchar
);

-- copy trips data to trips table
copy trips from '/data/201805-citibike-tripdata.csv' delimiter ',' csv header;

-- create table trips_count
create table trips_count (station_id varchar, trips_count integer, ts timestamp);

-- create timescaledb hypertable
select create_hypertable('trips_count', 'ts');

-- aggregate trips into trips_count table
insert into trips_count select
    "end station id" as station_id,
    count(date_trunc('hour', stoptime)) as trips_count,
    date_trunc('hour', stoptime) as ts
  from trips
  group by
    station_id, date_trunc('hour', stoptime);
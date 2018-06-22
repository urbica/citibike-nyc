create extension postgis;
create extension timescaledb;

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

create table trips_count (station_id varchar, trips_count integer, ts timestamp);

select create_hypertable('trips_count', 'ts');

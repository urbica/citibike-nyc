insert into trips_count select
    "end station id" as station_id,
    count(date_trunc('hour', stoptime)) as trips_count,
    date_trunc('hour', stoptime) as ts
  from trips
  group by
    station_id, date_trunc('hour', stoptime);
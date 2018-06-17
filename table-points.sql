create table points(gid serial primary key, geom geometry(geometry, 3857));

insert into points
  select
    generate_series(1, 1000),
    st_transform(
      (st_dump(
        st_generatepoints(
          st_geomfromtext('polygon ((-180 90, 180 90, 180 -90, -180 -90, -180 90))', 4326),
          1000
        )
      )).geom,
    3857);
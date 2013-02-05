create table movies
(
  id serial8 primary key,
  title text,
  year varchar(4),
  rated varchar(5),
  released date,
  runtime varchar(20),
  genre text,
  director text,
  writer text,
  actors text,
  plot text,
  poster text,
  rating text,
  votes text,
  imdb_id varchar(20)
);

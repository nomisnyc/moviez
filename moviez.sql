create table movies
(
  id serial8 primary key,
  title text not null,
  year varchar(4) not null,
  rated varchar(5),
  released date,
  genre text,
  director text,
  writer text,
  actors text,
  plot text,
  poster text,
  rating float4,
  votes int8,
  imdb_id varchar(20),
  response bool check ( response == true )
);

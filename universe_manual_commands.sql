--Creating tables
--constellation
create table constellation(
  constellation_id serial primary key,
  name varchar(100) unique not null,
  meaning text not null
);

--galaxy
create table galaxy(
  galaxy_id serial primary key,
  constellation_id int references constellation(constellation_id),
  name varchar(100) unique not null,
  type varchar(50) not null,
  description text not null
);

--star
create table star(
  star_id serial primary key,
  galaxy_id int references galaxy(galaxy_id),
  name varchar(100) unique not null,
  distance_from_earth_ly numeric not null,
  age_in_millions_of_years int
);

--planet
create table planet(
  planet_id serial primary key,
  star_id int references star(star_id),
  name varchar(100) unique not null,
  has_life boolean not null,
  num_rings int not null
);

--moon
create table moon(
  moon_id serial primary key,
  planet_id int references planet(planet_id),
  name varchar(100) unique not null,
  is_spherical boolean not null,
  numeral int not null
);

--inserting data
insert into constellation (name, meaning) values
('Sagittarius', 'centaur with bow and arrow'),
('Andromeda', 'princess of greek mythology'),
('Centaurus', 'half human half horse creature'),
('Coma Berenices', '"Berenice''s Hair" in Latin. Refers Queen Berenice II of Egpyt.'),
('Ursa Major', 'Larger bear in Latin'),
('Virgo', 'Maiden in Latin');


insert into galaxy (constellation_id, name, type, description) values
((select constellation_id from constellation where name='Sagittarius'), 'Milky Way', 'Sb; Sbc; SB(rs)bc', 'Name describes appearance from Earth, a hazy band of light'),
((select constellation_id from constellation where name='Andromeda'), 'Andromeda', 'SA(s)b', 'Named from the Andromeda constellation'),
((select constellation_id from constellation where name='Centaurus'), 'Backward Galaxy', 'SA(r)ab', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.'),
((select constellation_id from constellation where name='Coma Berenices'), 'Black Eye Galaxy', '(R)SA(rs)ab; HIISy2', 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.'),
((select constellation_id from constellation where name='Ursa Major'), 'Messier 81', 'SA(s)ab; LINER', 'Johann Elert Bode discovered this galaxy in 1774'),
((select constellation_id from constellation where name='Virgo'), 'Sombrero Galaxy', 'SA(s)a', 'Similar in appearance to a sombrero.');

insert into star (galaxy_id, name, distance_from_earth_ly, age_in_millions_of_years) values
((select galaxy_id from galaxy where name='Milky Way'), 'Sol', 0, 4603),
((select galaxy_id from galaxy where name='Milky Way'), 'Sirius', 8.611, 228),
((select galaxy_id from galaxy where name='Milky Way'), 'Alpha Centauri', 4.2465, 4850),
((select galaxy_id from galaxy where name='Milky Way'), 'Vega', 25, 455),
((select galaxy_id from galaxy where name='Milky Way'), 'TRAPPIST-1', 40.66, 7600),
((select galaxy_id from galaxy where name='Andromeda'), 'Alpheratz', 97, 70);

insert into planet (star_id, name, has_life, num_rings) values
((select star_id from star where name='Sol'), 'Earth', true, 1),
((select star_id from star where name='Sol'), 'Mercury', false, 0),
((select star_id from star where name='Sol'), 'Venus', false, 0),
((select star_id from star where name='Sol'), 'Mars', false, 0),
((select star_id from star where name='Sol'), 'Jupiter', false, 1),
((select star_id from star where name='Sol'), 'Saturn', false, 8),
((select star_id from star where name='Sol'), 'Uranus', false, 13),
((select star_id from star where name='Sol'), 'Neptune', false, 6),
((select star_id from star where name='Alpha Centauri'), 'Proxima Centauri b', false, 0),
((select star_id from star where name='TRAPPIST-1'), 'TRAPPIST-1b', false, 0),
((select star_id from star where name='TRAPPIST-1'), 'TRAPPIST-1c', false, 0),
((select star_id from star where name='TRAPPIST-1'), 'TRAPPIST-1d', false, 0),
((select star_id from star where name='TRAPPIST-1'), 'TRAPPIST-1e', false, 0);

insert into moon (planet_id, name, is_spherical, numeral) values
((select planet_id from planet where name='Earth'), 'Moon', true, 1),
((select planet_id from planet where name='Mars'), 'Phobos', false, 1),
((select planet_id from planet where name='Mars'), 'Deimos', false, 2),
((select planet_id from planet where name='Jupiter'), 'Io', true, 1),
((select planet_id from planet where name='Jupiter'), 'Europa', true, 2),
((select planet_id from planet where name='Jupiter'), 'Ganymede', true, 3),
((select planet_id from planet where name='Jupiter'), 'Callisto', true, 4),
((select planet_id from planet where name='Jupiter'), 'Amalthea', false, 5),
((select planet_id from planet where name='Jupiter'), 'Thebe', false, 14),
((select planet_id from planet where name='Saturn'), 'Mimas', true, 1),
((select planet_id from planet where name='Saturn'), 'Enceladus', true, 2),
((select planet_id from planet where name='Saturn'), 'Tethys', true, 3),
((select planet_id from planet where name='Saturn'), 'Dione', true, 4),
((select planet_id from planet where name='Saturn'), 'Rhea', true, 5),
((select planet_id from planet where name='Saturn'), 'Titan', true, 6),
((select planet_id from planet where name='Uranus'), 'Ariel', true, 1),
((select planet_id from planet where name='Uranus'), 'Umbriel', true, 2),
((select planet_id from planet where name='Uranus'), 'Titania', true, 3),
((select planet_id from planet where name='Uranus'), 'Oberon', true, 4),
((select planet_id from planet where name='Uranus'), 'Miranda', true, 5);
DROP TABLE IF EXISTS burgers_deals;
DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS days;

CREATE TABLE days(
  id INT8 primary key,
  name VARCHAR(255)
);

CREATE TABLE eateries(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE burgers(
  id SERIAL8 primary key,
  eatery_id INT8 references eateries(id),
  name VARCHAR(255),
  price INT8
);

CREATE TABLE deals(
  id SERIAL8 primary key,
  eatery_id INT8 references eateries(id),
  day_id INT8 references days(id),
  name VARCHAR(255),
  deal_type INT8
);

CREATE TABLE burgers_deals(
  id SERIAL8 primary key,
  burger_id INT8 references burgers(id),
  deal_id INT8 references deals(id),
  eatery_id INT8 references eateries(id)
);
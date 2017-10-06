DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id serial primary key,
  name VARCHAR(255)
);

CREATE TABLE students (
  id serial primary key,
  first_name varchar(255),
  last_name varchar(255),
  house_id INT REFERENCES houses(id),
  age INT
);

/* Create the database */

DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;

/* Create the tables with no foreign key constraints first */

CREATE TABLE Faculty (
  fid INTEGER PRIMARY KEY,
  fname VARCHAR(50),
  deptid INTEGER
);

CREATE TABLE Student (
  snum INTEGER PRIMARY KEY,
  sname VARCHAR(50),
  major VARCHAR(50),
  level VARCHAR(50),
  age INTEGER
);

/* Now we can create the tables that link to the tables above */

CREATE TABLE Class (
  name VARCHAR(50) PRIMARY KEY,
  meets_at TIME,
  room VARCHAR(50),
  fid INTEGER,
  FOREIGN KEY (fid) REFERENCES Faculty (fid)
);

CREATE TABLE Enrolled (
  snum INTEGER,
  cname VARCHAR(50),
  FOREIGN KEY (snum) REFERENCES Student (snum),
  FOREIGN KEY (cname) REFERENCES Class (name)
);
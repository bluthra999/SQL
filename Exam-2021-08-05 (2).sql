/*1.Create  a  database  consisting  of  tables  as  given  above  in  the  relational schema.*/

/* Create the database */

DROP DATABASE IF EXISTS College3;
CREATE DATABASE College3;
USE College3;

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
/* We assume underlined fields in the question indicate the primary keys */
/* Now we can create the tables that link to the tables above */

CREATE TABLE Class (
  name VARCHAR(50),
  meets_at TIME,
  room VARCHAR(50),
  fid INTEGER,
  PRIMARY KEY (name, meets_at, fid),
  FOREIGN KEY (fid) REFERENCES Faculty (fid)
);

CREATE TABLE Enrolled (
  snum INTEGER,
  cname VARCHAR(50),
  PRIMARY KEY (snum, cname),
  FOREIGN KEY (snum) REFERENCES Student (snum),
  FOREIGN KEY (cname) REFERENCES Class (name)
);

/*2.Insert data consisting of at least 5 tuples in each tablesuch that one row of student table must be entered with the following data (snum = 1111, sname = 
<your-name>, major = “Computer Science”, level = “First” and age = 19). Rest of the tuples should have different values than this tuple.*/

INSERT INTO Student VALUES (1111, "Anika Chauhan",   "Computer Science", "First",  19);
INSERT INTO Student VALUES (1112, "Prayag Sharma",   "Maths",            "First",  18);
INSERT INTO Student VALUES (1113, "Shristi Goyal",   "Physical Science", "Second", 20);
INSERT INTO Student VALUES (1114, "Udit Sharma",     "Maths",            "First",  18);
INSERT INTO Student VALUES (1115, "Piyush Verma",    "Computer Science", "Third",  21);
INSERT INTO Student VALUES (1116, "Adhip Chauhan",   "Physical Science", "Second", 20);
INSERT INTO Student VALUES (1117, "Rohan Singh",     "Maths",            "First",  20);
INSERT INTO Student VALUES (1118, "Sarthak Rajput",  "Computer Science", "Second", 20);
INSERT INTO Student VALUES (1119, "Vinita Rathore",  "Maths",            "First",  18);
INSERT INTO Faculty VALUES (11, "Rohit Singh",      1);
INSERT INTO Faculty VALUES (12, "Vansh Sisodia",    1);
INSERT INTO Faculty VALUES (13, "Mehak Thakkar",    2);
INSERT INTO Faculty VALUES (14, "Akshit Sachdeva",  2);
INSERT INTO Faculty VALUES (15, "Priyasi Sharma",   3);
INSERT INTO Faculty VALUES (16, "Nikhil Jha",       3);
INSERT INTO Faculty VALUES (17, "Ishank Verma",     3);

INSERT INTO Enrolled VALUES (1111, "Computer science");
INSERT INTO Enrolled VALUES (1112, "Maths");
INSERT INTO Enrolled VALUES (1113, "Physical science");
INSERT INTO Enrolled VALUES (1114, "Maths");
INSERT INTO Enrolled VALUES (1115, "Physical science");
INSERT INTO Enrolled VALUES (1116, "Maths");
INSERT INTO Enrolled VALUES (1111, "Computer science");
INSERT INTO Enrolled VALUES (1112, "Maths");
INSERT INTO Enrolled VALUES (1113, "Physical science");
INSERT INTO Enrolled VALUES (1114, "Maths");
INSERT INTO Enrolled VALUES (1115, "Physical science");
INSERT INTO Enrolled VALUES (1116, "Maths");
INSERT INTO Enrolled VALUES (1117, "Maths");

/* 3. List Student number and student names whose major is "Maths" and
study in Physical Science (Class name). */

select s.snum, s.sname
from Student as s join Enrolled e on s.snum = e.snum
join Class as c on e.cname = c.name
where s.major = "Maths" and c.name = "Physical Science";

/* 4. List faculty names who teach you (your name). */

select f.fname
from Student as s  join Enrolled as e on s.snum = e.snum
join Class as c on e.cname = c.name
join Faculty f on c.fid = f.fid
where s.sname = "Bhavay Luthra";

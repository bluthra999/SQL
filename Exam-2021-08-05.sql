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



INSERT INTO Student VALUES (1111, "Bhavay Luthra",    "Computer Science", "First",  19);
INSERT INTO Student VALUES (1112, "Shah Rukh Khan",   "Physical Science", "Second", 20);
INSERT INTO Student VALUES (1113, "Tom Cruise",       "Maths",            "First",  19);
INSERT INTO Student VALUES (1114, "George Clooney",   "Maths",            "First",  18);
INSERT INTO Student VALUES (1115, "Robert De Niro",   "Computer Science", "Third",  21);
INSERT INTO Student VALUES (1116, "Amitabh Bachchan", "Computer Science", "First",  19);
INSERT INTO Student VALUES (1117, "Jessica Biel",     "Physical Science", "Second", 20);
INSERT INTO Student VALUES (1118, "Jennifer Aniston", "Computer Science", "Second", 20);
INSERT INTO Student VALUES (1119, "Harrison Ford",    "Maths",            "First",  18);
INSERT INTO Student VALUES (1120, "Jami Gertz",       "Physical Science", "First",  19);

INSERT INTO Faculty VALUES (111, "Niels Bohr",        1);
INSERT INTO Faculty VALUES (112, "Max Planck",        1);
INSERT INTO Faculty VALUES (113, "Werner Heidenberg", 2);
INSERT INTO Faculty VALUES (114, "Albert Einstein",   2);
INSERT INTO Faculty VALUES (115, "Paul Dirac",        3);
INSERT INTO Faculty VALUES (116, "Richard Feynman",   3);

INSERT INTO Class VALUES ("Physical Science",  '09:00:00', "1A", 111);
INSERT INTO Class VALUES ("Quantum mechanics", '14:00:00', "1B", 112);
INSERT INTO Class VALUES ("Thermodynamics",    '09:00:00', "2A", 113);
INSERT INTO Class VALUES ("Fluid dynamics",    '14:00:00', "1A", 114);
INSERT INTO Class VALUES ("Calculus",          '09:00:00', "1B", 115);
INSERT INTO Class VALUES ("Algebra",           '14:00:00', "3A", 116);
INSERT INTO Class VALUES ("Diff equations",    '09:00:00', "3A", 111);
INSERT INTO Class VALUES ("Group theory",      '14:00:00', "1A", 112);
INSERT INTO Class VALUES ("Databases",         '09:00:00', "2B", 113);
INSERT INTO Class VALUES ("Python",            '14:00:00', "2A", 114);

/* Enroll all students into all classes for testing */
INSERT INTO Enrolled VALUES (1111, "Physical Science");
INSERT INTO Enrolled VALUES (1112, "Physical Science");
INSERT INTO Enrolled VALUES (1113, "Physical Science");
INSERT INTO Enrolled VALUES (1114, "Physical Science");
INSERT INTO Enrolled VALUES (1115, "Physical Science");
INSERT INTO Enrolled VALUES (1116, "Physical Science");
INSERT INTO Enrolled VALUES (1117, "Physical Science");
INSERT INTO Enrolled VALUES (1118, "Physical Science");
INSERT INTO Enrolled VALUES (1119, "Physical Science");
INSERT INTO Enrolled VALUES (1120, "Physical Science");

INSERT INTO Enrolled VALUES (1111, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1112, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1113, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1114, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1115, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1116, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1117, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1118, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1119, "Quantum mechanics");
INSERT INTO Enrolled VALUES (1120, "Quantum mechanics");

INSERT INTO Enrolled VALUES (1111, "Thermodynamics");
INSERT INTO Enrolled VALUES (1112, "Thermodynamics");
INSERT INTO Enrolled VALUES (1113, "Thermodynamics");
INSERT INTO Enrolled VALUES (1114, "Thermodynamics");
INSERT INTO Enrolled VALUES (1115, "Thermodynamics");
INSERT INTO Enrolled VALUES (1116, "Thermodynamics");
INSERT INTO Enrolled VALUES (1117, "Thermodynamics");
INSERT INTO Enrolled VALUES (1118, "Thermodynamics");
INSERT INTO Enrolled VALUES (1119, "Thermodynamics");
INSERT INTO Enrolled VALUES (1120, "Thermodynamics");

INSERT INTO Enrolled VALUES (1111, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1112, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1113, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1114, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1115, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1116, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1117, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1118, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1119, "Fluid dynamics");
INSERT INTO Enrolled VALUES (1120, "Fluid dynamics");

INSERT INTO Enrolled VALUES (1111, "Calculus");
INSERT INTO Enrolled VALUES (1112, "Calculus");
INSERT INTO Enrolled VALUES (1113, "Calculus");
INSERT INTO Enrolled VALUES (1114, "Calculus");
INSERT INTO Enrolled VALUES (1115, "Calculus");
INSERT INTO Enrolled VALUES (1116, "Calculus");
INSERT INTO Enrolled VALUES (1117, "Calculus");
INSERT INTO Enrolled VALUES (1118, "Calculus");
INSERT INTO Enrolled VALUES (1119, "Calculus");
INSERT INTO Enrolled VALUES (1120, "Calculus");

INSERT INTO Enrolled VALUES (1111, "Algebra");
INSERT INTO Enrolled VALUES (1112, "Algebra");
INSERT INTO Enrolled VALUES (1113, "Algebra");
INSERT INTO Enrolled VALUES (1114, "Algebra");
INSERT INTO Enrolled VALUES (1115, "Algebra");
INSERT INTO Enrolled VALUES (1116, "Algebra");
INSERT INTO Enrolled VALUES (1117, "Algebra");
INSERT INTO Enrolled VALUES (1118, "Algebra");
INSERT INTO Enrolled VALUES (1119, "Algebra");
INSERT INTO Enrolled VALUES (1120, "Algebra");

INSERT INTO Enrolled VALUES (1111, "Diff equations");
INSERT INTO Enrolled VALUES (1112, "Diff equations");
INSERT INTO Enrolled VALUES (1113, "Diff equations");
INSERT INTO Enrolled VALUES (1114, "Diff equations");
INSERT INTO Enrolled VALUES (1115, "Diff equations");
INSERT INTO Enrolled VALUES (1116, "Diff equations");
INSERT INTO Enrolled VALUES (1117, "Diff equations");
INSERT INTO Enrolled VALUES (1118, "Diff equations");
INSERT INTO Enrolled VALUES (1119, "Diff equations");
INSERT INTO Enrolled VALUES (1120, "Diff equations");

INSERT INTO Enrolled VALUES (1111, "Group theory");
INSERT INTO Enrolled VALUES (1112, "Group theory");
INSERT INTO Enrolled VALUES (1113, "Group theory");
INSERT INTO Enrolled VALUES (1114, "Group theory");
INSERT INTO Enrolled VALUES (1115, "Group theory");
INSERT INTO Enrolled VALUES (1116, "Group theory");
INSERT INTO Enrolled VALUES (1117, "Group theory");
INSERT INTO Enrolled VALUES (1118, "Group theory");
INSERT INTO Enrolled VALUES (1119, "Group theory");
INSERT INTO Enrolled VALUES (1120, "Group theory");

INSERT INTO Enrolled VALUES (1111, "Databases");
INSERT INTO Enrolled VALUES (1112, "Databases");
INSERT INTO Enrolled VALUES (1113, "Databases");
INSERT INTO Enrolled VALUES (1114, "Databases");
INSERT INTO Enrolled VALUES (1115, "Databases");
INSERT INTO Enrolled VALUES (1116, "Databases");
INSERT INTO Enrolled VALUES (1117, "Databases");
INSERT INTO Enrolled VALUES (1118, "Databases");
INSERT INTO Enrolled VALUES (1119, "Databases");
INSERT INTO Enrolled VALUES (1120, "Databases");

INSERT INTO Enrolled VALUES (1111, "Python");
INSERT INTO Enrolled VALUES (1112, "Python");
INSERT INTO Enrolled VALUES (1113, "Python");
INSERT INTO Enrolled VALUES (1114, "Python");
INSERT INTO Enrolled VALUES (1115, "Python");
INSERT INTO Enrolled VALUES (1116, "Python");
INSERT INTO Enrolled VALUES (1117, "Python");
INSERT INTO Enrolled VALUES (1118, "Python");
INSERT INTO Enrolled VALUES (1119, "Python");
INSERT INTO Enrolled VALUES (1120, "Python");


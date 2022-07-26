/* Create the database */

DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;


/* Create the tables with no foreign key constraints first */

CREATE TABLE Dept(
  dept_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(50)
);


CREATE TABLE Faculty(
  faculty_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  faculty_name VARCHAR(50)
);

CREATE TABLE Student(
  faculty_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  student_name VARCHAR(50)
);

CREATE TABLE Course(
  course_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  dept_id INTEGER,
  coordinator_id INTEGER,
  course_name VARCHAR(50)
);

/* Now we can create the tables that link to the tables above */

CREATE TABLE Semester (
  semester_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  FOREIGN KEY (course_id) REFERENCES Course (course_id)
);

CREATE TABLE Paper (
  paper_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  FOREIGN KEY (semester_id) REFERENCES Semester (semester_id)
);

CREATE TABLE Component (
  component_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  FOREIGN KEY (paper_id) REFERENCES Paper (paper_id)
);

/* Finally the link tables */

/* Record which students have registered for which course in an academic year */
CREATE TABLE Registered(
  course_id INTEGER,
  student_id INTEGER,
  start_date DATE,
  FOREIGN KEY (course_id) REFERENCES Course (course_id)
  FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

/* Record which students have attended a component of a paper on what date */
CREATE TABLE Attended(
  component_id INTEGER,
  student_id INTEGER,
  attended_date DATE,
  FOREIGN KEY (component_id) REFERENCES Component (component_id)
  FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

/* Record which faculty taught a paper in an academic year */
CREATE TABLE Taught(
  component_id INTEGER,
  faculty_id INTEGER,
  taught_date DATE,
  FOREIGN KEY (component_id) REFERENCES Component (component_id)
  FOREIGN KEY (faculty_id) REFERENCES Faculty (faculty_id)
);


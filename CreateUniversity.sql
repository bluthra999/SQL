/* Create the database */

DROP DATABASE IF EXISTS college;

CREATE DATABASE college;
USE COLLEGE;

/* Create the tables */

CREATE TABLE college (
    CollegeCode INTEGER PRIMARY KEY,
    CName VARCHAR (50),
    COffice VARCHAR(50),
    CPhone  VARCHAR(15),
    DeanId INTEGER /* One-one link to faculty table */
);

CREATE TABLE department (
    DCode INTEGER PRIMARY KEY,
    CollegeCode INTEGER, /* Many-one link to college table */
    ChairID INTEGER, /* One-one link to faculty table */
    CStartdate Date,
    DName VARCHAR(50),
    DOffice  VARCHAR(150),
    DPhone  VARCHAR(15)
);

CREATE TABLE course (
    CCode INTEGER PRIMARY KEY,
    InstructorId INTEGER, /* One-one link to faculty table */
    CoName VARCHAR(50) UNIQUE,
    Level INTEGER,
    Credits  INTEGER,
    CDesc  VARCHAR(250)
);

CREATE TABLE faculty (
    FacCode INTEGER PRIMARY KEY,
    DCode INTEGER, /* Many-one link to department table */
    IName VARCHAR(50),
    IPhone  VARCHAR(15),
    IOffice VARCHAR(150),
    Rank INTEGER
);

CREATE TABLE student (
    StudentId INTEGER PRIMARY KEY,
    DCode INTEGER, /* Many-one link to department table */
    Major INTEGER, /* One-one link to course table */
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    DoB DATE,
    Phone VARCHAR(15),
    Addr VARCHAR(150)
);

CREATE TABLE section (
    SecId INTEGER PRIMARY KEY,
    SecNo INTEGER,
    CCode INTEGER, /* Many-one link to course table */
    InstructorId INTEGER, /* Many-one link to faculty table */
    Year INTEGER,
    Semester INTEGER,
    Bldg VARCHAR(50),
    RoomNo VARCHAR(50), /* Room numbers could be text e.g. "Room 1B" */
    DaysTime VARCHAR(50) /* e.g. "MWF 9am-9.50am" */
);

CREATE TABLE student_grade (
     StudentId INTEGER, /* Many-one link to student table */
     SecId INTEGER, /* Many-one link to section table */
     Grade INTEGER
);

/* We need to insert the basic data before adding the foreign keys 
otherwise we'll get problems with foreign key violations */

INSERT INTO college VALUES (1, "Delhi University", "Delhi", "01234 567890", 1);
INSERT INTO department VALUES (1, 1, 1, "2020-01-01", "Physics", "Office", "01234 567890");
INSERT INTO faculty VALUES (1, 1, "The Dean", "01234 567890", "Dean's office", 0);

/* Add the relationships */

ALTER TABLE college ADD FOREIGN KEY (DeanId) REFERENCES faculty(FacCode);

ALTER TABLE department ADD FOREIGN KEY (CollegeCode) REFERENCES college(CollegeCode);
ALTER TABLE department ADD FOREIGN KEY (ChairId) REFERENCES faculty(FacCode);

ALTER TABLE course ADD FOREIGN KEY (InstructorId) REFERENCES faculty(FacCode);

ALTER TABLE faculty ADD FOREIGN KEY (DCode) REFERENCES department(DCode);

ALTER TABLE student ADD FOREIGN KEY (DCode) REFERENCES department(DCode);
ALTER TABLE student ADD FOREIGN KEY (Major) REFERENCES course(CCode);

ALTER TABLE section ADD FOREIGN KEY (CCode) REFERENCES course(CCode);
ALTER TABLE section ADD FOREIGN KEY (InstructorId) REFERENCES faculty(FacCode);

ALTER TABLE student_grade ADD FOREIGN KEY (StudentId) REFERENCES student(StudentId);
ALTER TABLE student_grade ADD FOREIGN KEY (SecId) REFERENCES section(SecId);

/* Add indexes on columns we might reasonable want to search by */

CREATE INDEX idx_faculty_iname ON faculty(IName);

CREATE INDEX idx_student_name ON student(FName, LName);

CREATE INDEX idx_grade on student_grade(StudentId, SecId);
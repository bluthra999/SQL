/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ project_college /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE project_college;

DROP TABLE IF EXISTS attended;
CREATE TABLE `attended` (
  `acomponent_id` int(11) DEFAULT NULL,
  `astudent_id` int(11) DEFAULT NULL,
  `attended_date` date DEFAULT NULL,
  KEY `acomponent_id` (`acomponent_id`),
  KEY `astudent_id` (`astudent_id`),
  CONSTRAINT `attended_ibfk_1` FOREIGN KEY (`acomponent_id`) REFERENCES `component` (`component_id`),
  CONSTRAINT `attended_ibfk_2` FOREIGN KEY (`astudent_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS component;
CREATE TABLE `component` (
  `component_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpaper_id` int(11) DEFAULT NULL,
  `component_name` varchar(50) DEFAULT NULL,
  `component_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  KEY `cpaper_id` (`cpaper_id`),
  CONSTRAINT `component_ibfk_1` FOREIGN KEY (`cpaper_id`) REFERENCES `paper` (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS dept;
CREATE TABLE `dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS faculty;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(50) DEFAULT NULL,
  `faculty_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS paper;
CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `psemester_id` int(11) DEFAULT NULL,
  `paper_name` varchar(50) DEFAULT NULL,
  `papertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  KEY `psemester_id` (`psemester_id`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`psemester_id`) REFERENCES `semester` (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS registered;
CREATE TABLE `registered` (
  `rcourse_id` int(11) DEFAULT NULL,
  `rstudent_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  KEY `rcourse_id` (`rcourse_id`),
  KEY `rstudent_id` (`rstudent_id`),
  CONSTRAINT `registered_ibfk_1` FOREIGN KEY (`rcourse_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `registered_ibfk_2` FOREIGN KEY (`rstudent_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS semester;
CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL AUTO_INCREMENT,
  `scourse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`semester_id`),
  KEY `scourse_id` (`scourse_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`scourse_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS student;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) DEFAULT NULL,
  `student_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS taught;
CREATE TABLE `taught` (
  `tcomponent_id` int(11) DEFAULT NULL,
  `tfaculty_id` int(11) DEFAULT NULL,
  `taught_date` date DEFAULT NULL,
  KEY `tcomponent_id` (`tcomponent_id`),
  KEY `tfaculty_id` (`tfaculty_id`),
  CONSTRAINT `taught_ibfk_1` FOREIGN KEY (`tcomponent_id`) REFERENCES `component` (`component_id`),
  CONSTRAINT `taught_ibfk_2` FOREIGN KEY (`tfaculty_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;









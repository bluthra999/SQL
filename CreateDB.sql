/* Create the database */

DROP DATABASE IF EXISTS Prescriptions;
CREATE DATABASE Prescriptions;
USE Prescriptions;


/* Create the tables with no foreign key constraints first */

CREATE TABLE Doctor(
  SSN INTEGER PRIMARY KEY AUTO_INCREMENT,
  Firstname VARCHAR(50),
  Lastname VARCHAR(50),
  Speciality VARCHAR(50),
  YearsOfExp INTEGER,
  PhoneNum VARCHAR(50)
);

CREATE TABLE Medicine(
  TradeName VARCHAR(50) PRIMARY KEY,
  UnitPrice INTEGER,
  GenericFlag INTEGER
);

/* Now we can create the tables that link to the tables above */

CREATE TABLE Patient(
  SSN INTEGER PRIMARY KEY AUTO_INCREMENT,
  Firstname VARCHAR(50),
  Lastname VARCHAR(50),
  Address VARCHAR(50),
  DOB DATE,
  PrimaryDoc_SSN INTEGER,
  FOREIGN KEY (PrimaryDoc_SSN) REFERENCES Doctor (SSN)
);

CREATE TABLE Prescription(
  ID INTEGER PRIMARY KEY AUTO_INCREMENT,
  PDate DATE,
  Doctor_SSN INTEGER,
  Patient_SSN INTEGER,
  FOREIGN KEY (Doctor_SSN) REFERENCES Doctor (SSN),
  FOREIGN KEY (Patient_SSN) REFERENCES Patient (SSN)
);

CREATE TABLE Prescription_Medicine(
  PrescriptionID INTEGER,
  TradeName VARCHAR(50),
  Quantity INTEGER,
  FOREIGN KEY (PrescriptionID) REFERENCES Prescription (ID),
  FOREIGN KEY (TradeName) REFERENCES Medicine (TradeName)
);

/* Doctors */

insert into Doctor values (1, 'Alfred', 'Aardvark', 'Arthritis', 1, '1234');
insert into Doctor values (2, 'Bill', 'Bootstrap', 'Bones', 2, '1234');
insert into Doctor values (3, 'Rakesh', 'Sharma', 'Chest', 3, '1234');
insert into Doctor values (4, 'Hasno', 'Patients', 'Diseases', 4, '1234');

/* Medicines */

insert into Medicine values ('Asprin', 149, 1);
insert into Medicine values ('Paracetamol', 151, 1);
insert into Medicine values ('Vitamin', 160, 1);
insert into Medicine values ('Splot', 200, 0);

/* Patients */

insert into Patient values (1, 'John', 'Rennie', 'England', '1854-01-01', 1);
insert into Patient values (2, 'Bhavay', 'Luthra', 'India', '2000-01-01', 2);
insert into Patient values (3, 'Anne', 'Other', 'India', '2000-01-01', 3);

/* Prescriptions */

/* Prescription written by John's doctor for John */
insert into Prescription values (1, '2021-01-01', 1, 1);
insert into Prescription_Medicine values (1, 'Asprin', 20);
insert into Prescription_Medicine values (1, 'Paracetamol', 20);

/* Prescription written by John's doctor for Bhavay */
insert into Prescription values (2, '2021-01-01', 1, 2);
insert into Prescription_Medicine values (2, 'Asprin', 20);

/* Prescription written by Bhavay's doctor for Bhavay */
insert into Prescription values (3, '2021-01-01', 2, 2);
insert into Prescription_Medicine values (3, 'Splot', 12);
insert into Prescription_Medicine values (3, 'Paracetamol', 12);
insert into Prescription_Medicine values (3, 'Vitamin', 12);

/* Prescription for Paracetamol for Anne */
insert into Prescription values (4, '2021-01-01', 3, 3);
insert into Prescription_Medicine values (4, 'Paracetamol', 100);

/* Q1 */

Select Tradename from Medicine
where GenericFlag = true and UnitPrice < 150;

/* Q2 */

select P.Firstname , P.Lastname
from Patient as P join Doctor as D on D.SSN = P.PrimaryDoc_SSN
where D.FirstName = 'Rakesh' and D.LastName = 'Sharma';

/* Q3 */

select d.Firstname, d.Lastname
from Doctor d left join Patient p on d.SSN = p.PrimaryDoc_SSN
where p.SSN is null;

/* or */

select d.Firstname, d.Lastname
from Doctor d left join Patient p on d.SSN = p.PrimaryDoc_SSN
group by d.Firstname, d.Lastname
having count(p.SSN) = 0;

/* Q4 */

select TradeName, sum(Quantity)
from Prescription_Medicine
group by TradeName
having count(TradeName) > 20;

/* Q5 */

/* Count number of items per prescription for testing */
select p.ID, count(m.TradeName)
from Prescription p join Prescription_Medicine m on p.ID = m.PrescriptionID
group by p.ID;

/* Now count number of items only including paracetamol and vitamin */
select p.ID, count(m.TradeName)
from Prescription p join Prescription_Medicine m on p.ID = m.PrescriptionID
where m.TradeName in ('Paracetamol', 'Vitamin')
group by p.ID;

/* Final working query */
select distinct p.Patient_SSN
from Prescription p join Prescription_Medicine m on p.ID = m.PrescriptionID
where m.TradeName in ('Paracetamol', 'Vitamin')
group by p.ID
having count(m.TradeName) = 2;

/* Q6 */

select distinct p.Patient_SSN
from Prescription as p join Prescription_Medicine as m on p.ID = m.PrescriptionID
join  Doctor as d on d.SSN = p.Doctor_SSN
where m.tradename = 'Paracetamol'
and d.Firstname  = 'Rakesh' and D.Lastname = 'Sharma';

/* Q7 */

select p.Firstname, p.Lastname
from Patient p
where not exists
(
  select pr.ID from Prescription pr
  where pr.Patient_SSN = p.SSN
  and not pr.Doctor_SSN = p.PrimaryDoc_SSN
);

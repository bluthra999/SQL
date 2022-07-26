/* Create the database */

DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;
USE Library;


/* Create the tables with no foreign key constraints first */

CREATE TABLE Borrower(
  Card_no INTEGER PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(50),
  Address VARCHAR(75),
  Phone VARCHAR(15)
);

CREATE TABLE Library_Branch(
  Branch_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  Branch_name VARCHAR(50),
  Address VARCHAR(75)
);

CREATE TABLE Publisher(
  Name VARCHAR(100) PRIMARY KEY,
  Address VARCHAR(100),
  Phone VARCHAR(15)
);

/* Now we can create the tables that link to the tables above */

CREATE TABLE Book (
  Book_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(50),
  Publisher_name VARCHAR(100),
  FOREIGN KEY (Publisher_name) REFERENCES Publisher (Name)
);

CREATE TABLE Book_Authors(
  Book_id INTEGER,
  Author_name VARCHAR(100),
  FOREIGN KEY (Book_id) REFERENCES Book (Book_id)
);

CREATE TABLE Book_Copies(
  Book_id INTEGER,
  Branch_id INTEGER,
  No_of_copies INTEGER,
  FOREIGN KEY (Book_id) REFERENCES Book (Book_id),
  FOREIGN KEY (Branch_id) REFERENCES Library_Branch (Branch_id)
);

CREATE TABLE Book_Loans(
  Book_id INTEGER,
  Branch_id INTEGER,
  Card_no INTEGER,
  Date_out DATE,
  Due_date DATE,
  FOREIGN KEY (Book_id) REFERENCES Book (Book_id),
  FOREIGN KEY (Branch_id) REFERENCES Library_Branch (Branch_id),
  FOREIGN KEY (Card_no) REFERENCES Borrower (Card_no)
);

/* Publishers */

insert into publisher (Name, Address, Phone) values ('Unknown', '', '');
insert into publisher (Name, Address, Phone) values ('Ace', '', '');
insert into publisher (Name, Address, Phone) values ('Atria Books', '', '');
insert into publisher (Name, Address, Phone) values ('Chicago Review Press', '', '');
insert into publisher (Name, Address, Phone) values ('Del Rey', '', '');
insert into publisher (Name, Address, Phone) values ('Diversion Books', '', '');
insert into publisher (Name, Address, Phone) values ('Dutton', '', '');
insert into publisher (Name, Address, Phone) values ('Ecco', '', '');
insert into publisher (Name, Address, Phone) values ('Eminence Publishing', '', '');
insert into publisher (Name, Address, Phone) values ('Farrar, Straus and Giroux', '', '');
insert into publisher (Name, Address, Phone) values ('Gallery / Saga Press', '', '');
insert into publisher (Name, Address, Phone) values ('Gollancz', '', '');
insert into publisher (Name, Address, Phone) values ('Knopf', '', '');
insert into publisher (Name, Address, Phone) values ('Kypros Press', '', '');
insert into publisher (Name, Address, Phone) values ('MIRA', '', '');
insert into publisher (Name, Address, Phone) values ('Open Road Media', '', '');
insert into publisher (Name, Address, Phone) values ('PS Publishing Ltd', '', '');
insert into publisher (Name, Address, Phone) values ('Small Beer Press', '', '');
insert into publisher (Name, Address, Phone) values ('Souvenir Press', '', '');
insert into publisher (Name, Address, Phone) values ('Strange Attractor Press', '', '');
insert into publisher (Name, Address, Phone) values ('Tachyon Publications', '', '');
insert into publisher (Name, Address, Phone) values ('Titan Books', '', '');
insert into publisher (Name, Address, Phone) values ('Tor.com', '', '');
insert into publisher (Name, Address, Phone) values ('Viking', '', '');
insert into publisher (Name, Address, Phone) values ('Walker Books', '', '');

/* Books - the id is auto increment */

insert into book (Title, Publisher_name) values ('The Witchs Heart', 'Ace');
insert into book (Title, Publisher_name) values ('The Memory Collectors', 'Atria Books');
insert into book (Title, Publisher_name) values ('Jack of Shadows', 'Chicago Review Press');
insert into book (Title, Publisher_name) values ('Malice', 'Del Rey');
insert into book (Title, Publisher_name) values ('The Space Between Worlds', 'Del Rey');
insert into book (Title, Publisher_name) values ('The Lathe of Heaven', 'Diversion Books');
insert into book (Title, Publisher_name) values ('Spontaneous', 'Dutton');
insert into book (Title, Publisher_name) values ('A Beautifully Foolish Endeavor', 'Dutton');
insert into book (Title, Publisher_name) values ('Hazards of Time Travel', 'Ecco');
insert into book (Title, Publisher_name) values ('Robbergirl', 'Eminence Publishing');
insert into book (Title, Publisher_name) values ('What Big Teeth', 'Farrar, Straus and Giroux');
insert into book (Title, Publisher_name) values ('The Twisted Ones', 'Gallery / Saga Press');
insert into book (Title, Publisher_name) values ('The Hollow Places', 'Gallery / Saga Press');
insert into book (Title, Publisher_name) values ('What Abigail Did That Summer', 'Gollancz');
insert into book (Title, Publisher_name) values ('Klara and the Sun', 'Knopf');
insert into book (Title, Publisher_name) values ('The White People', 'Kypros Press');
insert into book (Title, Publisher_name) values ('We Could Be Heroes', 'MIRA');
insert into book (Title, Publisher_name) values ('Cards of Grief', 'Open Road Media');
insert into book (Title, Publisher_name) values ('Something From Below', 'PS Publishing Ltd');
insert into book (Title, Publisher_name) values ('Sooner or Later Everything Falls Into the Sea', 'Small Beer Press');
insert into book (Title, Publisher_name) values ('Bum Fodder: An Absorbing History of Toilet Paper', 'Souvenir Press');
insert into book (Title, Publisher_name) values ('Hawkwind: Days of the Underground', 'Strange Attractor Press');
insert into book (Title, Publisher_name) values ('Unity', 'Tachyon Publications');
insert into book (Title, Publisher_name) values ('Birds of Paradise', 'Titan Books');
insert into book (Title, Publisher_name) values ('Hall of Smoke', 'Titan Books');
insert into book (Title, Publisher_name) values ('Interstellar: The Official Movie Novelization', 'Titan Books');
insert into book (Title, Publisher_name) values ('Fugitive Telemetry', 'Tor.com');
insert into book (Title, Publisher_name) values ('Defekt', 'Tor.com');
insert into book (Title, Publisher_name) values ('The Expert Systems Champion', 'Tor.com');
insert into book (Title, Publisher_name) values ('The Expert Systems Brother', 'Tor.com');
insert into book (Title, Publisher_name) values ('When the Tiger Came Down the Mountain', 'Tor.com');
insert into book (Title, Publisher_name) values ('Across the Green Grass Fields', 'Tor.com');
insert into book (Title, Publisher_name) values ('Sun-Daughters, Sea-Daughters', 'Tor.com');
insert into book (Title, Publisher_name) values ('The Reincarnationist Papers', 'Unknown');
insert into book (Title, Publisher_name) values ('Orfeia', 'Unknown');
insert into book (Title, Publisher_name) values ('So Not a Hero', 'Unknown');
insert into book (Title, Publisher_name) values ('The Willows', 'Unknown');
insert into book (Title, Publisher_name) values ('The Midnight Library', 'Viking ');
insert into book (Title, Publisher_name) values ('The Reckless Afterlife of Harriet Stoker', 'Walker Books ');

/* Authors */

insert into book_authors (Book_id, Author_name) values (1, 'author');

insert into book_authors (Book_id, Author_name) values (1, 'Genevieve Gornichec');
insert into book_authors (Book_id, Author_name) values (2, 'Kim Neville');
insert into book_authors (Book_id, Author_name) values (3, 'Roger Zelazny');
insert into book_authors (Book_id, Author_name) values (4, 'Heather Walter');
insert into book_authors (Book_id, Author_name) values (5, 'Micaiah Johnson');
insert into book_authors (Book_id, Author_name) values (6, 'Ursula K. Le Guin');
insert into book_authors (Book_id, Author_name) values (7, 'Aaron Starmer');
insert into book_authors (Book_id, Author_name) values (8, 'Hank Green');
insert into book_authors (Book_id, Author_name) values (9, 'Joyce Carol Oates');
insert into book_authors (Book_id, Author_name) values (10, 'S.T. Gibson');
insert into book_authors (Book_id, Author_name) values (11, 'Rose Szabo');
insert into book_authors (Book_id, Author_name) values (12, 'T. Kingfisher');
insert into book_authors (Book_id, Author_name) values (13, 'T. Kingfisher');
insert into book_authors (Book_id, Author_name) values (14, 'Ben Aaronovitch');
insert into book_authors (Book_id, Author_name) values (15, 'Kazuo Ishiguro');
insert into book_authors (Book_id, Author_name) values (16, 'Arthur Machen');
insert into book_authors (Book_id, Author_name) values (17, 'Mike Chen');
insert into book_authors (Book_id, Author_name) values (18, 'Jane Yolen');
insert into book_authors (Book_id, Author_name) values (19, 'S.T. Joshi');
insert into book_authors (Book_id, Author_name) values (20, 'Sarah Pinsker');
insert into book_authors (Book_id, Author_name) values (21, 'Richard Smyth');
insert into book_authors (Book_id, Author_name) values (22, 'Joe Banks');
insert into book_authors (Book_id, Author_name) values (23, 'Elly Bangs');
insert into book_authors (Book_id, Author_name) values (24, 'Oliver K. Langmead');
insert into book_authors (Book_id, Author_name) values (25, 'H.M. Long');
insert into book_authors (Book_id, Author_name) values (26, 'Greg Keyes');
insert into book_authors (Book_id, Author_name) values (27, 'Martha Wells');
insert into book_authors (Book_id, Author_name) values (28, 'Nino Cipri');
insert into book_authors (Book_id, Author_name) values (29, 'Adrian Tchaikovsky');
insert into book_authors (Book_id, Author_name) values (30, 'Adrian Tchaikovsky');
insert into book_authors (Book_id, Author_name) values (31, 'Nghi Vo');
insert into book_authors (Book_id, Author_name) values (32, 'Seanan McGuire');
insert into book_authors (Book_id, Author_name) values (33, 'Aimee Ogden');
insert into book_authors (Book_id, Author_name) values (34, 'D. Eric Maikranz');
insert into book_authors (Book_id, Author_name) values (35, 'Joanne M. Harris');
insert into book_authors (Book_id, Author_name) values (36, 'S.J. Delos');
insert into book_authors (Book_id, Author_name) values (37, 'Algernon Blackwood');
insert into book_authors (Book_id, Author_name) values (38, 'Matt Haig');
insert into book_authors (Book_id, Author_name) values (39, 'Lauren James');

/* Borrowers */

insert into borrower (Name, Address, Phone) values ('Ashutosh Bhardwaj', 'Jeevan Bharati, Tower Ii, 124, Connaught Circuls, New Delhi', '01124534831');
insert into borrower (Name, Address, Phone) values ('Sanjay K. Chamoli', 'N-69, Connaught Place, New Delhi', '01122322178');
insert into borrower (Name, Address, Phone) values ('Amita Chandra', 'Jeevan Tara Building, 1Sr Floor, Gate No.4, 5 Sansad Marg, New Delhi', '01165359594');
insert into borrower (Name, Address, Phone) values ('Debajyoti Choudhury', 'N-72, Connaught Circus, New Delhi', '01124534828');
insert into borrower (Name, Address, Phone) values ('Patrick Das Gupta', '64, Janpath, New Delhi', '01165165577');

insert into borrower (Name, Address, Phone) values ('Raj Kishore Sharma', 'Oriental 1St And 2Nd Floor, 86, Janpath, New Delhi', '01124534829');
insert into borrower (Name, Address, Phone) values ('Rakesh Kumar', '25 K.G. Marg, Jeevan Prakash Building, New Delhi', '01165165575');
insert into borrower (Name, Address, Phone) values ('Rakesh Kumar Sharma', '53/54, Govardhan Building, Nehru Place, New Delhi', '01165682608');
insert into borrower (Name, Address, Phone) values ('Dhanraj T Masram', 'August Kranti Bhawan, Plot No.25, Bhikaji Cama Place, New Delhi', '01165165582');
insert into borrower (Name, Address, Phone) values ('Brajendra K Singh', 'F-19, United India Building, Connaught Place, New Delhi', '01122828299');

/* Library branches */

insert into library_branch (Branch_name, Address) values ('Physics', 'Delhi University');
insert into library_branch (Branch_name, Address) values ('Chemistry', 'Delhi University');

/* For convenience we'll just split the books between the branches */

insert into book_copies (Book_id, Branch_id, No_of_copies) values (1, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (2, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (3, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (4, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (5, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (6, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (7, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (8, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (9, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (10, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (11, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (12, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (13, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (14, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (15, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (16, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (17, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (18, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (19, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (20, 1, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (21, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (22, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (23, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (24, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (25, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (26, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (27, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (28, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (29, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (30, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (31, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (32, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (33, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (34, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (35, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (36, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (37, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (38, 2, 1);
insert into book_copies (Book_id, Branch_id, No_of_copies) values (39, 2, 1);

/* Finally create some random loans */

insert into book_loans values (1, 1, 1, CURDATE(), NULL);
insert into book_loans values (2, 1, 2, CURDATE(), NULL);
insert into book_loans values (3, 1, 3, CURDATE(), NULL);
insert into book_loans values (4, 1, 4, CURDATE(), NULL);
insert into book_loans values (5, 1, 5, CURDATE(), NULL);
insert into book_loans values (6, 1, 6, CURDATE(), NULL);
insert into book_loans values (7, 1, 7, CURDATE(), NULL);
insert into book_loans values (8, 1, 8, CURDATE(), NULL);
insert into book_loans values (9, 1, 9, CURDATE(), NULL);
insert into book_loans values (10, 1, 10, CURDATE(), NULL);
insert into book_loans values (21, 2, 1, CURDATE(), NULL);
insert into book_loans values (22, 2, 2, CURDATE(), NULL);
insert into book_loans values (23, 2, 3, CURDATE(), NULL);
insert into book_loans values (24, 2, 4, CURDATE(), NULL);
insert into book_loans values (25, 2, 5, CURDATE(), NULL);
insert into book_loans values (26, 2, 6, CURDATE(), NULL);
insert into book_loans values (27, 2, 7, CURDATE(), NULL);
insert into book_loans values (28, 2, 8, CURDATE(), NULL);
insert into book_loans values (29, 2, 9, CURDATE(), NULL);
insert into book_loans values (30, 2, 10, CURDATE(), NULL);

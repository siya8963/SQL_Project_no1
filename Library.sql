
DROP TABLE student;
DROP TABLE author;
DROP TABLE book;
DROP TABLE catalogue_entry;
DROP TABLE department;
DROP TABLE lecturer;
DROP TABLE publisher;
DROP TABLE reservation;
DROP TABLE rooms;
DROP TABLE transactiontable;


CREATE TABLE student (
  student_id VARCHAR(8) CONSTRAINT student_id_pk PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  email_address VARCHAR(40) NOT NULL
);



CREATE TABLE catalogue_entry (
  book_id NUMBER(4),
  CONSTRAINT book_id_fk 
  FOREIGN KEY (book_id)
  REFERENCES book(book_id),
  title VARCHAR(40) NOT NULL,
  loan_status NUMBER(1),
  CONSTRAINT ck_catalogue_room_ischk CHECK(loan_status IN (1,0))
);


CREATE TABLE department (
    department_id NUMBER(4) CONSTRAINT department_id_pk PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
    );

CREATE TABLE book (
    book_id NUMBER(4) CONSTRAINT book_id_pk PRIMARY KEY,
    isbn VARCHAR(40) NOT NULL,
    title VARCHAR(40) NOT NULL,
    author_id NUMBER(4) NOT NULL,
    CONSTRAINT author_book_fk 
    FOREIGN KEY (author_id)
    REFERENCES author(author_id),
    publisher_id NUMBER(4) NOT NULL,
    CONSTRAINT publsher_book_fk 
    FOREIGN KEY (publisher_id)
    REFERENCES publisher(publisher_id)
    );

CREATE TABLE transaction(
    transaction_id NUMBER(4) CONSTRAINT transaction_id_pk PRIMARY KEY,
    student_id VARCHAR(8) NOT NULL,
    CONSTRAINT transaction_student_fk 
    FOREIGN KEY (student_id)
    REFERENCES student(student_id),
    book_id NUMBER(4) NOT NULL,
    CONSTRAINT tranaction_book_fk 
    FOREIGN KEY (book_id)
    REFERENCES book(book_id),
    transaction_date DATE,
    return_date DATE
    );

    
CREATE TABLE reservation (
    reservation_id NUMBER(5) NOT NULL PRIMARY KEY,
    student_id VARCHAR(8),
    CONSTRAINT reservation_student_fk 
    FOREIGN KEY (student_id)
    REFERENCES student(student_id),
    lecturer_id VARCHAR(8),
    CONSTRAINT reservation_lecture_fk 
    FOREIGN KEY (lecturer_id)
    REFERENCES lecturer(lecturer_id),
    starting_time TIMESTAMP NOT NULL,
    ending_time TIMESTAMP NOT NULL,
    reservation_date DATE NOT NULL,
    room_id VARCHAR(5) NOT NULL,
    CONSTRAINT room_reservation_fk 
    FOREIGN KEY (room_id)
    REFERENCES rooms(room_id)
    );


    
CREATE TABLE lecturer (
    lecturer_id VARCHAR(8) CONSTRAINT lecturer_id_pk PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email_address VARCHAR(40) NOT NULL 
    );
    
CREATE TABLE publisher (
    publisher_id NUMBER(4) CONSTRAINT publisher_id_pk PRIMARY KEY,
    publish_name VARCHAR(25) NOT NULL,
    publish_year DATE
    );
    
CREATE TABLE author(
    author_id NUMBER(4) CONSTRAINT author_id_pk PRIMARY KEY,
    department_id NUMBER(4),
    CONSTRAINT department_author_fk 
    FOREIGN KEY (department_id)
    REFERENCES department(department_id),
    author_name VARCHAR(25) NOT NULL
    );

CREATE TABLE rooms(
    room_id VARCHAR(6) CONSTRAINT rooms_id_pk PRIMARY KEY,
    capacity NUMBER(4) NOT NULL,
    is_booked NUMBER(1),
    CONSTRAINT ck_lecture_room_ischk CHECK(is_booked IN (1,0))
    );


/*ADDING DATA*/
INSERT INTO student VALUES('33744998', 'Kyle', 'Ogle', 'kyleogle1212@icloud.com');
INSERT INTO student VALUES('41447868', 'Sheldon', 'Cooper', 'SheldonCooper@gmail.com');
INSERT INTO student VALUES('34646753', 'Leonard', 'Hoffstadter', 'leonardHoff19@icloud.com');
INSERT INTO student VALUES('24564523', 'Joey', 'Diaz', 'joeytheman80@gmail.com');
INSERT INTO student VALUES('34343237', 'Rorisang', 'Seiso', 'seisororisang@gmail.com');
INSERT INTO student VALUES('25556431', 'Moagi', 'Lamola', 'hulkmo@gmail.com');
INSERT INTO student VALUES('42434323', 'Xavi', 'Simons', 'xavisimons@psv.com');
INSERT INTO student VALUES('24533323', 'Thorgan', 'Hazard', 'ThorTheHazard@psv.com');
INSERT INTO student VALUES('34545322', 'Raj', 'Koothrapoli', 'rajkoo@icloud.com');
INSERT INTO student VALUES('34599329', 'Randall', 'Ogle', 'oglerandall@icloud.com');
INSERT INTO student VALUES('34456434', 'Aran', 'Smith', 'aransmith@icloud.com');

INSERT INTO lecturer VALUES ('43344998', 'Steven', 'Gerrard', 'stevieg2005@gmail.com');
INSERT INTO lecturer VALUES ('13744999', 'Virgil', 'Van Dijk', 'flyingdutchman@gmail.com');
INSERT INTO lecturer VALUES ('23145765', 'Jurgen', 'Klopp', 'TheBoss@gmail.com');
INSERT INTO lecturer VALUES ('22477328', 'Mo', 'Salah', 'egyptionking@gmail.com');
INSERT INTO lecturer VALUES ('45678232', 'Luis', 'Diaz', 'lucho23@gmail.com');
INSERT INTO lecturer VALUES ('23431236', 'Sebastian', 'Haller', 'sebastianhaller19@gmail.com');
INSERT INTO lecturer VALUES ('34512367', 'Ruud', 'Van Nistelrooy', 'ruudtheboss@gmail.com');
INSERT INTO lecturer VALUES ('32165476', 'Ibrahima', 'Konate', 'thegoat@gmail.com');
INSERT INTO lecturer VALUES ('22633887', 'Jobe', 'Bellingham', 'smallbrojobe@gmail.com');
INSERT INTO lecturer VALUES ('43567553', 'Jude', 'Bellingham', 'budesligawinner22/23@gmail.com');

INSERT INTO book VALUES (book_id_value.nextval,'978-1-234567-89-0', 'The Amazing World of Chemistry 10ED', 4, 1);
INSERT INTO book VALUES (book_id_value.nextval,'0-987654-32-1', 'Modern Physics 5ED', 1, 1);
INSERT INTO book VALUES (book_id_value.nextval,'978-0-123456-78-9', 'The wild world of economics 1ED', 10, 2);
INSERT INTO book VALUES (book_id_value.nextval,'1-234567-89-0', 'Personology 5ED', 6, 3);
INSERT INTO book VALUES (book_id_value.nextval,'978-0-987654-32-1', 'Calculus 11ED', 1, 1);
INSERT INTO book VALUES (book_id_value.nextval,'0-123456-78-9', 'Law Order 23ED', 7, 4);
INSERT INTO book VALUES (book_id_value.nextval,'978-1-234567-89-0', 'Total Football', 2, 1);
INSERT INTO book VALUES (book_id_value.nextval,'0-987654-32-1', 'FM23 and its secrets', 8, 1);
INSERT INTO book VALUES (book_id_value.nextval,'978-0-123456-78-9', 'Law Of Latin 6ED', 9, 4);
INSERT INTO book VALUES (book_id_value.nextval,'1-234567-89-0', 'Universal Thermodynamics 10ED',3, 1);

INSERT INTO catalogue_entry VALUES (1, 'The Amazing World of Chemistry 10ED', 1);
INSERT INTO catalogue_entry VALUES (2, 'Modern Physics 5ED', 0);
INSERT INTO catalogue_entry VALUES (3, 'The wild world of economics 1ED', 0);
INSERT INTO catalogue_entry VALUES (4, 'Personology 5ED', 0);
INSERT INTO catalogue_entry VALUES (5, 'Calculus 11ED', 1);

INSERT INTO catalogue_entry VALUES (6, 'Total Football', 1);
INSERT INTO catalogue_entry VALUES (7, 'FM23 and its secrets', 1);
INSERT INTO catalogue_entry VALUES (8, 'Law Of Latin 6ED', 0);
INSERT INTO catalogue_entry VALUES (9, 'Universal Thermodynamics 10ED', 1);
INSERT INTO catalogue_entry VALUES (10, 'Law Order 23ED', 0);

INSERT INTO department VALUES (1, 'NSAG');
INSERT INTO department VALUES (2, 'ECMA');
INSERT INTO department VALUES (3, 'HEDE');
INSERT INTO department VALUES (4, 'LAWD');

INSERT INTO author VALUES (author_id_value.nextval,1,'Sir Isaac Newton' );
INSERT INTO author VALUES (author_id_value.nextval,1,'Johan Cruyff' );
INSERT INTO author VALUES (author_id_value.nextval,2,'Sheldon' );
INSERT INTO author VALUES (author_id_value.nextval,2,'Leonard' );
INSERT INTO author VALUES (author_id_value.nextval,3,'Jose Morinhou' );
INSERT INTO author VALUES (author_id_value.nextval,3,'Amy' );
INSERT INTO author VALUES (author_id_value.nextval,4,'Raj' );
INSERT INTO author VALUES (author_id_value.nextval,4,'Kyle' );
INSERT INTO author VALUES (author_id_value.nextval,1,'Penny' );
INSERT INTO author VALUES (author_id_value.nextval,2,'Xavi' );

INSERT INTO publisher VALUES (publisher_id_value.nextval,'Van Schaik',TO_DATE('2020-04-07', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'Penguin', TO_DATE('2012-03-09', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'Big Bang Books', TO_DATE('2001-03-10', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'Good Books',TO_DATE('2002-01-09', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'FM23', TO_DATE('2023-03-09', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'We do Books', TO_DATE('2005-07-25', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'EcoBooks', TO_DATE('1994-02-19', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'PSV', TO_DATE('2002-03-09', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'NWU', TO_DATE('1985-12-09', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'AnimeBooks', TO_DATE('1975-10-09', 'yyyy-mm-dd') );
INSERT INTO publisher VALUES (publisher_id_value.nextval,'WowBooks', TO_DATE('1999-11-11', 'yyyy-mm-dd') );

INSERT INTO reservation VALUES(reservation_id_value.nextval,'42434323','', TO_DATE('2023-04-02 12:30:00' ,'yyyy-mm-dd hh:mi:ss' ),TO_DATE('2023-04-02 01:30:00', 'yyyy-mm-dd hh:mi:ss'),TO_DATE('2023-04-02' ,'yyyy-mm-dd' ),'SEMG1');
INSERT INTO reservation VALUES(reservation_id_value.nextval,'33744998','', TO_DATE('2023-05-02 12:30:00' ,'yyyy-mm-dd hh:mi:ss' ),TO_DATE('2023-05-02 01:30:00', 'yyyy-mm-dd hh:mi:ss'),TO_DATE('2023-05-02' ,'yyyy-mm-dd' ),'LECG1');


INSERT INTO transaction VALUES(transaction_id_value.nextval,'33744998',1,TO_DATE('2023-04-02' ,'yyyy-mm-dd' ),TO_DATE('2023-05-02' ,'yyyy-mm-dd' ));

INSERT INTO rooms VALUES('SEMG1',20,1);
INSERT INTO rooms VALUES('SEMG2',20,0);
INSERT INTO rooms VALUES('SEM11',30,0);
INSERT INTO rooms VALUES('SEM12',30,0);
INSERT INTO rooms VALUES('SEM13',30,0);
INSERT INTO rooms VALUES('SEMG21',10,0);
INSERT INTO rooms VALUES('SEMG22',10,0);
INSERT INTO rooms VALUES('SEMG23',10,0);
INSERT INTO rooms VALUES('LECG1',50,1);
INSERT INTO rooms VALUES('LECG2',50,1);

/*SEQUENCING*/
DROP SEQUENCE student_id_value;
DROP SEQUENCE lecturer_id_value;
DROP SEQUENCE reservation_id_value;
DROP SEQUENCE transaction_id_value;

CREATE SEQUENCE  student_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

CREATE SEQUENCE  lecturer_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

CREATE SEQUENCE  author_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

CREATE SEQUENCE  publisher_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

DROP SEQUENCE book_id_value;

CREATE SEQUENCE  reservation_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

DROP SEQUENCE reservation_id_value;

CREATE SEQUENCE  department_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

CREATE SEQUENCE  book_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;

CREATE SEQUENCE  transaction_id_value
start with 1
increment by 1
minvalue 1
maxvalue 100
cycle;
/*END*/
    
CREATE OR REPLACE VIEW bookstatus_view AS
SELECT title, loan_status
FROM catalogue_entry
WHERE loan_status=0;

SELECT * FROM bookstatus_view;

CREATE OR REPLACE VIEW borrowed_books_view AS
SELECT s.student_id "Student ID", b.ISBN "ISBN number ", t.transaction_id "Transaction ID", t.return_date "Return date of book"
FROM student s, book b, transaction t
WHERE s.student_id=t.student_id;

SELECT * FROM borrowed_books_view;

/*CREATE OR REPLACE VIEW late_books_view AS
SELECT s.student_id "Student ID", s.first_name "First Name ", s.last_name "Last Name", s.email_address "Email Address"
FROM student s, catalogue_entry c, transaction t
WHERE (s.student_id=t.student_id AND t.loan_status=1 AND  TO_DATE(SYSTIMESTAMP(),'yyyy-mm-dd') > t.return_date);*/


/**END/




/*DELETING RECORDS*/
DELETE FROM author;
DELETE FROM book;
DELETE FROM catalogue_entry;
DELETE FROM department;
DELETE FROM lecturer;
DELETE FROM publisher
WHERE publisher_id BETWEEN 11 AND 22;
DELETE FROM reservation;
DELETE FROM student;
DELETE FROM transaction;
DELETE FROM rooms;

/*END*/


/*INDEXING*/
CREATE INDEX idx_studentname
ON student (last_name,first_name);

CREATE INDEX idx_lecturename
ON lecturer (last_name,first_name);

CREATE INDEX idx_book
ON book (title);
/*END*/



DROP INDEX idx_studentname;

/*SQL QUERIES*/
/*SORTING*/
SELECT * 
FROM student
ORDER BY first_name ASC;

SELECT * 
FROM lecturer
ORDER BY first_name ASC;

SELECT * 
FROM catalogue_entry
ORDER BY title ASC;

SELECT * 
FROM book
ORDER BY title ASC;
/*LIKE*/
SELECT *
FROM student
WHERE first_name LIKE 'K%';

SELECT *
FROM student
WHERE student_id LIKE '3%';


/*VARIABLES AND CHARACTER FUNCTIONS*/
SELECT CONCAT(s.first_name,s.last_name) AS full_name, s.student_id
FROM student s, reservation rs
WHERE rs.student_id=s.student_id AND rs.room_id = ANY(SELECT room_id
                        FROM rooms 
                        WHERE SUBSTR(room_id,1,3)='SEM');
                        
SELECT CONCAT(s.first_name,s.last_name) AS full_name, s.student_id
FROM student s, reservation rs
WHERE rs.student_id=s.student_id AND rs.room_id = ANY(SELECT room_id
                        FROM rooms 
                        WHERE SUBSTR(room_id,1,3)='LEC');

SELECT CONCAT(l.first_name,l.last_name) AS full_name, l.lecturer_id
FROM lecturer l, reservation rs
WHERE rs.lecturer_id=l.lecturer_id AND rs.room_id = ANY(SELECT room_id
                        FROM rooms 
                        WHERE SUBSTR(room_id,1,3)='SEM');
        
SELECT CONCAT(l.first_name,l.last_name)e AS full_name, l.lecturer_id
FROM lecturer l, reservation rs
WHERE rs.lecturer_id=l.lecturer_id AND rs.room_id = ANY(SELECT room_id
                        FROM rooms 
                        WHERE SUBSTR(room_id,1,3)='LEC');




/*END*/

/*AGGREGATE FUNCTIONS*/
SELECT COUNT (title) AS NumberOfBooksLoaned
FROM catalogue_entry
WHERE loan_status=1;

SELECT SUM (is_booked) AS NumOfSeminarRoomsBooked
FROM reservation
WHERE is_booked=1 AND room_name='SEM';

SELECT SUM (is_booked) AS NumOfLectureRoomsBooked
FROM reservation
WHERE is_booked=1 AND room_name='LEC';

/*GROUP BY AND HAVING*/
SELECT COUNT(room_id) AS Rooms_with_10plus_cap, capapcity
FROM rooms
GROUP BY capapcity
HAVING (capapcity) > 10
ORDER BY COUNT(room_id) ASC;

SELECT COUNT(room_id) AS Rooms_booked
FROM rooms
GROUP BY is_booked
HAVING (is_booked) = 1
ORDER BY COUNT(room_id) ASC;

SELECT COUNT(room_id) AS Rooms_not_booked
FROM rooms
GROUP BY is_booked
HAVING (is_booked) = 0
ORDER BY COUNT(room_id) ASC;

/*JOINS*/
SELECT s.student_id,t.transaction_id
FROM student s
INNER JOIN transaction t ON s.student_id  = t.student_id;

SELECT s.student_id,r.reservation_id
FROM student s
LEFT JOIN reservation r ON s.student_id  = r.student_id;

SELECT l.lecturer_id,r.reservation_id
FROM lecturer l
LEFT JOIN reservation r ON l.lecturer_id  = r.lecturer_id;
/*END*/



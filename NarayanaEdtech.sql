CREATE DATABASE movie;
USE movie;
CREATE TABLE usertable(id INT PRIMARY KEY,first_name VARCHAR(100),last_name VARCHAR(100),age INT,salary INT);
INSERT INTO usertable VALUES(1,'hari','allamsetti',20,30000);
INSERT INTO usertable VALUES(1,'priya','allamsetti',23,25000);
INSERT INTO usertable VALUES(1,'neeraj','sai',17,35000);
select * from usertable;
CREATE TABLE movielist(id INT PRIMARY KEY,movie_id INT,movie_name VARCHAR(100),hero VARCHAR(100),heroine VARCHAR(100),ticket_price INT,movie_rating FLOAT,FOREIGN KEY(movie_id)REFERENCES usertable(id));
INSERT INTO movielist VALUES(1,1,'jalsa','pawankalyan','ileana',150,8.9);
INSERT INTO movielist VALUES(2,1,'darling','prabhas','kajal',200,9.0);
INSERT INTO movielist VALUES(3,2,'kushi','pawankalyan','bhumika',300,4.7);
INSERT INTO movielist VALUES(4,2,'pokiri','maheshbabu','ileana',100,7.3);
INSERT INTO movielist VALUES(5,2,'brahmastra','ranbir','alia',350,3.5);
INSERT INTO movielist VALUES(6,3,'mirchi','prabhas','anushka',180,8.9);
SELECT * FROM movielist;
SELECT usertable.id,movielist.movie_name FROM usertable INNER JOIN movielist ON usertable.id=movielist.movie_id;
SELECT usertable.id,movielist.movie_id,movielist.movie_name,movielist.ticket_price FROM usertable,movielist WHERE usertable.id=movielist.movie_id and ticket_price>150;
SELECT usertable.id,movielist.movie_name,movielist.movie_rating FROM usertable,movielist WHERE usertable.id=movielist.movie_id and movie_rating<5.0;
SELECT movie_name,heroine,COUNT(heroine) FROM movielist GROUP BY heroine HAVING COUNT(heroine)>=2;
SELECT movielist.movie_id,SUM(ticket_price),AVG(ticket_price) FROM movielist GROUP BY movielist.movie_id;
SELECT movie_name,heroine,COUNT(heroine) FROM movielist GROUP BY heroine HAVING movie_id IN(SELECT movie_id FROM movielist WHERE COUNT(heroine)>=2);





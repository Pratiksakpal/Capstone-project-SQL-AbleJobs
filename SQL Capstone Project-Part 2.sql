# Creating Database Noble Prizes

Create database Nobel_Prizes;

use Nobel_Prizes;

Create table Nobel (
year int not null,
subject varchar(100),
winner varchar(100),
country varchar(100),
category varchar(100)
);

select * from Nobel

#Loading data into table

LOAD DATA INFILE 'Untitled spreadsheet - Sheet1 (1).csv' 
INTO TABLE Nobel
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES; 

select * from Nobel;

#From the above table, write a SQL query to find the Nobel Prize winner(s) in the following years (Return year, subject and winner) : 1970 , 1987.

SELECT year, subject, winner
FROM Nobel
WHERE year IN (1970, 1987);

#From the above table, write a SQL query to find the Nobel Prize winner in 'Literature' in the year 1971. Return winner.

SELECT winner
FROM Noble
WHERE year = 1971 AND category = 'Literature';
# Ans - no result found


SELECT winner, category, year
from Nobel
WHERE year = 1971 ;

#From the following table, write a SQL query to find the Nobel Prize winner 'Dennis Gabor'. Return year, subject.
SELECT category, year
from Nobel
WHERE winner = 'Dennis Gabor' ;

#From the following table, write a SQL query to find the Nobel Prize winners in 'Physics' since the year 1950. Return winner.

SELECT winner, year
from Nobel
WHERE subject = Physics , year>1950 ;
#-----------------------------------------------------END---------------------------------------------------------


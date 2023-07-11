create  database FILM
use FILM
create table ARTIST(artist_id int primary key,artist_name varchar(255),artist_gender varchar(255))
insert into ARTIST values(101,'YASH','MALE')
insert into ARTIST values(102,'RAMYA','FEMALE')
insert into ARTIST values(103,'SHARUK','MALE')
insert into ARTIST values(104,'ADITHI','FEMALE')
insert into ARTIST values(105,'PUNEETH','MALE')

create table DIRECTOR(director_id int primary key,director_name varchar(255),director_place varchar(255))
insert into DIRECTOR values(201,'YOGRAJ BHAT','BANGLORE')
insert into DIRECTOR values(202,'RAJ MOULI','MUMBAI')
insert into DIRECTOR values(203,'S NARAYAN','MYSORE')
insert into DIRECTOR values(204,'DWARKEESH','MANDYA')
insert into DIRECTOR values(205,'RAKSHITH SHETTY','VIRAJPET')

create table MOVIE (film_id int primary key,film_name varchar(255),film_year int,film_language varchar(255),director_id int)
alter table MOVIE add constraint key1 foreign key(director_id)references DIRECTOR(director_id)
insert into MOVIE values(301,'KGF',2015,'KANNADA',205)
insert into MOVIE values(302,'THREE IDIOTS',2016,'HINDI',201)
insert into MOVIE values(303,'TITANIC',2017,'ENGLISH',203)
insert into MOVIE values(304,'KING KONG',2018,'ENGLISH',202)
insert into MOVIE values(305,'LUCKY',2019,'KANNADA',204)

create table CASTING(artist_id int,film_id int,charcter_name varchar(255))
alter table CASTING add constraint key2 foreign key (artist_id) references ARTIST(artist_id)
alter table CASTING add constraint key3 foreign key (film_id) references MOVIE(film_id)
insert into CASTING values(102,301,'hero')
insert into CASTING values(105,303,'heroin')
insert into CASTING values(101,302,'mother')
insert into CASTING values(104,304,'father')
insert into CASTING values(103,302,'sister')


create table REVIEW(film_id int,stars int)
alter table REVIEW add constraint key4 foreign key (film_id) references MOVIE(film_id)
insert into REVIEW values(305,4)
insert into REVIEW values(302,3)
insert into REVIEW values(304,1)
insert into REVIEW values(301,5)
insert into REVIEW values(302,2)



select * from ARTIST
select * from DIRECTOR
select * from MOVIE
select * from CASTING
select * from REVIEW

//display the names of all the films whose director is raj mouli

select film_name
from MOVIE
where director_id=(select director_id
from DIRECTOR
where director_name='RAJ MOULI')

//display movie is releasing on particular releasing date

select film_name 
from MOVIE
where film_year=2015

//display all artist who acted in a film between 2015 and 2019

SELECT A.artist_NAME,  M.FILM_name, M.FILM_YEAR 
FROM ARTIST A, CASTING C, MOVIE M
WHERE A.artist_ID=C.artist_ID 
AND C.FILM_ID=M.FILM_ID 
AND M.FILM_YEAR  BETWEEN 2015 AND 2019;

///display names of film with the star recived and sort the results based on stars

 select film_name,REVIEW.stars
 from MOVIE
 inner join REVIEW on MOVIE.film_id=REVIEW.film_id
 order by stars
 
 ///update the star of all film whose director name is yograj bhat to 5
 
update REVIEW 
set stars=5
where film_id in(select film_id
from MOVIE where director_id in(select director_id
from DIRECTOR where director_name='YOGRAJ BHAT'))

//display full join for movie and casting

select * from MOVIE
left join CASTING
on MOVIE.film_id=CASTING.film_id
union all
select * from CASTING
right join MOVIE
on MOVIE.film_id=CASTING.film_id



 
 














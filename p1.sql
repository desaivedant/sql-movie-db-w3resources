-- CREATING MOVIE DATABASE 
USE MASTER
CREATE DATABASE MOVIES_W3

-- CREATING THE movie table
USE MOVIES_W3
CREATE TABLE actor (
    act_id int NOT NULL,
act_fname varchar(20),
act_lname varchar(20),
act_gender varchar(1)
)

ALTER TABLE actor ADD CONSTRAINT PK_actor PRIMARY KEY (act_id);

INSERT INTO actor (act_id,act_fname,act_lname,act_gender) Values (101,'James','Stewart','M'),

(102,'Deborah','Kerr','F'),
(103,'Peter','OToole','M'),
(104,'Robert','DeNiro','M'),
(106,'Harrison','Ford','M'),
(108,'Stephen','Baldwin','M'),
(109,'Jack','Nicholson','M'),
(110,'Mark','Wahlberg','M'),
(111,'Woody','Allen','M'),
(112,'Claire','Danes','F'),
(113,'Tim','Robbins','M'),
(114,'Kevin','Spacey','M'),
(115,'Kate','Winslet','F'),
(116,'Robin','Williams','M'),
(117,'Jon','Voight','M'),
(118,'Ewan','McGregor','M'),
(119,'Christian','Bale','M'),
(120,'Maggie','Gyllenhaal','F'),
(121,'Dev','Patel','M'),
(122,'Sigourney','Weaver','F'),
(123,'David','Aston','M'),
(124,'Ali','Astin','F')



-- CREATING THE genres table

CREATE TABLE genres (
    gen_id int NOT NULL,
gen_title varchar(20)
)

ALTER TABLE genres ADD CONSTRAINT PK_genres PRIMARY KEY (gen_id);

insert into genres values (1001,'Action'),
(1002,'Adventure'),
(1003,'Animation'),
(1004,'Biography'),
(1005,'Comedy'),
(1006,'Crime'),
(1007,'Drama'),
(1008,'Horror'),
(1009,'Music'),
(1010,'Mystery'),
(1011,'Romance'),
(1012,'Thriller'),
(1013,'War')

-- CREATING THE director table

CREATE TABLE director (
    dir_id INT not null,
dir_fname VARCHAR(20),
dir_lname VARCHAR(20)
)

ALTER TABLE director ADD CONSTRAINT PK_director PRIMARY KEY (dir_id);

insert into director values
(201,'Alfred','Hitchcock'),
(202,'Jack','Clayton'),
(203,'David','Lean'),
(204,'Michael','Cimino'),
(205,'Milos','Forman'),
(206,'Ridley','Scott'),
(207,'Stanley','Kubrick'),
(208,'Bryan','Singer'),
(209,'Roman','Polanski'),
(210,'Paul','Thomas Anderson'),
(211,'Woody','Allen'),
(212,'Hayao','Miyazaki'),
(213,'Frank','Darabont'),
(214,'Sam','Mendes'),
(215,'James','Cameron'),
(216,'Gus','Van Sant'),
(217,'John','Boorman'),
(218,'Danny','Boyle'),
(219,'Christopher','Nolan'),
(220,'Richard','Kelly'),
(221,'Kevin','Spacey'),
(222,'Andrei','Tarkovsky'),
(223,'Peter','Jackson')

-- CREATING THE movie table

create table movie (
    mov_id int NOT NULL,
mov_title varchar(50),
mov_year int,
mov_time int,
mov_lang varchar(50),
mov_dt_rel datetime,
mov_rel_country varchar(5)
)

ALTER TABLE movie ADD CONSTRAINT PK_movie PRIMARY KEY (mov_id);

-- CREATING THE movie_genres TABLE

CREATE TABLE movie_genres(
    gen_id int FOREIGN KEY (gen_id) REFERENCES genres(gen_id),
    mov_id int FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
)

-- CREATING THE movie_direction TABLE

CREATE TABLE movie_direction(
    dir_id int FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    mov_id int FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
)

-- CREATING THE reviewer table

CREATE TABLE reviewer (
    rev_id INT not null,
rev_name VARCHAR(20),

)

ALTER TABLE reviewer ADD CONSTRAINT PK_reviwer PRIMARY KEY (rev_id);


--CREATE THE rating table

CREATE TABLE rating(
    mov_id int FOREIGN KEY (mov_id) REFERENCES movie(mov_id), 
rev_id int FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id),
rev_stars int,
num_o_rating int
)


--create the movie_cast table

USE MOVIES_W3
CREATE TABLE movie_cast(
    act_id int FOREIGN KEY (act_id) REFERENCES actor(act_id),
    mov_id int FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    [role] varchar(30)
    
)

--
USE MOVIES_W3
SELECT M.mov_id AS "ID",M.mov_title AS "MovieName",M.mov_year AS "Year",M.mov_time AS "Time"
,M.mov_lang AS "Language",M.mov_dt_rel AS "ReleaseDate",M.mov_rel_country AS "ContryOrigin"
,(AC.act_fname +SPACE(2)+ AC.act_lname) AS "Actor",(DT.dir_fname +SPACE(2)+ DT.dir_lname) AS "Director",
GN.gen_title AS "Genres",RT.rev_stars AS "Review",RW.rev_name AS "Reviewer"
FROM movie M
LEFT JOIN rating RT 
ON M.mov_id = RT.mov_id
LEFT JOIN reviewer RW 
ON RW.rev_id = RT.rev_id
LEFT JOIN movie_cast MC 
ON MC.mov_id = M.mov_id
LEFT JOIN actor AC 
ON AC.act_id = MC.act_id
LEFT JOIN movie_direction MD
ON MD.mov_id = M.mov_id
LEFT JOIN director DT 
ON DT.dir_id = MD.dir_id
LEFT JOIN movie_genres MG 
ON MG.mov_id = M.mov_id
LEFT JOIN genres GN 
ON MG.gen_id = GN.gen_id




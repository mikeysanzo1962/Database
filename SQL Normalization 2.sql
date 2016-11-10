-- Michael Sanzo
-- 11/9/2016
-- Drop tables if they already exist in the DBMS
drop table if exists Location;
drop table if exists Person;
drop table if exists actors;
drop table if exists spouse;
drop table if exists directors;
drop table if exists directorInMovie
drop table if exists actorInMovie;
drop table if exists movies;

-- Person
create table PersonDetails
(
    pid     char(3) not null,

    fName   text,
    lName    text,
    birthDay   date,
    stAddress	text,
    spouse	text,
    zip     integer references zipCode(zip),

    primary key(pid)
);

-- Movies
create table Movies
(
    mid     char(3) not null,
    name    text,
    releaseDate    integer,
    dSales   integer,
    fSales    integer,
    mSales  integer,
    MPAAnum	integer,

    primary key(mid)
);


-- Location
create table Location
(
    zip     integer not null,
    city    text,
    state   char(2),

    primary key(zip)
);

-- Actor
create table Actors
(
    pid     char(3) not null references person(pid),
    hairColor   text,
    eyeColor    text,
    heightInInches  real,
    weight  real,
    sagAnniversaryDate  date,
    spouse	text,
    favColor	text,

    primary key(pid)
);


-- Director
create table Directors
(
    pid     char(3) not null references person(pid),
    filmSchool  text,
    dgAnniversaryDate   date,
    favLense	text,
    spouse	text,

    primary key(pid)
);


create table ActorsInMovie
(
    mid     char(3) not null references movies(mid),
    pid     char(3) references actor(pid),

    primary key(mid, pid)
);


create table DirectorsInMovie
(
    mid     char(3) not null references movies(mid),
    pid     char(3) references director(pid),

    primary key(mid, pid)
);

-- Insert statements

-- Zip Codes
insert into Location(zip, city, state)
    values(11111, 'City1', 'CT');
    
insert into Location(zip, city, state)
    values(21111, 'City2', 'NY');
    
insert into Location(zip, city, state)
    values(31111, 'City3', 'MA');

-- Person
insert into personDetails(pid, fName, lName, birthDay, stAddress, zip, spouse)
    values('p01', 'Tyler', 'Dulemba', '1990-01-01', '1 Marist St', 11111, True);
    
insert into personDetails(pid, fName, lName, birthDay, stAddress, zip, spouse)
    values('p02', 'Mike', 'Mataras', '1995-01-02', '2 Marist St', 11111, True);
    
insert into personDetails(pid, fName, lName, birthDay, stAddress, zip, spouse)
    values('p03', 'Sean', 'Connery', '1930-08-30', '3 Marist St', 31111, False);
    
insert into personDetails(pid, fName, lName, birthDay, stAddress, zip, spouse)
    values('p04', 'Michael', 'Sanzo', '1985-01-03', '4 Marist St', 31111, False);
    
insert into personDetails(pid, fName, lName, birthDay, stAddress, zip, spouse)
    values('p05', 'Shane', 'Steinman', '1970-01-04', '5 Marist St', 21111, NULL);
    
insert into personDetails(pid, fName, lName, birthDay, stAddress, zip, spouse)
    values('p06', 'Evan', 'Toucey', '1932-01-05', '6 Marist St', 11111, False);

-- Actor
insert into actor(pid, hColor, IColor, height, weight, spouse, favColor, sagAnniDate)
    values('p01', 'Black', 'Brown', '72', '185', 'True', 'White','2017-01-01');
    
insert into actor(pid, hColor, IColor, height, weight, spouse, favColor, sagAnniDate)
    values('p02', 'Brown', 'Blue', '69', '205', 'True', 'Yellow','2017-01-10');
    
insert into actor(pid, hColor, IColor, height, weight, spouse, favColor, sagAnniDate)
    values('p03', 'Gray', 'Brown', '74', '180', 'False', 'Green', '2017-01-20');


-- Directors
insert into director(pid, schoolFilm, dgAnniDate, favLense, spouse)
    values('p03', 'Duke', '2011-08-25','Wide Angle','False');
    
insert into director(pid, schoolFilm, dgAnniDate, favLense, spouse)
    values('p04', 'Harvard', '2011-01-04','Standard','Flase');
    
insert into director(pid, schoolFilm, dgAnniDate, favLense, spouse)
    values('p05', 'Yale', '2011-01-05','Ultra Wide','NULL');
    
insert into director(pid, schoolFilm, dgAnniDate, favLense, spouse)
    values('p06', 'MIT', '2011-01-06','Telephoto','False');


-- Movies
insert into movies(mid, name, releaseDate, dSales, fSales, mSales, MPAAnum)
    values('m01', 'Movie 1', 1970, 30000, 20000, 10000, 1234);
    
insert into movies(mid, name, releaseDate, dSales, fSales, mSales, MPAAnum)
    values('m02', 'Movie 2', 1972, 40000, 50000, 60000, 1233);
    
insert into movies(mid, name, releaseDate, dSales, fSales, mSales, MPAAnum)
    values('m03', 'Movie 3', 1973, 90000, 80000, 70000, 1235);
    
insert into movies(mid, name, releaseDate, dSales, fSales, mSales, MPAAnum)
    values('m04', 'Movie 4', 1974, 100, 200, 300, 1236);
    
insert into  movies(mid, name, releaseDate, dSales, fSales, mSales, MPAAnum)
    values('m05', 'Movie 5', 1975, 400, 500, 600, 1237);
    
insert into  movies(mid, name, releaseDate, dSales, fSales, mSales, MPAAnum)
    values('m06', 'Movie 6', 1979, 700, 800, 900, 1238);


-- Actors In Movies
insert into actorsInMovies(mid, pid,)
    values('m01', 'p01');
    
insert into actorsInMovies(mid, pid,)    
    values('m01', 'p03');
    
insert into actorsInMovies(mid, pid,)    
    values('m02', 'p01');
    
insert into actorsInMovies(mid, pid,)
    values('m02', 'p02' );
    
insert into actorsInMovies(mid, pid,)
    values('m02', 'p03' );
    
insert into actorsInMovies(mid, pid,)
    values('m03', 'p02' );
    
insert into actorsInMovies(mid, pid,)
    values('m04', 'p01');
    
insert into actorInMovies(mid, pid,)
    values('m04', 'p02' );
    
insert into actorsInMovies(mid, pid,)
    values('m05', 'p02' );
    
insert into actorsInMovies(mid, pid,)
    values('m05', 'p03' );
    
insert into actorsInMovies(mid, pid,)
    values('m06', 'p01' );


-- Directors In Movies
insert into directorsInMovies(mid, pid,)
    values('m01', 'p04');

insert into directorsInMovies(mid, pid,)
    values('m02', 'p06');

insert into directorsInMovies(mid, pid,)
    values('m03', 'p04');
    
insert into directorsInMovies(mid, pid,)
    values('m03', 'p05');

insert into directorsInMovies(mid, pid,)
    values('m04', 'p05');

insert into directorsInMovies(mid, pid,)
    values('m05', 'p04');

insert into directorsInMovies(mid, pid,)
    values('m06', 'p04');
    
insert into directorsInMovies(mid, pid,)
    values('m06', 'p05');
    
insert into directorsInMovies(mid, pid,)
    values('m06', 'p06');

             
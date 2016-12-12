drop table if exists people;
drop table if exists teams;
drop table if exists sports;
drop table if exists brand;
drop table if exists cardset;
drop table if exists values;
drop table if exists cards;

-- people
CREATE TABLE People (
  pid		VARCHAR(20),
  irstname 	VARCHAR(20),
  lastname 	VARCHAR(20),
  tid	 	VARCHAR(20),
  PRIMARY KEY (pid)
);

-- teams
CREATE TABLE Teams (
  tid 		VARCHAR(20),
  sid 		VARCHAR(20),
  name		VARCHAR(20),
  PRIMARY KEY (tid)
);
-- sports
CREATE TABLE Sports (
  sid 		VARCHAR(20),
  sportType 	VARCHAR (20),
  PRIMARY KEY (sid)
);
-- brands
CREATE TABLE Brand (
  bid 		VARCHAR(20),
  Name	 	VARCHAR(20),
  PRIMARY KEY (bid)
);

-- cardset
CREATE TABLE CardSet (
  SetID 	VARCHAR(20),
  bid	 	VARCHAR(20),
  Year	 	VARCHAR(20),
  PRIMARY KEY (SetID)
);

--values
CREATE TABLE Values (
  vid	 	VARCHAR(20),
  cid		VARCHAR(20),
  nmUSD		VARCHAR(20),
  mintUSD	VARCHAR(20),
  gemUSD	VARCHAR(20),
  PRIMARY KEY (vid)
);

--cards
CREATE TABLE Cards (
  cid	 	VARCHAR(20),
  pid	 	VARCHAR(20),
  CardNumb	VARCHAR(20),
  Type	 	VARCHAR(20),
  sid	 	VARCHAR(20),
  bid 		VARCHAR(20),
  tid 		VARCHAR(20),
  SetID 	VARCHAR(20),
  vid		VARCHAR(20),
  PRIMARY KEY (cid)
);

-- Insert statements

--values
INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('01', '001', '24','65','975');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('02', '002', '10','30','75');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('03', '003', '100','350','11000');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('04', '004', '12','30','120');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('05', '005', '95','475','3250');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('06', '006', '28','110','2300');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('07', '007', '115','775','7500');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('08', '008', '70','650','4000');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('09', '009', '40','75','335');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('10', '010', '185','475','2750');

INSERT INTO values (vid, cid, nmUSD, mintUSD, gemUSD)
     values ('11', '011', '220','1950','15000');


SELECT *
FROM brand

--cards
INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('001', '01', '25', 'HOF', '12','1211','07','01','01');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('002', '02', '50', 'HOF', '13','1111','11','36','02');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('003', '03', '315', 'HOF,R', '12','1211','10','33','03');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('004', '04', '10', 'HOF', '12','1211','09','01','04');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('005', '05', '245', 'HOF,R', '12','1211','08','05','05');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('006', '06', '1', 'HOF', '12','1211','06','05','06');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('007', '07', '100', 'Norm', '11','1211','04','05','07');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('008', '08', '20', 'HOF', '11','1211','05','05','08');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('009', '09', '660', 'HOF', '11','1111','12','24','09');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('010', '10', '247', 'R', '11','1211','03','41','10');

INSERT INTO cards (cid, pid, cardnumb, type, sid, bid, tid, SetID, vid)
     values ('011', '11', '5', 'Norm', '11','1211','08','05','11');


SELECT *
FROM sports 

--Sports
INSERT INTO sports (sid, sportType)
    values('11', 'Baseball');
    
INSERT INTO sports(sid, sporttype)
    values('12', 'Football');

INSERT INTO sports(sid, sporttype)
    values('13', 'Hockey');

SELECT *
FROM brand
-- Brands
insert into Brand (bid, Name)
    values('1211', 'Topps');
    
insert into Brand (bid, Name)
    values('1121', 'Fleer');
    
insert into Brand (bid, Name)
    values('1112', 'Leaf');

insert into Brand (bid, Name)
    values('1111', 'O-Pee-Chee');

SELECT *
FROM teams

--teams
INSERT INTO teams (tid, sid, name)
    values('01', '11', 'Yankees');

INSERT INTO teams (tid, sid, name)
    values('02', '11','Indians');        

INSERT INTO teams (tid, sid, name)
    values('03', '11','Braves'); 

INSERT INTO teams (tid, sid, name)
    values('04', '11','Reds');     

INSERT INTO teams (tid, sid, name)
    values('05', '11','Athletics'); 

INSERT INTO teams (tid, sid, name)
    values('06', '12','Colts'); 

INSERT INTO teams (tid, sid, name)
    values('07', '12','Bears'); 

INSERT INTO teams (tid, sid, name)
    values('08', '12','Steelers'); 

INSERT INTO teams (tid, sid, name)
    values('09', '12','Dolphins'); 

INSERT INTO teams (tid, sid, name)
    values('10', '12','Cowbooys'); 

INSERT INTO teams (tid, sid, name)
    values('11', '13','Canadians'); 

INSERT INTO teams (tid, sid, name)
    values('12', '11','Brewers'); 

SELECT *
FROM people

--People
INSERT INTO people (pid ,irstname, lastname, tid)
    values('01', 'Dick','Butkis', '07'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('02', 'Ken','Dryden', '11'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('03', 'Tony','Dorsett', '10'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('04', 'Bob','Griese', '09'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('05', 'Joe','Green', '08'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('06', 'Johnny','Unitas', '06'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('07', 'Pete','Rose', '04'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('08', 'Reggie','Jackson', '05');

INSERT INTO people (pid ,irstname, lastname, tid)
    values('09', 'Hank','Aaron', '03'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('10', 'Johnny','Bench', '04'); 

INSERT INTO people (pid ,irstname, lastname, tid)
    values('12', 'Thurman','Munson', '01');


SELECT *
FROM cardset
--cardset
INSERT INTO cardset (setID ,bid, year)
    values('01', '1211', '1970');
    
INSERT INTO cardset (setID ,bid, year)
    values('02', '1121', '1970');

INSERT INTO cardset (setID ,bid, year)
    values('03', '1112', '1970');

INSERT INTO cardset (setID ,bid, year)
    values('04', '1111', '1970');


INSERT INTO cardset (setID ,bid, year)
    values('05', '1211', '1971');
    
INSERT INTO cardset (setID ,bid, year)
    values('06', '1121', '1971');

INSERT INTO cardset (setID ,bid, year)
    values('07', '1112', '1971');

INSERT INTO cardset (setID ,bid, year)
    values('08', '1111', '1971');


INSERT INTO cardset (setID ,bid, year)
    values('09', '1211', '1972');
    
INSERT INTO cardset (setID ,bid, year)
    values('10', '1121', '1972');

INSERT INTO cardset (setID ,bid, year)
    values('11', '1112', '1972');

INSERT INTO cardset (setID ,bid, year)
    values('12', '1111', '1972');


INSERT INTO cardset (setID ,bid, year)
    values('13', '1211', '1973');
    
INSERT INTO cardset (setID ,bid, year)
    values('14', '1121', '1973');

INSERT INTO cardset (setID ,bid, year)
    values('15', '1112', '1973');

INSERT INTO cardset (setID ,bid, year)
    values('16', '1111', '1973');


INSERT INTO cardset (setID ,bid, year)
    values('17', '1211', '1974');
    
INSERT INTO cardset (setID ,bid, year)
    values('18', '1121', '1974');

INSERT INTO cardset (setID ,bid, year)
    values('19', '1112', '1974');

INSERT INTO cardset (setID ,bid, year)
    values('20', '1111', '1974');


INSERT INTO cardset (setID ,bid, year)
    values('21', '1211', '1975');
    
INSERT INTO cardset (setID ,bid, year)
    values('22', '1121', '1975');

INSERT INTO cardset (setID ,bid, year)
    values('23', '1112', '1975');

INSERT INTO cardset (setID ,bid, year)
    values('24', '1111', '1975');


INSERT INTO cardset (setID ,bid, year)
    values('25', '1211', '1976');
    
INSERT INTO cardset (setID ,bid, year)
    values('26', '1121', '1976');

INSERT INTO cardset (setID ,bid, year)
    values('27', '1112', '1976');

INSERT INTO cardset (setID ,bid, year)
    values('28', '1111', '1976');    


INSERT INTO cardset (setID ,bid, year)
    values('29', '1211', '1977');
    
INSERT INTO cardset (setID ,bid, year)
    values('30', '1121', '1977');

INSERT INTO cardset (setID ,bid, year)
    values('31', '1112', '1977');

INSERT INTO cardset (setID ,bid, year)
    values('32', '1111', '1977');


INSERT INTO cardset (setID ,bid, year)
    values('33', '1211', '1978');
    
INSERT INTO cardset (setID ,bid, year)
    values('34', '1121', '1978');

INSERT INTO cardset (setID ,bid, year)
    values('35', '1112', '1978');

INSERT INTO cardset (setID ,bid, year)
    values('36', '1111', '1978');


INSERT INTO cardset (setID ,bid, year)
    values('37', '1211', '1979');
    
INSERT INTO cardset (setID ,bid, year)
    values('38', '1121', '1979');

INSERT INTO cardset (setID ,bid, year)
    values('39', '1112', '1979');

INSERT INTO cardset (setID ,bid, year)
    values('40', '1111', '1979');

--for johnny bench!
INSERT INTO cardset (setID ,bid, year)
    values('41', '1211', '1968');
    
INSERT INTO cardset (setID ,bid, year)
    values('42', '1121', '1968');

INSERT INTO cardset (setID ,bid, year)
    values('43', '1112', '1968');

INSERT INTO cardset (setID ,bid, year)
    values('44', '1111', '1968');



 

    
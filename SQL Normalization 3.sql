--Michael Sanzo
--DBMS
--11/11/2016
-- Lab 9: Normalization Three

-- Weak entities
drop table if exists engineers;
drop table if exists astronauts;
drop table if exists fco;
drop table if exists crew;
drop table if exists systemsINspace;
drop table if exists partsINsystems;
drop table if exists catalog;

-- Strong entities
drop table if exists people;
drop table if exists jobtype;
drop table if exists spacecraft;
drop table if exists systems;
drop table if exists parts;
drop table if exists vendors;

-- Person details
create table people
(
	pid		char(4) not null,
	firstName	text,
	lastName	text,
	age		integer,
	primary key(pid)
);


-- Engineers
create table engineers
(
	pid		char(4) not null references person(pid),
	highestDegree	text,
	favVideogame	text,
	primary key(pid)
);


-- Astronauts
create table astronauts
(
	pid		char(4) not null references person(pid),
	experiance	integer,
	handicap	integer,
	primary key(pid)
);


-- Flight Control Operators
create table flightcontroloperators
(
	pid		char(4) not null references person(pid),
	chairtype	integer,
	favdrink	text,
	hangcure	text,
	primary key(pid)
);


-- Job Types
create table jobtype
(
	jid		char(4) not null,
	name 		text,
	description	text,
	primary key(jid)
);


-- Spacecraft
create table spacecraft
(
	spaceID		char(4) not number,
	name 		text,
	tailnum		integer,
	tonweight	integer,
	fuel		text,
	capacity	integer,
	primary key(spaceID)	
);

-- Systems
create table systems
(
	sysID			char(6) not null,
	name 			text,
	description		text,
	costUSD			integer,
	primary key(sysID)
);

-- Parts
create table parts
(
	partID		char(7) not null,
	name 		text,
	description	text,
	costUSD		integer,
	primary key(partID)
);

-- Suppliers
create table suppliers
(
	vendorID	char(7) not null,
	name 		text,
	address		text,
	primary key(vendorID)
);
-- Area Codes
create table area codes
(
	zip		char(7) not null,
	state		text,
	city		text,
	primary key(zip)
);

-- Crew
create table crew
(
	pid		char(4) not null references person(pid),
	jid		char(4) not null references jobtype(jid),
	sid		char(4) not null references spacecraft(spaceID),
	primary key(pid, jid, spaceID)
);

-- Systems In Spacecrafts
create table systemsINspace
(
	sid 		char(4) not null references spacecraft(spaceID),
	systemID	char(6) not null references systems(systemID),
	primary key(spaceID, sysID)
);

-- Parts In Systems
create table partsInSystems
(
	systemID	char(6) not null references systems(systemID),
	partID		char(7) not null references parts(partID),
	primary key(systemID, partID)
);

-- Catalog of suppliers and their parts
create table catalog
(
	vendorID	char(7) not null references suppliers(suppID),
	partID		char(7) not null references parts(partID),
	primary key(vendorID, partID)
);

--Inserts

-- People
insert into person(pid, firstName, lastName, age)
	values('p001', 'Mike', 'S', 20);
insert into person(pid, firstName, lastName, age)
	values('p002', 'Alan', 'L', 30);
insert into person(pid, firstName, lastName, age)
	values('p003', 'Pete', 'R', 40);
	
-- Engineers
insert into engineers(pid, highestDegree, favVideoGame)
	values('p001', 'Masters', 'Call Of Duty');

-- Astronauts
insert into astronauts(pid, experiance, golfHandicap, spouse)--we see correlation with handicap and experiance
	values('p002', 20, 20, yes);

-- Flight Control Ops
insert into flightcontroloperators(pid, chairtype, favdrink)
	values('p003', 7, 'Gin and Tonic');

-- Job Types
insert into jobType(jid, role, description)
	values('j001', 'Engineer', 'Change the World with their Minds');
insert into jobType(jid, name, description)
	values('j002', 'Astronaut', 'Spacewars IV created strong demand for these');
insert into jobType(jid, name, description)
	values('j003', 'Flight Control Operator', 'We just like to drink');

-- Spacecraft
insert into spacecraft(spaceID, name, tailNumber, weightInTons, fuelType, crewCapacity)
	values('sp001', 'Harambe', 007, 1000, 'VP C16 Race Fuel', 20);

-- Systems
insert into systems(sysID, name, description)
	values('system001', 'Passenger Eject', 'For the Interns');
insert into systems(sysID, name, description)
	values('system002', 'Subwoofer', 'Bump bumps');

-- Parts
insert into parts(partID, name, description)
	values('part001', 'Seat', 'Bucket');
insert into parts(partID, name, description)
	values('part002', 'Speaker', 'Sound');

-- Suppliers
insert into suppliers(vendorID, name, address,)
	values('vend001', 'CCC', '1 Riverview St',);--custom control concepts, but just want music

-- Crew
insert into crew(pid, jid, spaceID)
	values('p002', 'j002', 'sp001');

-- Systems In Spaceships
insert into systemsInSpacecrafts(spaceID, sysID)
	values('sp001', 'system001');
insert into systemsInSpacecrafts(spaceID, sysID)
	values('sp001', 'system002');

-- Parts In Systems
insert into partsInSystems(sysID, partID)
	values('system001', 'part001');
insert into partsInSystems(sysID, partID)
	values('system002', 'part002');

-- Catalog of suppliers and their parts
insert into catalog(vendorID, partID)
	values('vend001', 'part001');
insert into catalog(vendorID, partID)
	values('vend001', 'part002');
set termout on
prompt Building sample beer rating database.  Please wait ...
set feedback on
--set echo on

drop table Ratings;
drop table Beer;
drop table BeerStyle;
drop table Brewer;
drop table Taster;
drop table Location;

create table Location (
	id          integer primary key,
	state       varchar(50),  -- not every country has states
	country     varchar(50) not null
);

create table Taster (
	id          integer  primary key,
	family      varchar(30),  -- some people have only one name
	given       varchar(30),  
	livesIn     integer not null references Location(id)
);

create table Brewer (
	id          integer primary key,
	name        varchar(50) not null,
	locatedIn   integer not null references Location(id)
);

create table BeerStyle (
	id          integer primary key,
	name        varchar(30) not null
);

create table Beer (
	id          integer primary key,
	name        varchar(50) not null,
	style       integer not null references BeerStyle(id),
	brewer      integer not null references Brewer(id)
);

create table Ratings (
	taster      integer not null references Taster(id),
	beer        integer not null references Beer(id),
	score       integer not null
	            constraint validRating
		    check (score >= 1 and score <= 5)
);


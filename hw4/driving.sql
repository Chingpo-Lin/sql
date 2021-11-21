CREATE TABLE InsuranceCo (
   name varchar(20) PRIMARY KEY, 
   phone int);

CREATE TABLE Vehicle (
   licensePlat varchar(30) PRIMARY KEY,
   vssn int REFERENCES Person(ssn),
   vname varchar(20) REFERENCES InsuranceCo(name),
   year int,
   maxLiability real);

CREATE TABLE Person (
   ssn int PRIMARY KEY, 
   name varchar(20));

CREATE TABLE Driver (
   driverID int,
   dssn int REFERENCES Person(ssn), 
   PRIMARY KEY(dssn));

CREATE TABLE NonProfessionalDriver (
   ndssn int REFERENCES Driver(dssn), 
   PRIMARY KEY(ndssn));

CREATE TABLE ProfessionalDriver (
   medicalHistory varchar(20),
   pdssn int REFERENCES Driver(dssn), 
   PRIMARY KEY(pdssn));

CREATE TABLE Car (
   make varchar(30),
   clicensePlat varchar(30) REFERENCES Vehicle(licensePlat),
   PRIMARY KEY(clicensePlat));

CREATE TABLE Truck (
   capacity int,
   tlicensePlat varchar(30) REFERENCES Vehicle(licensePlat),
   tpdssn int REFERENCES ProfessionalDriver(ndssn),
   PRIMARY KEY(tlicensePlat));

CREATE TABLE Drives (
	dclicensePlat varchar(30) REFERENCES Car(clicensePlat),
	dndssn int REFERENCES NonProfessionalDriver(ndssn),
	PRIMARY KEY(dclicensePlat, dndssn));

/*
Q2: Vehicle table, because insure is many to one between vehicle and InsuranceCo,
then we can use reference key in vehicle to represent that relationship, because we 
only need one more column in vehicle table to express that insuranceCo.

Q3: For drives, I wrote an extra table, but I didn't do that for operates. This is because
Drives is many to many, so we need an extra table to build that relations for two tables related
to Drives. However, in operates, many to one relation can to simplify to a reference written in "many"
table, and the reason is written in Q2.
*/
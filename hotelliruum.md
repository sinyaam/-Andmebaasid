## Andmebaas Hotelliruumi reserveerimine
CTRL + E
```sql
CREATE DATABASE hotelliruum;
USE hotelliruum;
--1.guest
CREATE TABLE guest(
guestID int PRIMARY KEY identity(1,1),
first_name varchar(80),
last_name varchar(80) NOT NULL,
member_since DATE);

INSERT INTO guest
VALUES ('Ivan','Sereda','2000-05-05'),
('Maksim','Avinov','2001-01-13'),
('Anton','Buketov','1984-03-06');

<img width="303" height="80" alt="{BD8A7D1F-9BFF-406B-9B10-879BB8A9930A}" src="https://github.com/user-attachments/assets/86c5d956-b3e1-4d19-8723-315d53402e86" />


--2.reservation
CREATE TABLE reservation(
reservationID int PRIMARY KEY identity(1,1),
date_in DATE,
date_out DATE,
made_by varchar(20),
guestID int,
FOREIGN KEY (guestID) REFERENCES guest(guestID));

INSERT INTO reservation
VALUES ('2003-06-07','2003-06-08','admin',1),
('2008-03-06','2008-04-06','admin',2),
('2026-08-09','2026-09-09','admin',3);

<img width="367" height="77" alt="{0C01DE6B-61DE-4D72-9696-CB8D25685AF9}" src="https://github.com/user-attachments/assets/29692953-b4d9-425c-a35f-512f613ef4fc" />

--3.room_type
CREATE TABLE room_type(
room_typeID int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);

INSERT INTO room_type
VALUES ('vip',4),
('basic',1),
('double',2);

<img width="262" height="78" alt="{E98A7688-10EB-48F7-A571-A6280CDFED41}" src="https://github.com/user-attachments/assets/956a8b1e-7cb1-46f6-a7cb-76a1afeccd6d" />

--4.room
CREATE TABLE room(
roomID int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_typeID int,
FOREIGN KEY (room_typeID) REFERENCES room_type(room_typeID));

INSERT INTO room
VALUES ('1','room1','reserved',1,1),
('2','room2','ready',0,2),
('3','room3','reserved',0,3);

<img width="361" height="99" alt="{95731333-5A7B-413B-A2C6-DF8788EF20F9}" src="https://github.com/user-attachments/assets/191de266-e4bc-4c62-a527-b589ca07d1e3" />

```


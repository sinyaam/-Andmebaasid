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

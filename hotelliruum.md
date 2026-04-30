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

<img width="301" height="81" alt="{891434A4-9E86-47AB-8A01-157E62BC7246}" src="https://github.com/user-attachments/assets/437d378c-b8d4-4ff0-aeaa-af261d8bbb80" />

--2.reservation

## Andmebaasid
 Andmebaasidega seotud SQL kood ja konspetkid
## Põhimõisted
- andmebaas - struktureeritud andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *столбец
- rida = kirje - записи
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB /XAMPP , SQL SERVER management Studio.
- <img width="409" height="434" alt="{649C7436-6A4B-4591-9ABC-B3610E8B6F2C}" src="https://github.com/user-attachments/assets/fb308232-1b05-4c8c-9bdd-69ec309025b0" />

- primaarne võti - PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY -FK- veerg ,mis loob seos teise tabeli primaarvõtmega.
- päring - QUERY - запрос

## Andmetüübid
```
1. Numbrilised: INT, Smallint, float ,decimal(5,2)
2. Tekst/sümboolised: varchar(255), chat(5), TEXT
3. Loogilised: boolean, true/false, bit, bool
4. Kuupäeva: date, time, datetime
```
## SQL - structure Query Language - struktureeritud päringu keel
- Tabeli loomine
```sql
 CREATE TABLE opilane(
 opilaneID int Primary Key identity(1,1), --automaatselt täidab numbritega
 eesnimi varchar(25),
 perenimi varchar(30) NOT NULL,
 synniaeg DATE,
 stip bit,
 mobiil varchar(13),
 aadress TEXT,
 keskmineHinne decimal(2,1) );--(2--kokku, 1- peale komat nt 4.5)

 SELECT * FROM opilane;
 ```
- Andmete sisestamine
```sql
TRUNCATE TABLE opilane;

INSERT INTO opilane
VALUES ('Artjom','Jegorov', '2000-12-10',1,'+325689','Tallinn', 4.5);
INSERT INTO opilane(perenimi,eesnimi,keskmineHinne)
VALUES ('Merkulova','Irina', 4.2),
('Holovanov','Ivan', 4.2),
('Sereda','Ivan', 4.2),
('Suvorov','Marko', 5.0)
SELECT * FROM opilane;
```

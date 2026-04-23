## Andmebaasid
 Andmebaasidega seotud SQL kood ja konspetkid
## Sisukord
- [Põhimõisted](#pohimoisted)
- [Andmetüübid](#andmetüübid)
- [SQL-structure Query Language](#SQL-structure-Query-Language)
 
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
## SQL-structure Query Language - struktureeritud päringu keel
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
## Seosed (tabelivahelised seosed)
- üks-ühele (nt mees-naine)
- üks-mitmele (nt ema-lapsed)
- <img width="228" height="500" alt="{DD22C28F-37B1-40BF-B068-F68D202FE842}" src="https://github.com/user-attachments/assets/cdc8fa3a-2ca5-4a6f-83e2-171ade37dc0e" />
- mitu-mitmele (nt õpilased - õpetajad)
## PIIRANGUD
constraint - ограничения (5)
1. PRIMARY KEY
2. FORIEGN KEY
3. CHECK
4. NOT NULL
5. UNIQUE
```sql
--FOREIGN KEY
CREATE TABLE opetamine(
opetamineID int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneID int,
FOREIGN KEY (opilaneID) REFERENCES opilane(opilaneID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilane;
INSERT INTO opetamine
VALUES ('2026-04-16','andmebaasid', 1, 4)
```
## ALTER TABLE
-tabeli struktuuri muutmine (struktuur: veerudenimed, andmetüübid, piirangud)
```sql
--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübi muutmine varchar(11)-->char(11)

ALTER TABLE opilane ALTER COLUMN isikukood char(11);

--sisseehitatud protseduur, mis näitab tabeli

sp_help opilane;
```
```sql
--PK lisamine
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);
--UNIQUE lisamine
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontrollimiseks täidame tabelit ryhm
SELECT * FROM ryhm;
INSERT INTO ryhm
VALUES(2, 'TITpe24');

--lisamine FOREIGN KEY - võõrvõti-välisvõti
ALTER TABLE opilane ADD ryhmId int;
SELECT * FROM opilane;
SELECT * FROM ryhm;
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmId) REFERENCES ryhm(ryhmId);

INSERT INTO opilane
VALUES ('Leeno','Jegorova', '2000-12-10',1,'+325689','Tartu', 4.5,
'5667777',2);
```

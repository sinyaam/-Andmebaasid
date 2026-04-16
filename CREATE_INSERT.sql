# AndmebaasidTITpv24
andmebaasidega seotud SQL kood ja konspektid
## Põhimõisted
- andmebaas - struktureetitud andmete kogum
- tabel = olem - сущность - entity
- veerg = väli - поле - столбец
- rida = kirje - записи
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER management Studio.
<img width="465" height="510" alt="{7C64C2A3-7A91-4FBB-8346-74933FE65CE4}" src="https://github.com/user-attachments/assets/a991477f-5e9b-4027-aed9-eac3a8f62587" />

- primaarne võti - PRIMARY KEY - veerg (tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
-  välisvõti - FOREIGN KEY - FK - veerg, mis loob seos teise tabeli primaarvõtmega.
- päring - QUERY - запрос

## Andmetüübid
```
1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümboolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false, bit, bool
4. Kuupäeva: date, time, datetime
```

## SQL - sturcture Query language - struktureetitud päringu keel 
- Tabeli loomine
```sql
CREATE DATABASE TITPV24baas;
--ab kustutamine
DROP DATABASE LOGITpv24baas;
use TITPV24baas;
--tabeli loomine
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1), --automaatselt täidab numritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) )
SELECT * FROM opilane;
```
- Andmete sisetamine
```sql
INSERT INTO opilane
VALUES ('Marko', 'Suvorov', '2007-07-06',1,'+37266262412', 'Tallinn', 4.5)
INSERT INTO opilane(perenimi,eesnimi,keskmineHinne)
values('Suvorov', 'Marko', 4.2),
('Jegorov', 'Artjom', 4.2),
('Vasylenko', 'Vasilisa', 2),
('Talibova', 'Leila', 2);
```

## SEOSED
- üks-ühele (nt mees-naine)
- üks-mitmele (nt ema-lapsed)
<img width="223" height="489" alt="{B9182944-284F-46E8-8C16-39DECC36AF26}" src="https://github.com/user-attachments/assets/cff14ab8-b20e-4f18-90e6-90e2318251de" />

- mitu-mitmele (nt õpilased - õpetajad)

## Piirangud
- constraint - ограничения
1. PRIMARY KEY
2. FOREIGN KEY
3. CHECK
4. NOT NULL
5. UNIQUE

```sql
CREATE TABLE opitamine(
opetamineID int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneID int,
FOREIGN KEY (opilaneID) REFERENCES opilane(opilaneID),
hinne int CHECK(hinne<=5));

SELECT * FROM opitamine;
SELECT * FROM opilane;

INSERT INTO opitamine
VALUES ('2026-04-16', 'andmebaasid', 1, 5)
```
CREATE TABLE opetaja(
opetajaID int PRIMARY KEY identity(1,1),
nimi varchar(25),
epost varchar(40),
ruum varchar(15) )

SELECT * FROM opetaja;

-- LISAMINE nimi, epost ja ruum tabelisse "opetaja"
INSERT INTO opetaja (nimi, epost, ruum)
VALUES ('Lury Avik', 'luryavik@tthk.ee', 'A243'),
('Markus Lehtla', 'markuslehtla@tthk.ee', 'A116'),
('Irina Merkulova', 'irinamerkulova@tthk.ee', 'E03');

--LISAME TABEL TUND
CREATE TABLE tund(
tundID int PRIMARY KEY IDENTITY(1,1),
kuupaev DATE,
tundinimi varchar(30),
opetajaID int,
FOREIGN KEY (opetajaID) REFERENCES opetaja(opetajaID),
opetamineID int,
FOREIGN KEY (opetamineID) REFERENCES opitamine(opetamineID) )

SELECT * FROM tund;
--LISAME kuupaev, tundinimi, opetajaID ja opetamineID tabelisse
insert INTO tund(kuupaev, tundinimi, opetajaID, opetamineID)
VALUES ('2023-04-15', 'Linux', 1, 1),
('2023-04-16', 'Arvutivõrgud', 2, 2),
('2023-04-17', 'Andmebaasid', 3, 3);

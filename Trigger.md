## TRIGGER - triger - pööstik 
- andmedaasi objekt, mis  automatselt  käivitud tabel sündmused ( INSERT , UPDATE, DELETE).


```sql
create database trigerISTITpv24;

use trigerISTITpv24;

	

Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

 --tabel , mis täidab triger


Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
kasutaja varchar(25),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT  -- triger automatselt lisab mida sekretaar lisas/kustutas tabelisse linnad
);

select * from linnad;
select * from logi;


--Trigger lisatud kirjeid jälgimiseks tabelis “linnad” – INSERT
--Jälgib andmete sisestamine tabelis linnad ja teeb vastava kirje tabelis logi

CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, -- kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;


--kontrollimiseks Insert into linnad
Insert into linnad(linnanimi, rahvaarv)
values ('Tartu',250000);


-- triger muutmine 
Alter TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, -- kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming 
CONCAT('linn: ',  inserted.linnanimi , ' rahvaarv: ', inserted.rahvaarv )--andmed
FROM inserted;

Insert into linnad(linnanimi, rahvaarv)
values ('Pärnu',50000);

select * from linnad;
select * from logi;
```
- <img width="601" height="494" alt="{00279FE3-A6A3-4C74-834F-B0FF4E607758}" src="https://github.com/user-attachments/assets/b08eeb83-6363-4beb-9ece-f78feb2c428f" />

- <img width="595" height="227" alt="{6AF43BD6-4B89-46CD-BDB9-6F4871D84CB3}" src="https://github.com/user-attachments/assets/9dd6c44b-37f0-4764-9b26-8d2ea8c2c5b3" />



## XAMPP TRIGGER

## LISAMINE

- <img width="591" height="435" alt="{3ACF05BF-4006-4073-BF3B-26774A80E22C}" src="https://github.com/user-attachments/assets/482d175f-872a-4d6a-9eea-77fb25481c00" />


- <img width="769" height="267" alt="{6B1366EA-D74E-443F-8F6B-474D1CF5BDBA}" src="https://github.com/user-attachments/assets/bff1cddd-476a-41ab-b36b-3fa457ffc397" />



## KUSTUTAMINE

- <img width="613" height="667" alt="{F31C000A-695B-40D0-8C08-C3AB4CD3A71B}" src="https://github.com/user-attachments/assets/27decaee-6b5a-48eb-bbe4-9de626f16a7c" />

- <img width="812" height="309" alt="{4BC136AA-C2B9-436D-B199-55EDF791F7CF}" src="https://github.com/user-attachments/assets/d4c734f8-fd84-4f5c-8437-bd8b04f84d83" />

## UPDATE

- <img width="640" height="672" alt="{72375FC0-C87F-480C-89E0-71E8FAD4A784}" src="https://github.com/user-attachments/assets/6263b37d-b3d6-4825-b465-d3bd413a076b" />


- <img width="825" height="242" alt="{F68E8EA9-18C1-4F0E-9654-CCB7A68FAE1B}" src="https://github.com/user-attachments/assets/0ff55c05-5303-46ef-9d8d-367109136396" />

## KONTROLIMINE sekretarIvan

- <img width="969" height="329" alt="{A47A925A-9D2E-41C7-A260-7A3729692525}" src="https://github.com/user-attachments/assets/ef11b42f-ca85-4e3c-8572-375a02c06646" />

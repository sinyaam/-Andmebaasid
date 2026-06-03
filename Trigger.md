## Trigger - triger -päästik
- andmebaasi objekt, mis automaatselt käivitud tabeli sündmused (INSERT, UPDATE, DELETE).

```sql
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
andmed TEXT --triger automaatselt lisab mida sekretaar lisas/kustutas tabelisse linnad
)

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
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;

--kontrollimiseks Insert into linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Tartu', 250000);

select * from linnad;
select * from logi;

--trigeri muutmine
ALTER TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
CONCAT('linn: ', inserted.linnanimi , ' rahvaarv: ', inserted.rahvaarv) --andmed
FROM inserted;

INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Pärnu', 50000);

select * from linnad;
select * from logi;
```
<img width="693" height="642" alt="{F6A3BE9B-CBCD-40C6-898B-319D0597ABF0}" src="https://github.com/user-attachments/assets/48e14334-0586-411c-a7a6-7e0ce16c6063" />
### kustutamise triger

```sql
CREATE TRIGGER kustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR DelEte
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud DELETE käsk',  --toiming
CONCAT('linn: ', deleted.linnanimi , ', rahvaarv: ', deleted.rahvaarv) --andmed
FROM deleted;

--kontroll kustutamine
DELETE from linnad where linnID=1;

SELECT * FROM linnad;
SELECT * FROM logi;
```

<img width="683" height="210" alt="{02395B8F-8110-442F-8766-43112642B3E2}" src="https://github.com/user-attachments/assets/6f656c2b-9ff2-44b7-bc72-4a73f52edac1" />

 ### triger update 

 ```sql
CREATE TRIGGER linnaUUendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR UPDATE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER,
GETDATE(),  --aeg
'on tehtud UPDATE käsk',  --toiming
CONCAT('VANAD: linn: ', deleted.linnanimi , ', rahvaarv: ', deleted.rahvaarv,
'||| UUED: linn: ', inserted.linnanimi , ', rahvaarv: ', inserted.rahvaarv) --andmed
FROM deleted INNER JOIN inserted
on deleted.linnID=inserted.linnID;

--kontroll uuendamine

update linnad set linnanimi='Narva-väike', rahvaarv=50 where linnID=2

SELECT * FROM linnad;
SELECT * FROM logi;
 ```

<img width="941" height="246" alt="{51FDB3A2-E975-4F8C-9420-D4BFF56E009B}" src="https://github.com/user-attachments/assets/f6f1d990-ef1d-46c1-bb3e-c7ad86e5bff8" />

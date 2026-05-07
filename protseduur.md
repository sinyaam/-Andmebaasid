## protseduurid
- store procedure - salvestatud protseduurid - хранимые процеуедуры
- sama nagu funktsioonid programmerimises - mingid tegevused mis käivitakse automaatselt protseduuri kasutamisel

```sql
--protseduur , mis lisab uus guest ja kuvab tabeli

create procedure lisaGuest
--@parameetrid
@uusNimi varchar(25),
@uusPerenimi varchar(30),
@kuupaev date
AS
BEGIN

--protseduuri sisu

insert into guest(first_name, last_name, member_since)
values (@uusNimi, @uusPerenimi, @kuupaev);
SELECT * FROM guest;

end
```
<img width="235" height="181" alt="{60A081E4-4269-4EE2-813F-036EC8DCB02E}" src="https://github.com/user-attachments/assets/876da755-01f0-4e2d-b5ca-5bf21e643de7" />

<img width="451" height="199" alt="{A7CD51E7-82D1-4693-B382-50E052CBB211}" src="https://github.com/user-attachments/assets/c0c76d4b-9233-42e1-abab-fe93281a0848" />

<img width="435" height="106" alt="{EF38F834-72D8-4C47-B4A6-0501B60ED64E}" src="https://github.com/user-attachments/assets/bceb9066-df03-43db-8c68-f00238705126" />

--protseduur, mis kutustab guest id järgi
```sql
create procedure kustutaGuest
@kustutaID int
AS
BEGIN
	SELECT * FROM guest;
	delete from guest WHERE guestID=@kustutaID;
	SELECT * FROM guest;
END

--kutse

EXEC kustutaGuest 1;

```
<img width="491" height="411" alt="{1ED52024-2817-4404-BACE-BC0B867CF21D}" src="https://github.com/user-attachments/assets/e1cac7ac-d9db-4f1a-b670-67584d88a6fa" />

--otsinig esimese tähe järgi 
```sql
CREATE PROCEDURE otsing1taht
@taht char(1)
AS
BEGIN
	SELECT * FROM guest WHERE first_name LIKE @taht + '%'; --% -teised sümboolid

END
--kutse
EXEC otsing1taht 'A'
```

<img width="464" height="184" alt="{EB5A8C8C-A32B-418D-A925-4C4D9D087A50}" src="https://github.com/user-attachments/assets/4427a61c-3498-4619-b95e-8d97916831fe" />


--lisamine uus veerg
```sql 
ALTER TABLE guest ADD arveSumma money;
SELECT * FROM guest;

update guest set arveSumma=2500 WHERE guestID=2
update guest set arveSumma=1000 WHERE guestID=3
update guest set arveSumma=4800 WHERE guestID=4

SELECT * FROM guest;
```

<img width="439" height="307" alt="{8AE308FE-5925-4A09-9F54-1F3E03B3884C}" src="https://github.com/user-attachments/assets/c23afac0-3b13-46fb-8f27-8c6bc18f519e" />


--5. OUTPUT parameetrid (min ja max väärtus)
```sql
--5. OUTPUT parameetrid (min ja max väärtus)
CREATE PROCEDURE minmaxArve
    @minArve MONEY OUTPUT,
    @maxArve MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minArve = MIN(arveSumma),
        @maxArve = MAX(arveSumma)
    FROM guest;
END;

-- kutse
DECLARE @minArve MONEY , @maxArve MONEY;
EXEC minmaxArve @minArve OUTPUT, @maxArve OUTPUT;
PRINT 'Min arve = ' + CONVERT(varchar, @minArve);
PRINT 'Max arve = ' + CONVERT(varchar, @maxArve);
```
<img width="448" height="440" alt="{AF6C1058-079D-49C4-BB5F-CFAE0E66D4E7}" src="https://github.com/user-attachments/assets/6d2f9012-7a5f-4884-a257-f8d0a2345919" />


--6. Dünaamiline SQL protseduuris (ALTER TABLE)
--Protseduur veeru lisamiseks või kustutamiseks 
```sql
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;
--KUTSU
-- veeru lisamine
EXEC muudatus 'add', 'guest' , 'testVeerg' ,int
SELECT * FROM guest;
EXEC muudatus 'drop','guest' , 'testVeerg' ,int
```
<img width="503" height="202" alt="{881C6842-08DF-465C-BAE5-7F5BC42F638B}" src="https://github.com/user-attachments/assets/07af502e-2815-4e24-b180-bb7459ff249f" />

<img width="497" height="213" alt="{C46CD038-A01A-40F1-BE55-F44061A8F8E9}" src="https://github.com/user-attachments/assets/8bde7a20-3133-4ba6-9667-ef57519e447b" />

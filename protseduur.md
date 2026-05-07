## SQL Protseduurid
- store procedure - salvestatud protseduurid -хранимые процедуры
- sama nagu funktsioonid programmeerimises - mingid tegevused,  mis käivitakse automaatselt protseduuri kasutamisel.
```sql
CREATE PROCEDURE lisaGuest
--@parameetrid
@uusNimi varchar(25),
@uusPerenimi varchar(30),
@kuupaev date
AS
BEGIN
--protseduuri sisu
	INSERT INTO guest(firstname, lastname, memberSince)
	VALUES (@uusNimi, @uusPerenimi, @kuupaev);
	SELECT * FROM guest;
END

```
<img width="296" height="298" alt="{581B72EB-D8B7-4A99-9F64-DA8A129DBE7D}" src="https://github.com/user-attachments/assets/c65ae188-fea0-4dd8-80a8-c2ad5caa3bf9" />
<img width="783" height="205" alt="{166DF029-E49F-4A2D-97CE-A81789FBFDF4}" src="https://github.com/user-attachments/assets/c91a133e-f114-4ce1-9865-fc36e0db208e" />

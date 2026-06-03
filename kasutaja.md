## Andmebaasid konspektid | Ivan

[Põhimõsted](README.md) | [Protseduurid;SQLSERVER](protseduur.md) | [Protseduurid;XAMPP](protseduurXAMPP.md) | [Triggerid](Trigger.md) | [hotelliruum](hotelliruum.md) | [kasutaja](kasutaja.md) | [keys](keys.md)

## õpetaja kasutaja.md konspekt
## Permissions of Fixed Database Roles (Database Engine)
<img width="612" height="770" alt="pilt" src="https://github.com/user-attachments/assets/fbe4c2d7-4e67-4e53-9e6b-60dbacec0758" />


## SQL Server – Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris?

### Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

SQL Serveris kasutatakse kahte peamist autentimise tüüpi:
1. Windows Authentication

Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

    Kasutajanimi ja parool on seotud Windowsiga
    Turvalisem lahendus
    Paroole haldab Windows
    Kasutaja ei pea eraldi SQL Serveri parooli teadma

2. SQL Server Authentication

Selle puhul luuakse kasutaja otse SQL Serverisse.

    Kasutaja ei ole seotud Windowsiga
    Määratakse eraldi kasutajanimi ja parool
    Sobib veebirakenduste jaoks

Näide kasutajast: DirectorNimi
Parool: director
Kasutaja loomine SQL Serveris

1. Serveritaseme kasutaja loomine (Login)
Sammud

Ava:

Security → Logins

Tee paremklikk ja vali:

New Login...

>>>>>pilt
<img width="708" height="658" alt="{26BCFB42-9F2A-41F1-A3BE-27D627F3209F}" src="https://github.com/user-attachments/assets/abdf07ac-9047-4bd5-82f2-8f6c4e423771" />



Harjutamiseks võib eemaldada linnukese:  User must change password at next login

Server Roles

Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public

>>>>>pilt
<img width="708" height="657" alt="{2B406888-8C21-42C4-A4B6-41195B1B96BF}" src="https://github.com/user-attachments/assets/bb17ca8f-5bbd-493d-859c-3dd50e8e165e" />


2. Andmebaasi kasutaja loomine (User)

Ava:

Database → Security → Users

Tee paremklikk:  New User...

Seosta kasutaja loginiga

>>>>>pilt
<img width="203" height="132" alt="{ADB847E3-E191-4826-B1DF-74A37563F38C}" src="https://github.com/user-attachments/assets/5e1d7cba-9fef-4eed-a1a1-afaf637234d2" />


Membership ja õigused

Menüüst Membership saab määrata kasutaja rollid.

    db_datareader → võib lugeda
    db_datawriter → võib kirjutada

>>>>>pilt

SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus

    Server → Properties
    Security
    Vali: SQL Server and Windows Authentication mode

GRANT käsud õiguste jagamiseks

GRANT käsuga antakse kasutajale õigused.
Käsk 	Tähendus
SELECT 	Lugemine
INSERT 	Lisamine
UPDATE 	Muutmine
DELETE 	Kustutamine

```sql 
-- õiguste määramine 
--GRANT -kasutaja õiguste lubamine - разришения прав пользователя 
--DENY -kasutaja õiguste keelamine keelamine - запрет

GRANT select on loomad to derektorIVAN;
GRANT insert on loomad to derektorIVAN;
GRANT select,insert on loomad to derektorIVAN;

DENY delete  on loomad to derektorIVAN;
```

>>>>>pilt
<img width="705" height="732" alt="{7E2EF4E6-7DE8-4C98-9E8E-EB49022EE7DC}" src="https://github.com/user-attachments/assets/f21fd517-5e3d-4c6c-9f33-18b26e4d873a" />

--derektorIVAN saab vaadata tabelisisu
<img width="800" height="361" alt="{E53EA7E3-DF3C-4662-B500-4F78C7655770}" src="https://github.com/user-attachments/assets/3fc8c01b-2375-4fc8-9b48-b7ef24ff46c8" />

--derectorIVAN saab lisada andmeid tabelisse loomad
<img width="721" height="651" alt="{C1488628-294D-4F7A-9C16-249C45B154F4}" src="https://github.com/user-attachments/assets/85f3cdd2-0036-4c7a-97fd-c802b04ac4fc" />

-- derektorIVAN ei saa kustutada tabelist 
<img width="811" height="675" alt="{DCAB01D7-EEBD-4D0D-A8FC-9479DEA96B83}" src="https://github.com/user-attachments/assets/5df16469-8ce8-4086-8247-032aff874a92" />

-- ei saa tabeleid luua

<img width="783" height="692" alt="{B05936E9-7279-40FF-B386-EC1E09082037}" src="https://github.com/user-attachments/assets/28e595e4-11e6-4c56-974b-3b4c03b7e557" />

--iga kasutaja ise saab kontrollida tamale määratud õigused
<img width="720" height="742" alt="{D5325D89-708E-4713-A275-345D3E6A3A37}" src="https://github.com/user-attachments/assets/df9b9b2f-73c0-4cc7-8816-62996e21c1d4" />

--uuendame vanus kus loomID=1

<img width="729" height="632" alt="{551D4C76-FA27-47E5-AF6B-579CA4807551}" src="https://github.com/user-attachments/assets/dd73977c-8f7d-4108-b321-1d3189a47c3b" />

<img width="811" height="231" alt="{D7256195-76FD-4C7A-B8BE-CDE45C99B452}" src="https://github.com/user-attachments/assets/011fa3d5-f5a5-47c7-b344-487197f77803" />




    

Ülesanne 1:

Luua andmebaas: MovieBase

Luua tabelid: 

    movies (id, moviesNimi, moviesYear, movieDir, movieCost).

    guest (id, name)

Lisada vähemalt 7 kirjet.

Luua kasutaja Produtsent parooliga director, kellel on järgmised õigused:

    Õigus vaadata ja uuendada tabeli movies välju movieDir ja movieCost + lisada üks enda valitud privileeg.
    Õigus vaadata ja lisada kirjeid tabelisse guest.
    Keela andmete kustutamine tabelis.

Vihje! UPDATE õigused parem lubada SQL käsuga
<img width="705" height="651" alt="{D78DE944-B7B6-4E28-82CE-EC880B81CED8}" src="https://github.com/user-attachments/assets/110a64d4-bb73-44fb-bf78-6dda6d9b4e19" />

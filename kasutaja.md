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

>>>>>pilt


    

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

GRANT UPDATE (movieCost, movieDir)
ON movies
TO Produtsent;
    ```sql
--õiguste määramine
--GRANT - kasutaja õiguste lubamine - разрешение прав пользователя
--DENY  - kasutaja õiguste keelamine - запрещение прав пользователя
GRANT SELECT ON loomad TO DirectorNimi;
GRANT INSERT ON loomad TO DirectorNimi;

DENY DELETE ON loomad to DirectorNimi;
```

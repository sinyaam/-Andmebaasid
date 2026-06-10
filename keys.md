## Andmebaasid konspektid | Ivan

[Põhimõsted](README.md) | [Protseduurid;SQLSERVER](protseduur.md) | [Protseduurid;XAMPP](protseduurXAMPP.md) | [Triggerid](Trigger.md) | [hotelliruum](hotelliruum.md) | [kasutaja](kasutaja.md) | [keys](keys.md)

# Andmebaasi võtmed

## Primary Key ehk primaarvõti

**Primary Key** on väli või väljade kombinatsioon, mis tuvastab iga tabeli rea üheselt.

Seda kasutatakse andmete unikaalseks tuvastamiseks.

Primaarvõtme omadused:

* väärtus peab olema unikaalne;
* väärtus ei tohi olla `NULL`;
* ühes tabelis saab olla ainult üks Primary Key.

Näide:

```sql
CREATE TABLE Opilane (
    opilane_id INT PRIMARY KEY,
    eesnimi VARCHAR(50),
    perenimi VARCHAR(50)
);
```
<img width="1178" height="611" alt="{BC71D378-8F7A-4461-90C0-A5D1B060F705}" src="https://github.com/user-attachments/assets/2cc0a418-11f8-42f2-98d2-6f3d2a9baf97" />

---

## Foreign Key ehk võõrvõti

**Foreign Key** on väli, mis viitab teise tabeli Primary Key-le.

Seda kasutatakse tabelite omavaheliseks sidumiseks ja andmete tervikluse tagamiseks.

Võõrvõti ei tuvasta kirjet iseseisvalt, vaid seob ühe tabeli teise tabeliga.

```
CREATE TABLE õppeklass (
õppeklassID int PRIMARY KEY IDENTITY(1,1),
number int,
opilane_id int
FOREIGN  KEY (opilane_id) REFERENCES Opilane(opilane_id));
```
<img width="303" height="332" alt="{095469EB-E608-4CE8-B789-48DC2702FEA6}" src="https://github.com/user-attachments/assets/01704125-8cca-432f-94ff-e710664dbc5e" />

---

## Unique Key

**Unique Key** tagab, et veerus olevad väärtused oleksid unikaalsed.

Seda kasutatakse korduvate väärtuste vältimiseks.

Erinevus Primary Key-st:

* tabelis võib olla mitu Unique Key-d;
* mõnes andmebaasis võib Unique Key lubada `NULL` väärtust.

Näide:

```sql
CREATE TABLE Kasutaja (
    kasutaja_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```
<img width="1256" height="342" alt="{4D76946C-1A4C-4C82-B5E6-CABF45CAB1B2}" src="https://github.com/user-attachments/assets/d472c9d4-ca64-4328-82e8-d3bc52a0e154" />

---


- ## Simple Key

Definitsioon: Simple Key koosneb ainult ühest veerust.

Milleks kasutatakse: Ühe väljaga rea leidmiseks.

Erinevus teistest võtmetest: Ei kasuta mitut veergu.

Kood:
```sql
CREATE TABLE Opilased (
    opilane_id INT PRIMARY KEY,
    nimi VARCHAR(50) --simple key
);
```

Ekraanipilt:

<img width="338" height="164" alt="{6B0A10B9-C4DF-4EA7-827A-056B3444DAD0}" src="https://github.com/user-attachments/assets/a863c761-6d6c-49af-b6b5-29fa5b5b37da" />

- ## Composite Key

Definitsioon: Composite Key koosneb kahest või enamast veerust.

Milleks kasutatakse: Kui üks veerg ei ole piisavalt unikaalne.

Erinevus teistest võtmetest: Unikaalsus tekib mitme välja kombinatsioonist.

Kood:
```sql
CREATE TABLE Hinded (
    opilane_id INT,
    aine_id INT,
    hinne INT,
    PRIMARY KEY (opilane_id, aine_id)
);
```

Ekraanipilt:

<img width="358" height="242" alt="{FC157605-CC85-49B7-95B6-779BB12800A5}" src="https://github.com/user-attachments/assets/0e863ec3-1404-4825-bf73-be2cb67477be" />

- ## Compound Key

Definitsioon: Compound Key on Composite Key liik, kus võtmes võivad olla ka Foreign Key väljad.

Milleks kasutatakse: Mitme tabeli andmete ühendamiseks.

Erinevus teistest võtmetest: Sisaldab tavaliselt vähemalt ühte Foreign Key välja.

Kood:
```sql
CREATE TABLE Tellimused (
    klient_id INT,
    toode_id INT,
    kogus INT,
    PRIMARY KEY (klient_id, toode_id)
);
```

Ekraanipilt:

<img width="350" height="225" alt="{5AF6F6B1-BA85-45DC-9FF1-556E1B33D1BD}" src="https://github.com/user-attachments/assets/d19790c8-f27f-4ba0-aa59-713ffa079828" />


- ## Superkey

Definitsioon: Superkey on üks või mitu välja, mis identifitseerivad rea unikaalselt.

Milleks kasutatakse: Ridade eristamiseks tabelis.

Erinevus teistest võtmetest: Võib sisaldada lisavälju rohkem kui vaja.

Kood:
```sql
CREATE TABLE TooTajad (
    tootaja_id INT,
    isikukood VARCHAR(11),
    email VARCHAR(100),
    UNIQUE (tootaja_id, email)
);
```

Ekraanipilt:

<img width="284" height="198" alt="{667A143A-02A6-46CC-822A-90F5605D8D49}" src="https://github.com/user-attachments/assets/f0aafd1b-facb-4b41-a380-83ca44455a8d" />

- ## Candidate Key

Definitsioon: Candidate Key on võimalik Primary Key kandidaat.

Milleks kasutatakse: Unikaalse rea leidmiseks.

Erinevus teistest võtmetest: Tabelis võib olla mitu Candidate Key-d, kuid ainult üks neist valitakse Primary Key-ks.

Kood:
```sql
CREATE TABLE Opetajad (
    opetaja_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    telefon VARCHAR(20) UNIQUE
);
```

Ekraanipilt:

<img width="300" height="211" alt="{E803D6E8-B069-4591-89A4-CF7F1996C84B}" src="https://github.com/user-attachments/assets/b83d99d9-ba80-48b0-8df7-1e7b64241f06" />


- ## Alternate Key

Definitsioon: Alternate Key on Candidate Key, mida ei valitud Primary Key-ks.

Milleks kasutatakse: Täiendava unikaalsuse tagamiseks.

Erinevus teistest võtmetest: See ei ole peamine võti, kuid on samuti unikaalne.

Kood:
```sql
CREATE TABLE Firmad (
    firma_id INT PRIMARY KEY,
    registrikood VARCHAR(20) UNIQUE
);
```
<img width="341" height="184" alt="{20ECDE2F-B6D2-4B06-87F8-5437F92CBB9E}" src="https://github.com/user-attachments/assets/abc38adb-1198-4aa1-90f6-c393be30c623" />

# Andmebaasi võtmed (Keys)

## Sissejuhatus

Andmebaasi võtmed (keys) on spetsiaalsed väljad või väljade kombinatsioonid, mida kasutatakse andmete unikaalseks tuvastamiseks ning tabelite vaheliste seoste loomiseks. Võtmed aitavad tagada andmete terviklikkust ja vältida vigade tekkimist andmebaasis.

---

# 1. Primary Key

## Definitsioon

Primary Key (primaarvõti) on väli või väljade kombinatsioon, mis identifitseerib iga tabeli kirje unikaalselt.

## Milleks kasutatakse

* Kirjete üheseks tuvastamiseks.
* Duplikaatide vältimiseks.
* Seoste loomiseks teiste tabelitega.

## Erinevus teistest võtmetest

Primary Key peab olema unikaalne ja ei tohi sisaldada NULL väärtusi.

## Näide

```sql
CREATE TABLE Opilased (
    OpilaneID INT PRIMARY KEY,
    Eesnimi VARCHAR(50),
    Perenimi VARCHAR(50)
);
```

**Lisa siia ekraanipilt tabeli loomise tulemusest.**

---

# 2. Foreign Key

## Definitsioon

Foreign Key (võõrvõti) on väli, mis viitab teise tabeli Primary Key väärtusele.

## Milleks kasutatakse

* Tabelite vaheliste seoste loomiseks.
* Andmete terviklikkuse tagamiseks.

## Erinevus teistest võtmetest

Foreign Key ei pea olema unikaalne ning selle väärtused peavad eksisteerima seotud tabelis.

## Näide

```sql
CREATE TABLE Kursused (
    KursusID INT PRIMARY KEY,
    Nimetus VARCHAR(100)
);

CREATE TABLE Registreerimine (
    RegistreerimineID INT PRIMARY KEY,
    OpilaneID INT,
    KursusID INT,
    FOREIGN KEY (KursusID) REFERENCES Kursused(KursusID)
);
```

**Lisa siia ekraanipilt loodud Foreign Key kohta.**

---

# 3. Unique Key

## Definitsioon

Unique Key tagab, et kõik väärtused veerus on unikaalsed.

## Milleks kasutatakse

* Duplikaatväärtuste vältimiseks.

## Erinevus teistest võtmetest

Erinevalt Primary Keyst võib sisaldada NULL väärtust (sõltuvalt andmebaasisüsteemist).

## Näide

```sql
CREATE TABLE Opetajad (
    OpetajaID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);
```

**Lisa siia ekraanipilt.**

---

# 4. Simple Key

## Definitsioon

Simple Key koosneb ainult ühest atribuudist.

## Milleks kasutatakse

* Kirjete unikaalseks identifitseerimiseks ühe veeru abil.

## Erinevus teistest võtmetest

Koosneb ainult ühest väljast.

## Näide

```sql
CREATE TABLE Raamatud (
    ISBN VARCHAR(20) PRIMARY KEY,
    Pealkiri VARCHAR(100)
);
```

**Lisa siia ekraanipilt.**

---

# 5. Composite Key

## Definitsioon

Composite Key koosneb kahest või enamast väljast, mis koos moodustavad unikaalse võtme.

## Milleks kasutatakse

* Kui üks väli eraldi ei taga unikaalsust.

## Erinevus teistest võtmetest

Koosneb mitmest atribuudist.

## Näide

```sql
CREATE TABLE Hinded (
    OpilaneID INT,
    KursusID INT,
    Hinne INT,
    PRIMARY KEY (OpilaneID, KursusID)
);
```

**Lisa siia ekraanipilt.**

---

# 6. Compound Key

## Definitsioon

Compound Key on Composite Key erijuht, kus kõik võtme osad on seotud välisvõtmetega.

## Milleks kasutatakse

* Seostabelites.

## Erinevus teistest võtmetest

Koosneb mitmest väljast, mis sageli viitavad teiste tabelite võtmetele.

## Näide

```sql
CREATE TABLE OpilaneKursus (
    OpilaneID INT,
    KursusID INT,
    PRIMARY KEY (OpilaneID, KursusID),
    FOREIGN KEY (OpilaneID) REFERENCES Opilased(OpilaneID),
    FOREIGN KEY (KursusID) REFERENCES Kursused(KursusID)
);
```

**Lisa siia ekraanipilt.**

---

# 7. Superkey

## Definitsioon

Superkey on üks või mitu atribuuti, mis võimaldavad kirje unikaalselt tuvastada.

## Milleks kasutatakse

* Kirjete identifitseerimiseks.

## Erinevus teistest võtmetest

Võib sisaldada üleliigseid atribuute.

## Näide

Tabelis Opilased:

| OpilaneID | Email |
| --------- | ----- |

Võimalikud supervõtmed:

* OpilaneID
* Email
* OpilaneID + Email

**Lisa näide SQL-i abil.**

---

# 8. Candidate Key

## Definitsioon

Candidate Key on minimaalne Superkey, mis identifitseerib kirje unikaalselt.

## Milleks kasutatakse

* Primary Key valimiseks.

## Erinevus teistest võtmetest

Ei sisalda üleliigseid atribuute.

## Näide

Tabelis:

```sql
CREATE TABLE Kasutajad (
    KasutajaID INT,
    Isikukood VARCHAR(11),
    Email VARCHAR(100)
);
```

Candidate Key'd võivad olla:

* KasutajaID
* Isikukood
* Email

---

# 9. Alternate Key

## Definitsioon

Alternate Key on Candidate Key, mida ei valitud Primary Keyks.

## Milleks kasutatakse

* Täiendava unikaalsuse tagamiseks.

## Erinevus teistest võtmetest

On kandidaatvõti, kuid mitte Primary Key.

## Näide

```sql
CREATE TABLE Kasutajad (
    KasutajaID INT PRIMARY KEY,
    Isikukood VARCHAR(11) UNIQUE,
    Email VARCHAR(100) UNIQUE
);
```

Siin:

* Primary Key = KasutajaID
* Alternate Key = Isikukood
* Alternate Key = Email

**Lisa siia ekraanipilt.**

---


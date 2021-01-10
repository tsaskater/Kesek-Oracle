# Feltöltés
## 1. Beszúrás automatizálása
Egyszerű [`C# kód`](./Beszurás%20automatizálása) ami lehetővé teszi hogy *tabulátorral tagolt* szöveges dokumentumokból kinyerjük a kellő adatokat a beszúráshoz.

A példában ez egy excel állományban lett kígyüjtve [`DATA.xlsx`](./DATA.xlsx)

#### A [C# kód](./Beszurás%20automatizálása) a példához három sql file-t generál
##### &emsp;&emsp; 1. [**CEDRIC_CUT_TESTS tábla beszúrás**](./cedric_insert.sql)
##### &emsp;&emsp; 2. [**BLADEHQ_ACEL_ERTEKELES tábla beszúrás**](./bladehq_insert.sql)
##### &emsp;&emsp; 3. [**KES_BOLT tábla beszúrás**](./bladehq_insert.sql)

> ###  Ez a kód jelenleg csak egy segédlet. Több sql alkalmazás lehetővé teszi az xlsx, txt és egyéb állományokból törétnő adatbevitelt. 
>> A későbbiekben ezt a kódót "felhasználó barátabbá" lehet tenni ezekkel a pontokkal:
>> * WPF projektbe átvinni a kódot egy **GUI** érdekében
>> * A metódusok módósítása,akár egy metódus dinamikussá tétele mely minden adattáblára megfelel
>> * Visszajelzés a felhasználó felé amennyiben az adatok nem megfelőlek vagy hibásak
>> * Minden hibát naplózni

## 2. Feltöltés sorrendje
Fontos, hogy az adott példában a **KES_BOLT tábla** feltöltése **minden esetben**  csak utoljára történhet a *kulcsreferencia* miatt.

**CEDRIC_CUT_TESTS** és **BLADEHQ_ACEL_ERTEKELES** táblák feltötési sorrendje *felcserélhető*.
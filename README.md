# Tartalom Jegyzék:
1. [Ismertetés](#ismertetés)
2. [Táblák felépítése és kapcsolataik](#táblák-felépítése-és-kapcsolataik)
    1. [**CEDRIC_CUT_TESTS** tábla](#1cedric_cut_tests-tábla)
    2. [**BLADEHQ_ACEL_ERTEKELES** tábla](#2-bladehq_acel_ertekeles-tábla)
    3. [**KES_BOLT** tábla](#3-kes_bolt-tábla)
3. [Normalizálás](#normalizálás)
    
# Ismertetés:

Célom egy zsebkés webáruház raktárkészletének ismertetése. Mint minden szerszámnál, a zsebkéseknél is fizethetünk pár ezer forintot vagy több tízezret, akár milliókat is. Ennek a miértje a mindennapi emberben talán nem is fordul meg azonban az elmúlt évtizedek során rengeteget fejlődött ez az ipar. Pontosabb CNC gépek jobb minőség ellenőrzés, anyaghasználat, és más fontos dolgok mellet nagyon nagy szerepet kap a különböző acéltípusok használata. Ezekről két fő forrásból érdemes talán a legkönnyebben tanulni, úgy hogy ne legyen szükségünk kémiai és kohászati adatokkal ismerkednünk.

Az általam elkészített adatbázis a következő forrásokkal fogja ismertetni a még hozzá nem értő embert ezek típusaival:
1. 
[Cedric & Ada Gear and Outdoors vágási tesztjei](https://docs.google.com/spreadsheets/d/1b_rNfdJnL9oyn-JoL9yUHhUmDLAP1hJ1dN_0q5G4tug/edit#gid=920247459)

>Egy ausztrál férfi szabadidejében különböző acéltípusokat tesztel olyan módon, hogy csavart szizál kötelet vág át, amíg a kést életlennek nem találja.(Mikor már nem érzi úgy, hogy tisztán vág át egy A4es papírlapot) Ezeket a teszteket youtube csatornáján a saját hozzáfűznivalóival együtt elérhetjük [itt](https://www.youtube.com/channel/UCdICfnpxD9uzHLaSr3DN55g).

2. [BladeHQ acélok értékelése](https://www.bladehq.com/cat--Best-Knife-Steel-Guide--3368)

>Amerika egyik legnagyobb kés orientált árusítója ezzel az oldallal próbálta segíteni a vevőit. Egy tízes skálán értékelték a leggyakrabban használt acéloknak négy fő szempontját:
*	Éltartás
*	Erősség
*	Rozsdamentesség 
    > Rozsdamentes szóval gyakran találkozunk azonban ténylegesen teljesen rozsdaálló acélokból jelenleg pár         darab ismert, ami alkalmas ebben az iparágban. 
*	Élezés könnyedsége
    >Drágább acélokat már nem tudunk könnyedén csiszolni, élezni *szilícium karbid/alumínium oxid*<sup>*</sup>
    élezőkővel, ilyenkor speciáls gyémánt bevonatú élező köveket kell használni valmaint az élezés időigénye is növekszik.
    >> <sup>*</sup>Egyik **leggyakoribb** csiszoló anyagok, csiszoló papírban is ezekkel találkozhatunk 
***
# Táblák felépítése és kapcsolataik
## A három tábla

### 1.**CEDRIC_CUT_TESTS** tábla
 
| Mező | Típus |
| --- | --- |
| <ins>Id</ins> | INT |
| Gyarto | VARCHAR(20) |
| Modell_nev | VARCHAR(20) |
| Acel | VARCHAR(20) |
| Vagasok | INT |
>Az <ins>`Id`</ins> mező elsődleges kulcs és automatikus inkrementálást használ.
>
> A `Vagasok` mezőn az a kikötés, hogy **1 és 10000 közötti** értéket vehet csak fel, **null** értékük nem lehet.

<hr style="background:none;border-top: 1px dashed gray;"> </hr>

### 2. **BLADEHQ_ACEL_ERTEKELES** tábla
 
| Mező | Típus |
| --- | --- |
| <ins>Id</ins> | INT |
| Acel | VARCHAR(20) |
| Eltartas | INT |
| Erosseg | INT |
| Rozsdamentesseg | INT |
| Elezes_Konnyedsege | INT |

>Az <ins>`Id`</ins> mező elsődleges kulcs és automatikus inkrementálást használ.
>
>> Az alábbi mezőkön:
>>
>>* `Eltartas`
>>* `Erosseg`
>>* `Rozsdamentesseg`
>>* `Elezes_Konnyedsege`
>>
>> Az a kikötés, hogy **1 és 10 közötti** értéket vehetnek csak fel, **null** értékük nem lehet.

<hr style="background:none;border-top: 1px dashed gray;"> </hr>

### 3. **KES_BOLT** tábla
 
| Mező | Típus |
| --- | --- |
| <ins>CikkSzam</ins> | INT |
| Gyarto | VARCHAR(20) |
| Modell_nev | VARCHAR(20) |
| ***Acel_Id (FK)*** | INT |
| Penge_Hossz | DECIMAL |
| Penge_Vastagsag | DECIMAL |
| Markolat_Anyag | VARCHAR(20) |
| Zar_Szerkezet | VARCHAR(20) |
| Ar | INT |
| Keszlet_Darabszam | INT |
| ***Cedric_Id (FK)*** | INT |

>A <ins>`CikkSzam`</ins> mező elsődleges kulcs és automatikus inkrementálást használ.
>
>Az  ***`Acel_Id`*** mező idegen kulcs mely a **BLADEHQ_ACEL_ERTEKELES** táblában szereplő <ins>`Id`</ins> elsődleges kulcsra mutat.
>
>A  ***`Cedric_Id`*** mező idegen kulcs mely a  **CEDRIC_CUT_TESTS** táblában szereplő <ins>`Id`</ins> elsődleges kulcsra mutat.
>
***
# Normalizálás:
**KES_BOLT**(<ins>`CikkSzam`</ins>`,Gyarto,Modell_Nev,`***`Acel_Id`***`,Penge_hossz,Penge_vastagsag,Markolat_Anyag,Ar,
Keszlet_Darabszam,`***`Cedric_Id`***)

*	**1NF**, mivel nincs benne összetett attribútum
*	**2NF**, a kulcs halmaz egy elemű
*	**3NF**, csak kulcsfüggőség van így teljesül
*	**BCNF**, is teljesül

**BLADEHQ_ACEL_ERTEKELES**(<ins>`Id`</ins>`,Acel,Eltartas,Erosseg,Rozsdamentesseg,Elezes_Konnyedsege`)
*	**1NF**, mivel nincs benne összetett attribútum
*	**2NF**, a kulcs halmaz egy elemű
*	**3NF**, csak kulcsfüggőség van így teljesül
*	**BCNF**, is teljesül

**CEDRIC_CUT_TESTS**(<ins>`Id`</ins>`,Vagasok,Acel,Modell_Nev,Gyarto`)
*	**1NF**, mivel nincs benne összetett attribútum
*	**2NF**, a kulcs halmaz egy elemű
*	**3NF**, csak kulcsfüggőség van így teljesül
*	**BCNF**, is teljesül
***


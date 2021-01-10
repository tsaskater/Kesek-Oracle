# Egyszerű lekérdezések
Három egyszerű egytáblás lekérdezés. Az sql megvalósítás elérhető [itt](./egyszeru_lekerdezesek.sql).

A lekérdezés száma a hozzátartozó sql kód előtti sorban kikommentelve megtalálható.
## 1. Lekérdezés:
Listázzuk ki a Magyarország jelenlegi törvényhez viszonyított közterületen legálisan hordható pengehosszúságú késeket(ez jelenleg 80 milliméter<sup>*</sup>):

(**KES_BOLT** táblához kapcsolódik))
><sup>*</sup>Törvényt tekintve nem csak a pengehosszúsága számít, hanem az él hossza is esetleg az, hogy a nyitási mechanizmus használ-e rúgót stb. Ez nem legális tanácsadás mivel az adatok sem pontosan lettek kigyűjtve (több mező esetében *random generált*) így nem tükrözi a valóságot.
## 2. Lekérdezés:
Írjuk ki Pete melyik acéllal tudta a legtöbb vágást elérni szizál kötélen és pontosan hány vágás után találta életlennek:

(**CEDRIC_CUT_TEST** táblához kapcsolódik))

## 3. Lekérdezés:
Írjuk ki abc sorrendben az összes acél megnevezését melyről a BladeHQ weboldala informál minket:

(**BLADEHQ_ACEL_ERTEKELES** táblához kapcsolódik)

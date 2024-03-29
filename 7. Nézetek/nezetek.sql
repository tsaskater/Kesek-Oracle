--1
CREATE OR REPLACE VIEW TizezerFelettiKesek AS
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes, KES_BOLT.AR,BLADEHQ_ACEL_ERTEKELES.ACEL
FROM KES_BOLT join BLADEHQ_ACEL_ERTEKELES ON KES_BOLT.ACEL_ID = BLADEHQ_ACEL_ERTEKELES.ID
WHERE KES_BOLT.Ar>=10000
order by KES_BOLT.AR;

SELECT * FROM TizezerFelettiKesek;
--2
CREATE OR REPLACE VIEW MOLEGALIS AS
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,BLADEHQ_ACEL_ERTEKELES.ACEL,KES_BOLT.PENGE_HOSSZ
FROM KES_BOLT join BLADEHQ_ACEL_ERTEKELES ON KES_BOLT.ACEL_ID = BLADEHQ_ACEL_ERTEKELES.ID
WHERE KES_BOLT.PENGE_HOSSZ<=80
order by KES_BOLT.PENGE_HOSSZ;

SELECT * FROM MOLEGALIS;
--3
Mentsük ki, azokat a késeket melyek 200-nál többször vágtak szizál kötelet:
CREATE OR REPLACE VIEW KetszazFolottiVagasok AS
SELECT CEDRIC_CUT_TESTS.Gyarto||' '||CEDRIC_CUT_TESTS.Modell_Nev Kes,CEDRIC_CUT_TESTS.Vagasok
FROM CEDRIC_CUT_TESTS
WHERE CEDRIC_CUT_TESTS.Vagasok>200
order by CEDRIC_CUT_TESTS.Vagasok;

SELECT * FROM KETSZAZFOLOTTIVAGASOK;

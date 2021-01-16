--1
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
WHERE KES_BOLT.Gyarto = 'Benchmade'
UNION
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
WHERE KES_BOLT.Gyarto = 'Spyderco'
Order By Ar;
--2
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
MINUS
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
WHERE KES_BOLT.Gyarto = 'Spyderco'
Order By Ar;
--3
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
MINUS
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
WHERE KES_BOLT.Gyarto = 'Spyderco'
Order By Ar;
--4
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT 
WHERE Zar_Szerkezet = 'Liner-Lock'
INTERSECT
SELECT KES_BOLT.Gyarto||' '||KES_BOLT.Modell_Nev Kes,Ar
FROM KES_BOLT
WHERE Penge_Hossz<80 ;

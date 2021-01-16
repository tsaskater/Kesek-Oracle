--1
SET SERVEROUTPUT ON;

CREATE
	OR replace TRIGGER Kesupdate after

UPDATE ON KES_BOLT
FOR each row

BEGIN
	dbms_output.put_line('Regi kés neve: ' || :old.Gyarto || ' ' || :old.Modell_nev);

	dbms_output.put_line('Új kés neve: ' || :NEW.Gyarto || ' ' || :NEW.Modell_nev);
END;

UPDATE KES_BOLT
SET Gyarto = 'Benchmade'
	,Modell_nev = 'Bugout'
WHERE CikkSzam = 1;

--2
create or replace trigger kesTorlese
after delete on Kes_Bolt
for each row 
begin 
dbms_output.put_line('Regi kés neve: ' || :old.Gyarto || ' ' ||:old.Modell_nev );
end;

DELETE FROM KES_BOLT
WHERE Cikkszam=1;

--3
create or replace trigger KesBeszuras
after insert on Kes_Bolt
for each row 
begin 
dbms_output.put_line('Beszúrt kés neve: ' || :NEW.Gyarto || ' ' ||:NEW.Modell_nev );
end;

INSERT INTO KES_BOLT(Gyarto,Modell_nev,Acel_Id,Penge_Hossz,Penge_Vastagsag,Markolat_Anyag,Zar_Szerkezet,Ar,KESZLET_DARABSZAM,Cedric_Id)
VALUES('Spyderco', 'Endela', 4, 78,13,'FRN', 'Back-Lock',57064,1,27);

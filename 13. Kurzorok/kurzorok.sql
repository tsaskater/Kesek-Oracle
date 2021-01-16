--1
SET SERVEROUTPUT ON;
DECLARE
    egysor KES_BOLT%ROWTYPE;
BEGIN
  FOR egysor IN (SELECT * FROM KES_BOLT)
  LOOP
    dbms_output.put('Gyártó: ' || egysor.Gyarto || 'Modell név: ' || egysor.Modell_Nev);
    dbms_output.put_line(' Markolat: ' ||  egysor.Markolat_Anyag);
  END LOOP;
END;
--2
DECLARE
    egysor Cedric_Cut_TESTS%ROWTYPE;
BEGIN
  FOR egysor IN (SELECT * FROM Cedric_Cut_TESTS)
  LOOP
    dbms_output.put('Modell név: ' || egysor.Modell_Nev || 'Acél: ' || egysor.Acel);
    dbms_output.put_line(' Vágasok: ' ||  egysor.Vagasok);
  END LOOP;
END;
--3
DECLARE
  CURSOR kurzor IS select * from BLADEHQ_ACEL_ERTEKELES;
  rekord BLADEHQ_ACEL_ERTEKELES%ROWTYPE;
BEGIN
  FOR rekord IN kurzor
  LOOP
    IF rekord.Eltartas BETWEEN 5 AND 10
    THEN
         dbms_output.put_line(rekord.Acel || ' - Éltartása: ' || rekord.Eltartas);
    END IF;
  END LOOP;
END;

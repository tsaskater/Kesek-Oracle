CREATE TABLE CEDRIC_CUT_TESTS(
  Id INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) PRIMARY KEY,
  Gyarto VARCHAR(20),
  Modell_nev VARCHAR(20),
  Acel VARCHAR(20),
  Vagasok INT NOT NULL,
  CONSTRAINT vagasok_length check (Vagasok between 1 and 10000)
);

CREATE TABLE BLADEHQ_ACEL_ERTEKELES(
  Id INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) PRIMARY KEY,
  Acel VARCHAR(20),
  Eltartas INT NOT NULL,
  CONSTRAINT eltartas_rating check (Eltartas between 1 and 10),
  Erosseg INT NOT NULL,
  CONSTRAINT erosseg_rating check (Erosseg between 1 and 10),
  Rozsdamentesseg INT NOT NULL,
  CONSTRAINT rozsdamentesseg_rating check (Rozsdamentesseg between 1 and 10),
  Elezes_Konnyedsege INT NOT NULL,
  CONSTRAINT Elezes_Konnyedsege_rating check (Elezes_Konnyedsege between 1 and 10)
);


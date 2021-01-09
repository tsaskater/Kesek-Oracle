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

CREATE TABLE KES_BOLT(
  CikkSzam INT GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) PRIMARY KEY,
  Gyarto VARCHAR(20),
  Modell_nev VARCHAR(20),
  Acel_Id INT NOT NULL,
  CONSTRAINT acelid_length check (Acel_Id between 1 and 4294967295),
  FOREIGN KEY (Acel_Id) REFERENCES BLADEHQ_ACEL_ERTEKELES (Id),
  Penge_Hossz DECIMAL NOT NULL,
  CONSTRAINT penge_hossz_length check (Penge_Hossz between 0.01 and 4294967295),
  Penge_Vastagsag DECIMAL NOT NULL,
  CONSTRAINT penge_vastagsag_length check (Penge_Vastagsag between 0.01 and 4294967295),
  Markolat_Anyag VARCHAR(20),
  Zar_Szerkezet VARCHAR(20),
  Ar INT  NOT NULL,
  CONSTRAINT ar_length check (Ar between 1 and 4294967295),
  Keszlet_Darabszam INT,
  CONSTRAINT kdbsz_length check (Keszlet_Darabszam between 0 and 4294967295),
  Cedric_Id INT  NOT NULL,
  CONSTRAINT cedric_id_length  check (Cedric_Id between 1 and 4294967295),
  FOREIGN KEY (Cedric_Id) REFERENCES CEDRIC_CUT_TESTS(Id)
);
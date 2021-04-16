--Simulacija za REPEATABLE READ PRVI DEO

--Korak 1
USE SQLprojekat
GO

-- Korak 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRAN;

  SELECT IDIGRAC, IME, PREZIME, GODINE, POENI_UKUPNO
  FROM Osoblje.IGRAC
  WHERE IDKLUB = 5;

-- Korak 5 -- tek kad se odradi commit, korak 4 ce biti izvrsen
COMMIT TRAN;



--Simulacija za REPEATABLE READ DRUGI DEO

-- Korak 3
USE SQLprojekat
GO

-- Korak 4
UPDATE Osoblje.IGRAC
  SET POENI_UKUPNO += 20
WHERE IDKLUB = 5;



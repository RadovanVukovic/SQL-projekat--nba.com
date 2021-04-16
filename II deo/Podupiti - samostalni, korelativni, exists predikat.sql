USE SQLprojekat
GO


--Skalarni podupit - izracunava broj dana izmedju poslednje odigrane utakmice i prve utakmice koja tek treba da se odigra
SELECT DATEDIFF(DAY , MAX(DATUM), (SELECT MIN(DATUM) FROM Rasporedi.RASPORED_UTAKMICA))
FROM Kosarka.UTAKMICA
GO


--Više-vrednosni podupit - vraca podatke o igracima koji se nalaze u transfer tabeli
SELECT IME AS [Ime igraca], PREZIME AS [Prezime igraca], TEZINA AS [Tezina igraca], VISINA AS [Visina igraca]
FROM Osoblje.IGRAC AS i
WHERE IDIGRAC IN (
	SELECT IDIGRAC
	FROM Kosarka.[TRANSFER]
	);
GO


--Korelativni podupit - vraca statitiku igraca koji su postigli najveci broj poena za svaku utakmicu
SELECT sa.IDUTAKMICA AS [Id utakmice], i.IME AS [Ime igraca], i.PREZIME AS [Prezime igraca], sa.BROJ_POENA AS [Broj poena], sa.BROJ_ASISTENCIJA AS [Broj asistencija], sa.BROJ_SKOKOVA AS [Broj skokova]
FROM Statistike.STATISTIKA_IGRACA AS sa
JOIN Osoblje.IGRAC AS i ON sa.IDIGRAC = i.IDIGRAC
WHERE BROJ_POENA =
	(SELECT MAX(BROJ_POENA)
	FROM Statistike.STATISTIKA_IGRACA AS sa2
	WHERE sa2.IDUTAKMICA = sa.IDUTAKMICA)
ORDER BY BROJ_POENA DESC;
GO


--Podupit sa EXISTS -- vraca igrace koji ne postoje u transfer tabeli
SELECT IME AS [Ime igraca], PREZIME AS [Prezime igraca], TEZINA AS [Tezina igraca], VISINA AS [Visina igraca]
FROM Osoblje.IGRAC AS i
WHERE NOT EXISTS (
	SELECT * FROM Kosarka.[TRANSFER] AS t WHERE t.IDIGRAC = i.IDIGRAC
	);
GO


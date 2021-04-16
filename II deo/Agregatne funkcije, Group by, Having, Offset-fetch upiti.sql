USE SQLprojekat
GO


--Upit prikazuje maksimalan broj poena jednog igraca na utakmici
SELECT IDUTAKMICA, MAX(BROJ_POENA) AS [Broj poena]
FROM Statistike.STATISTIKA_IGRACA
GROUP BY IDUTAKMICA
GO


--Upit prikazuje koeficijent (poeni + asistencije + skokovi) najboljeg igraca na utakmici
SELECT si.IDUTAKMICA, MAX(si.BROJ_POENA + si.BROJ_ASISTENCIJA + si.BROJ_SKOKOVA) AS [Koeficijent najboljeg igraca]
FROM Statistike.STATISTIKA_IGRACA AS si
GROUP BY si.IDUTAKMICA
GO



--Upit vraca klubove koji imaju najbolji koeficijent uspesnosti (poeni + asistencije + skokovi svih igraca kluba). Prikazani su samo koeficijenti koji su veci od 130
SELECT i.IDKLUB AS [Id kluba], k.NAZIV AS [Naziv kluba], SUM(SKOKOVI_UKUPNO + ASISTENCIJE_UKUPNO + POENI_UKUPNO) AS [Koeficijent uspesnosti]
FROM Osoblje.IGRAC AS i
JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
GROUP BY i.IDKLUB, k.NAZIV
HAVING SUM(SKOKOVI_UKUPNO + ASISTENCIJE_UKUPNO + POENI_UKUPNO) > 130
GO

--OFFSET-FETCH - upit prikazuje 10 najboljih igraca po broju postignutih poena
SELECT i.ime AS [Ime igraca], i.PREZIME AS [Prezime igraca],  k.NAZIV AS [Naziv kluba], i.GODINE AS [Godine] , i.VISINA AS [Visina (cm)] , i.TEZINA AS [Tezina (kg)]  , POENI_UKUPNO AS [Ukupno postignutih poena] 
FROM Osoblje.IGRAC AS i
JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
ORDER BY POENI_UKUPNO DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;
GO


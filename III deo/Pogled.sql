USE SQLprojekat
GO

--Kreiranje pogleda- prikaz 10 igraca sa najboljim koeficijentom uspesnosti (poeni + skokovi + asistencije) na svim utakmicama
CREATE OR ALTER VIEW dbo.Top10IgraciNajboljeOdigraneUtakmice
AS
 SELECT TOP(10) sa.IDUTAKMICA AS [Id utakmice], i.IME AS [Ime igraca], i.PREZIME AS [Prezime igraca], k.NAZIV AS [Naziv kluba], sa.BROJ_POENA AS [Broj poena], sa.BROJ_ASISTENCIJA AS [Broj asistencija], sa.BROJ_SKOKOVA AS [Broj skokova], SUM(sa.BROJ_POENA + sa.BROJ_ASISTENCIJA + sa.BROJ_SKOKOVA) AS [Koeficijent uspesnosti]
FROM Statistike.STATISTIKA_IGRACA AS sa
INNER JOIN Osoblje.IGRAC AS i ON sa.IDIGRAC= i.IDIGRAC
INNER JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
GROUP BY sa.IDIGRAC, sa.IDUTAKMICA ,i.IME, i.PREZIME, k.NAZIV, sa.BROJ_POENA, sa.BROJ_ASISTENCIJA, sa.BROJ_SKOKOVA
ORDER BY [Koeficijent uspesnosti] DESC
GO



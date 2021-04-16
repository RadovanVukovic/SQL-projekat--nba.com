USE SQLprojekat
GO


--Kreiranje skalarne funkcije - funkcija vraca broj dana izmedju poslednje odigrane utakmice i prve utakmice koja tek treba da se odigra
CREATE OR ALTER FUNCTION dbo.DaniIzmedjuUtakmica()
RETURNS int
AS 
BEGIN
	DECLARE @dani int;
	SELECT @dani = DATEDIFF(DAY, (SELECT MAX(DATUM) FROM Kosarka.Utakmica), (SELECT MIN(DATUM) FROM Rasporedi.RASPORED_UTAKMICA) )
	
	RETURN @dani;
END
GO

--Kreiranje TVF - funkcija vraca igrace koji su najbolje odigrali utakmicu, kao parametar se prosledjuje broj redova koje korisnik zeli da vidi

CREATE OR ALTER FUNCTION dbo.NajboljiIgraciOdigranihUtakmica(@brojRedova int)
RETURNS TABLE
AS
RETURN
( 
	SELECT TOP(@brojRedova) sa.IDUTAKMICA AS [Id utakmice], i.IME AS [Ime igraca], i.PREZIME AS [Prezime igraca], k.NAZIV AS [Naziv kluba], sa.BROJ_POENA AS [Broj poena], sa.BROJ_ASISTENCIJA AS [Broj asistencija], sa.BROJ_SKOKOVA AS [Broj skokova], SUM(sa.BROJ_POENA + sa.BROJ_ASISTENCIJA + sa.BROJ_SKOKOVA) AS [Koeficijent uspesnosti]
	FROM Statistike.STATISTIKA_IGRACA AS sa
	INNER JOIN Osoblje.IGRAC AS i ON sa.IDIGRAC= i.IDIGRAC
	INNER JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
	GROUP BY sa.IDIGRAC, sa.IDUTAKMICA ,i.IME, i.PREZIME, k.NAZIV, sa.BROJ_POENA, sa.BROJ_ASISTENCIJA, sa.BROJ_SKOKOVA
	ORDER BY [Koeficijent uspesnosti] DESC
);
GO


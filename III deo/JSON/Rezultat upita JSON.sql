
--Vracanje rezultata upita kao JSON
--U upitu se nalaze podaci iz tabela Klub i Menadzer

USE SQLprojekat
GO

SELECT 
m.IME AS [Menadzer.ime],
m.PREZIME AS [Menadzer.prezime],
k.IDKLUB,
k.NAZIV,
k.GODINA_NASTANKA,
k.POSTIGNUTI_POENI,
k.PRIMLJENI_POENI
FROM Organizacija.KLUB AS k
JOIN Osoblje.MENADZER AS m ON k.IDKLUB = m.IDKLUB

FOR JSON PATH,
ROOT('Klubovi')
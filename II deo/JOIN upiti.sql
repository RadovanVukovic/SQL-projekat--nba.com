USE SQLprojekat
GO

--Upit vraca ime igraca, prezime igraca i poziciju na kojoj igra

SELECT i.ime AS [Ime igraca], i.prezime AS [Prezime igraca], p.NAZIV AS [Pozicija igraca]
FROM Osoblje.IGRAC AS i 
INNER JOIN Kosarka.POZICIJA_IGRACA AS p ON i.IDPOZICIJA_IGRACA = p.IDPOZICIJA_IGRACA;
GO

--Upit vraca sve menadzere sa nazivima njihovih klubova

SELECT m.ime AS [Ime menadzera], m.prezime AS [Prezime menadzera], k.NAZIV AS [Naziv kluba]
FROM Osoblje.MENADZER AS m 
INNER JOIN Organizacija.KLUB AS k ON m.IDKLUB = k.IDKLUB;
GO

--Upit vraca sve igrace i nazive klubova u kojima igraju

SELECT i.ime AS [Ime igraca], i.prezime AS [Prezime igraca], k.NAZIV AS [Naziv kluba]
FROM Osoblje.IGRAC AS i 
INNER JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB;
GO


--Upit vraca informacije o vremenu i mestu odigravanja utakmice sortirano po datumu i vremenu odigravanja
SELECT u.IDUTAKMICA AS [Id utakmice], u.DATUM AS [Datum odigravanja utakmice], u.VREME AS [Vreme], s.NAZIV AS [Naziv stadiona], s.GRAD AS [Grad], s.KAPACITET AS [Kapacitet stadiona]
FROM Kosarka.UTAKMICA as u
JOIN Organizacija.STADION as s ON u.IDSTADION = s.IDSTADION 
ORDER BY u.DATUM, u.VREME
GO

--Upit vraca sve odigrane utakmice sa rezultatima

SELECT su.IDUTAKMICA AS [ID utakmice], k.NAZIV AS [Naziv kluba], su.BROJ_POENA AS [Broj poena]
FROM Statistike.STATISTIKA_UTAKMICE AS su
INNER JOIN Organizacija.KLUB AS k ON su.IDKLUB = k.IDKLUB
GO

--Upit vraca sve igrace i njihove nadredjene odnosno menadzere
SELECT i.ime AS [Ime igraca], i.prezime AS [Prezime igraca], m.ime AS [Ime menadzera], m.prezime AS [Prezime menadzera]
FROM Osoblje.IGRAC AS i 
INNER JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
INNER JOIN Osoblje.MENADZER AS m ON k.IDKLUB = m.IDKLUB
GO

--Upit vraca statistiku svih odigranih utakmica

SELECT su.IDUTAKMICA AS [ID utakmice], k.NAZIV AS [Naziv kluba], su.SUTEVI_ZA_DVA_POENA AS [Dva poena - šutevi], su.UBACENI_SUTEVI_ZA_DVA_POENA AS [Dva poena - pogodjeno], su.SUTEVI_ZA_TRI_POENA AS [Tri poena - šutevi], su.UBACENI_SUTEVI_ZA_TRI_POENA AS [Tri poena - pogodjeno], su.BROJ_SLOBODNIH_BACANJA AS [Slobodna bacanja - šutevi], su.UBACENA_SLOBODNA_BACANJA AS [Slobodna bacanja - pogodjeno], su.BROJ_FAULOVA AS [Broj faulova]
FROM Statistike.STATISTIKA_UTAKMICE AS su
INNER JOIN Organizacija.KLUB AS k ON su.IDKLUB = k.IDKLUB
GO

--Upit vraca sve transfere igraca sa njihovim imenima i nazivima klubova u kojima igraju

SELECT i.ime AS [Ime igraca], i.prezime AS [Prezime igraca], k.NAZIV AS [Naziv kluba], t.DATUM_DOLASKA AS [Datum dolaska igraca], t.DATUM_ODLASKA AS [Datum odlaska igraca] , t.KOLICINA_NOVCA AS [Iznos transfera ($)]
FROM Kosarka.[TRANSFER] AS t
INNER JOIN Osoblje.IGRAC AS i ON t.IDIGRAC = i.IDIGRAC
INNER JOIN Organizacija.KLUB AS k ON t.IDKLUB = k.IDKLUB 
GO

 --Upit vraca raspored igranja utakmica sortiranih po datumu i vremenu

 SELECT rk.IDRASPORED_UTAKMICA AS [Id raspored utakmica], k.NAZIV AS [Naziv kluba], ru.DATUM AS [Datum], ru.VREME AS [Vreme], s.NAZIV, s.GRAD
 FROM Rasporedi.RASPORED_KLUB AS rk
 INNER JOIN Organizacija.KLUB AS k ON rk.IDKLUB = k.IDKLUB
 INNER JOIN Rasporedi.RASPORED_UTAKMICA AS ru ON rk.IDRASPORED_UTAKMICA = ru.IDRASPORED_UTAKMICA
 INNER JOIN Organizacija.STADION AS s ON ru.IDSTADION = s.IDSTADION
 ORDER BY ru.DATUM, ru.VREME
 GO


 --Upit vraca statistiku igraca svih utakmica

 SELECT sa.IDUTAKMICA AS [Id utakmice], i.IME AS [Ime igraca], i.PREZIME AS [Prezime igraca], k.NAZIV AS [Naziv kluba], sa.BROJ_POENA AS [Broj poena], sa.BROJ_ASISTENCIJA AS [Broj asistencija], sa.BROJ_SKOKOVA AS [Broj skokova]
FROM Statistike.STATISTIKA_IGRACA AS sa
INNER JOIN Osoblje.IGRAC AS i ON sa.IDIGRAC= i.IDIGRAC
INNER JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
GO


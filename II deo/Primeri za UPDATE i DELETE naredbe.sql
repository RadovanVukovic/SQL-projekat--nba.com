USE SQLprojekat
GO

--UPDATE NAREDBE

--UPDATE tabele IGRAC - postavljanje vrednosti kolone POENI_UKUPNO na 20 svim igracima ciji je IDKLUB 1 (Los Angeles Lakers)

UPDATE Osoblje.IGRAC SET POENI_UKUPNO = 20 WHERE IDKLUB = 1;
GO


--UPDATE tabele KLUB - postavljanje vrednosti kolone POSTIGNUTI_POENI na 200 svim klubovima koji imaju barem jednu pobedu

UPDATE Organizacija.KLUB SET POSTIGNUTI_POENI = 200 WHERE POBEDA > 0;
GO


--UPDATE tabele STATISTIKA_UTAKMICE - postavljanje vrednosti kolone BROJ_POENA na 100 svim klubovima koji su postigli vise od 10 slobodnih bacanja u toj utakmici

UPDATE Statistike.STATISTIKA_UTAKMICE SET BROJ_POENA = 100 WHERE UBACENA_SLOBODNA_BACANJA > 10;
GO


--UPDATE tabele STATISTIKA_IGRACA - postavljanje vrednosti kolone BROJ_POENA na 30 svim igracima ciji je zbir skokova i asistencija veci od 9

UPDATE Statistike.STATISTIKA_IGRACA SET BROJ_POENA = 30 WHERE (BROJ_SKOKOVA + BROJ_ASISTENCIJA) > 9;
GO


--UPDATE tabele TRANSFER - postavljanje vrednosti kolone KOLICINA_NOVCA na 0 svim transferima koji su se izvrsili pre 2018. godine

UPDATE Kosarka.[TRANSFER] SET KOLICINA_NOVCA = 0 WHERE YEAR(DATUM_DOLASKA) < 2018;
GO


--DELETE NAREDBE

--DELETE redova tabele TRANSFER - brisanje svih transfera koji se izvrsili pre 2018 godine

DELETE FROM Kosarka.[TRANSFER] WHERE YEAR(DATUM_DOLASKA) < 2018; 
GO


--DELETE redova tabele STATISTIKA_UTAKMICE - brisanje statistike klubova koji su postigli manje od 100 poena na utakmici

DELETE FROM Statistike.STATISTIKA_UTAKMICE WHERE BROJ_POENA < 100; 
GO


--DELETE redova tabele TRANSFER - brisanje svih transfera cija je kolicina novca manja od 10 000 000

DELETE FROM Kosarka.[TRANSFER] WHERE KOLICINA_NOVCA < 10000000; 
GO
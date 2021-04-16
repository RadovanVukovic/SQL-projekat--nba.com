USE SQLprojekat
GO


--ERROR procedura - koristi se u CATCH bloku i sluzi za dodavanje greske u tabelu ErrorsInfo
CREATE OR ALTER PROCEDURE ErrorHandler
AS
BEGIN
	INSERT INTO ErrorsInfo
	VALUES ( ERROR_NUMBER(), ERROR_SEVERITY(),ERROR_LINE() , ERROR_STATE() ,ERROR_MESSAGE(), ERROR_PROCEDURE() )
END
GO

--INSERT procedura - poziva se za dodavanje novog kluba, u proceduri se prvo proverava da li u tabeli ima neki klub sa istim nazivom, ako ima, ispisuje se poruka. Ako ne postoji nijedan klub sa istim nazivom, proverava se da li je godina nastanka veca od godine danasnjeg datuma i proverava se da li su ostali uneti parametri manji od nule. 
--Ako su podaci ispravni, dodaje se red u tabelu Klub.

CREATE OR ALTER PROCEDURE dbo.Klub_INSERT
(
	@naziv nvarchar(30),
	@godina_nastanka int,
	@pobeda int,
	@poraz int,
	@postignuti_poeni int,
	@primljeni_poeni int 
)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		IF NOT EXISTS (SELECT * FROM Organizacija.KLUB WHERE NAZIV = @naziv)
			BEGIN
				IF(@godina_nastanka > YEAR(GETDATE()) OR @pobeda < 0 OR @poraz < 0 OR @postignuti_poeni < 0 OR @primljeni_poeni < 0)
					BEGIN
						SELECT N'Podaci nisu ispravno uneti.'
					END;
				ELSE
					BEGIN
						INSERT INTO Organizacija.KLUB
						VALUES (@naziv, @godina_nastanka, @pobeda, @poraz, @postignuti_poeni, @primljeni_poeni );
						SELECT N'Novi klub je uspesno dodat u tabelu!'
					END;
			END;
		ELSE
			BEGIN
				SELECT @naziv + N' klub već postoji u tabeli.'
			END;
	END TRY
	BEGIN CATCH
		EXEC ErrorHandler
	END CATCH
END;
GO


--UPDATE procedura tabele Klub - prvo se proverava da li postoji u tabeli klub sa unetim ID, ako postoji, proveravaju se uneti parametri i u slucaju ispravnosti parametara menja se odgovarajuci red u tabeli. Ako podaci nisu ispravni ili nije pronadjen klub sa odgovarajucim ID, ispisace se poruka o neispravnosti podataka.

CREATE OR ALTER PROCEDURE dbo.Klub_UPDATE
(
	@id int,
	@naziv nvarchar(30),
	@godina_nastanka int,
	@pobeda int,
	@poraz int,
	@postignuti_poeni int,
	@primljeni_poeni int 
)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		IF EXISTS (SELECT * FROM Organizacija.KLUB WHERE IDKLUB = @id)
			BEGIN
				IF(@godina_nastanka > YEAR(GETDATE()) OR @pobeda < 0 OR @poraz < 0 OR @postignuti_poeni < 0 OR @primljeni_poeni < 0)
					BEGIN
						SELECT N'Podaci nisu ispravno uneti.'
					END;
		
				ELSE
					BEGIN
						UPDATE Organizacija.KLUB  
						SET    
								NAZIV = @naziv,
								GODINA_NASTANKA = @godina_nastanka,  
								POBEDA = @pobeda,  
								PORAZ = @poraz,
								POSTIGNUTI_POENI = @postignuti_poeni,
								PRIMLJENI_POENI = @primljeni_poeni 
						WHERE  IDKLUB = @id
			
						SELECT N'Podaci kluba ' + @naziv +  N' su uspesno promenjeni!'
					END;
			END;	
		ELSE
			BEGIN
				SELECT N' Ne postojI klub sa unetim ID. ' 
			END;
	END TRY
	BEGIN CATCH
		EXEC ErrorHandler
	END CATCH

END;
GO


--DELETE procedura tabele Klub -- kao parametar se unosi ID kluba koji treba da se obrise. Proverava se da li taj klub postoji u tabeli, ako ne postoji, korisniku se ispisuje odgovarajuca poruka. Ako Klub postoji, procedura ce obrisati taj red u tabeli Klub.

CREATE OR ALTER PROCEDURE dbo.Klub_DELETE
(
	@id int
)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		IF EXISTS (SELECT * FROM Organizacija.KLUB WHERE IDKLUB = @id)
			BEGIN
				DELETE FROM Organizacija.KLUB WHERE IDKLUB = @id
				SELECT N'Uspesno obrisan klub!'
			END;	
		ELSE
			BEGIN
				SELECT N' Ne postojI klub sa unetim ID. ' 
			END;
	END TRY
	BEGIN CATCH
		EXEC ErrorHandler
	END CATCH
END;
GO


--SELECT procedura - stranicenje rezultata upita. Upit vraca sve igrace sortirane po broju postignutih poena. Korisnik ima opciju da putem parametara odredi koju stranu zeli da prikaze (svaka strana ima 10 redova) i koji broj redova zeli da vidi na toj strani. Ukoliko su parametri manji od 1, ispisace se poruka da podaci nisu ispravno uneti. 

CREATE OR ALTER PROCEDURE dbo.Igraci_SELECT
(
	@broj_strane int,
	@broj_redova int
)
AS
BEGIN
	BEGIN TRY
		IF(@broj_strane > 0 AND @broj_redova > 0)
			BEGIN
				SELECT i.IDIGRAC AS [Id igraca],i.ime AS [Ime igraca], i.PREZIME AS [Prezime igraca],  k.NAZIV AS [Naziv kluba], i.GODINE AS [Godine] , i.VISINA AS [Visina (cm)] , i.TEZINA AS [Tezina (kg)]  , POENI_UKUPNO AS [Ukupno postignutih poena] 
				FROM Osoblje.IGRAC AS i
				JOIN Organizacija.KLUB AS k ON i.IDKLUB = k.IDKLUB
				ORDER BY POENI_UKUPNO DESC
				OFFSET @broj_strane*10-10 ROWS FETCH FIRST @broj_redova ROWS ONLY;
			END
		ELSE
			BEGIN
				SELECT N'Podaci nisu ispravno uneti.'
			END
	END TRY
	BEGIN CATCH
		EXEC ErrorHandler
	END CATCH
	
END
GO

--obrada transakcije - Procedura ubacuje po jedan red u tabelu Igrac i u tabelu Klub. U okviru procedure nalazi se try-catch blok , u try bloku se nalazi begin i commit tran. Ako se desi neka greska, u catch bloku se ponistava transakcija pomocu rollback tran 

CREATE OR ALTER PROCEDURE ObradaTransakcije
AS
BEGIN
	
	BEGIN TRY
		SET NOCOUNT ON;

		BEGIN TRAN;
	
			INSERT INTO Organizacija.KLUB
			( [NAZIV], [GODINA_NASTANKA], [POBEDA], [PORAZ], [POSTIGNUTI_POENI],[PRIMLJENI_POENI])
			VALUES
			(N'Obrada tran', 1945 , 0, 0, 0, 0)

			INSERT INTO Osoblje.IGRAC
			([IME], [PREZIME], [GODINE], [VISINA], [TEZINA], [POENI_UKUPNO], [ASISTENCIJE_UKUPNO], [SKOKOVI_UKUPNO], [IDKLUB], [IDPOZICIJA_IGRACA])
			VALUES
			( N'Obrada',  N' tran ' , '24',  '1.98 ',  '85 ', '13', '6', '4', '1', '1' )

		COMMIT TRAN;

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT > 0
		BEGIN
			PRINT 'Pojavila se greska, odradio se ROLLBACK transakcije.';
			ROLLBACK TRAN;
			EXEC ErrorHandler
		END

	END CATCH;

END
GO




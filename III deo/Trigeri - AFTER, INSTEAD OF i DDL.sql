USE SQLprojekat
GO

--AFTER okidac - Triger se okida kada prilikom unosa reda u tabelu Igrac. Proveravaju se uneseni podaci, ako podaci nisu validni onda se radi rollback transakcije
CREATE OR ALTER TRIGGER Osoblje.TR_Igrac_INSERT
	ON Osoblje.IGRAC
	AFTER INSERT 
AS 
BEGIN
	SET NOCOUNT ON;
	IF EXISTS( SELECT * FROM inserted AS i 
	WHERE 
	 i.GODINE > 50 OR I.GODINE < 15 OR
	 i.TEZINA > 150 OR I.TEZINA < 50 OR
	 i.VISINA NOT BETWEEN 1.5 AND 3  OR
	 i.IDPOZICIJA_IGRACA NOT IN (1,2,3,4,5) OR
	 i.POENI_UKUPNO < 0 OR i.ASISTENCIJE_UKUPNO < 0 OR i.SKOKOVI_UKUPNO < 0
	) 
	BEGIN
		PRINT 'Podaci nisu validni.';
 		if @@TRANCOUNT > 0 ROLLBACK TRAN;
	END;
END;
GO


--INSTEAD OF okidac - Kada korisnik pokusa da obrise red u tabeli Klub, triger nece dozvoliti njegovo brisanje i uradice rollback transakcije sa odgovarajucom porukom

CREATE OR ALTER TRIGGER Organizacija.TR_Klub_DELETE 
ON Organizacija.Klub
	INSTEAD OF DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @obrisaniKlubovi int;
	SELECT @obrisaniKlubovi = COUNT(*) FROM deleted;
	IF @obrisaniKlubovi > 0
	BEGIN
		PRINT 'Nije dozvoljeno brisanje klubova!';
		IF @@TRANCOUNT > 0
		ROLLBACK TRAN;
	END;
END;
GO

--DDL okidac - 
CREATE OR ALTER TRIGGER TR_Table_CREATE
ON DATABASE
FOR CREATE_TABLE   
AS   
    
	DECLARE @imeTabele nvarchar(100);
	DECLARE @komanda nvarchar(max);
	DECLARE @korisnik nvarchar(100);

	SELECT @imeTabele = EVENTDATA().value ('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(128)');
	SELECT @komanda = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)');
	SELECT @korisnik = EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(256)');

	INSERT INTO dbo.CreateTableInfo VALUES (@imeTabele, @komanda, @korisnik)
	
    PRINT 'Tabela je napravljena.'
GO 




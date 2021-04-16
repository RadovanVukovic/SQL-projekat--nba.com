/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     02.01.2021 7:55:41 PM                        */
/*==============================================================*/

USE SQLprojekat
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IGRAC') and o.name = 'FK_IGRAC_KLUB')
alter table IGRAC
   drop constraint FK_IGRAC_KLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IGRAC') and o.name = 'FK_IGRAC_POZICIJA_IGRACA')
alter table IGRAC
   drop constraint FK_IGRAC_POZICIJA_IGRACA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MENADZER') and o.name = 'FK_MENADZER_KLUB')
alter table MENADZER
   drop constraint FK_MENADZER_KLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RASPORED_UTAKMICA') and o.name = 'FK_RASPORED_STADION')
alter table RASPORED_UTAKMICA
   drop constraint FK_RASPORED_STADION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RASPORED_KLUB') and o.name = 'FK_RASPORED_KLUB_RASPORED_UTAKMICA')
alter table RASPORED_KLUB
   drop constraint FK_RASPORED_KLUB_RASPORED_UTAKMICA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RASPORED_KLUB') and o.name = 'FK_RASPORED_KLUB_KLUB')
alter table RASPORED_KLUB
   drop constraint FK_RASPORED_KLUB_KLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STATISTIKA_IGRACA') and o.name = 'FK_STATISTIKA_IGRACA_IGRAC')
alter table STATISTIKA_IGRACA
   drop constraint FK_STATISTIKA_IGRACA_IGRAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STATISTIKA_IGRACA') and o.name = 'FK_STATISTIKA_IGRACA_UTAKMICA')
alter table STATISTIKA_IGRACA
   drop constraint FK_STATISTIKA_IGRACA_UTAKMICA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STATISTIKA_UTAKMICE') and o.name = 'FK_STATISTIKA_UTAKMICE_UTAKMICA')
alter table STATISTIKA_UTAKMICE
   drop constraint FK_STATISTIKA_UTAKMICE_UTAKMICA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('STATISTIKA_UTAKMICE') and o.name = 'FK_STATISTIKA_UTAKMICE_KLUB')
alter table STATISTIKA_UTAKMICE
   drop constraint FK_STATISTIKA_UTAKMICE_KLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSFER') and o.name = 'FK_TRANSFER_IGRAC')
alter table TRANSFER
   drop constraint FK_TRANSFER_IGRAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSFER') and o.name = 'FK_TRANSFER_KLUB')
alter table TRANSFER
   drop constraint FK_TRANSFER_KLUB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UTAKMICA') and o.name = 'FK_UTAKMICA_STADION')
alter table UTAKMICA
   drop constraint FK_UTAKMICA_STADION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IGRAC')
            and   name  = 'IGRAC_KLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index IGRAC.IGRAC_KLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IGRAC')
            and   name  = 'POZICIJA_IGRACA_IGRAC_FK'
            and   indid > 0
            and   indid < 255)
   drop index IGRAC.POZICIJA_IGRACA_IGRAC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('IGRAC')
            and   type = 'U')
   drop table IGRAC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KLUB')
            and   type = 'U')
   drop table KLUB
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MENADZER')
            and   name  = 'MENADZER_KLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index MENADZER.MENADZER_KLUB_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MENADZER')
            and   type = 'U')
   drop table MENADZER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POZICIJA_IGRACA')
            and   type = 'U')
   drop table POZICIJA_IGRACA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RASPORED_UTAKMICA')
            and   name  = 'STADION_RASPORED_UTAKMICA_FK'
            and   indid > 0
            and   indid < 255)
   drop index RASPORED_UTAKMICA.STADION_RASPORED_UTAKMICA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RASPORED_UTAKMICA')
            and   type = 'U')
   drop table RASPORED_UTAKMICA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RASPORED_KLUB')
            and   name  = 'RASPORED_KLUB2_FK'
            and   indid > 0
            and   indid < 255)
   drop index RASPORED_KLUB.RASPORED_KLUB2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RASPORED_KLUB')
            and   name  = 'RASPORED_KLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index RASPORED_KLUB.RASPORED_KLUB_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RASPORED_KLUB')
            and   type = 'U')
   drop table RASPORED_KLUB
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STADION')
            and   type = 'U')
   drop table STADION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STATISTIKA_IGRACA')
            and   name  = 'STATISTIKA_IGRACA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index STATISTIKA_IGRACA.STATISTIKA_IGRACA2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STATISTIKA_IGRACA')
            and   name  = 'STATISTIKA_IGRACA_FK'
            and   indid > 0
            and   indid < 255)
   drop index STATISTIKA_IGRACA.STATISTIKA_IGRACA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STATISTIKA_IGRACA')
            and   type = 'U')
   drop table STATISTIKA_IGRACA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STATISTIKA_UTAKMICE')
            and   name  = 'STATISTIKA_UTAKMICE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index STATISTIKA_UTAKMICE.STATISTIKA_UTAKMICE2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('STATISTIKA_UTAKMICE')
            and   name  = 'STATISTIKA_UTAKMICE_FK'
            and   indid > 0
            and   indid < 255)
   drop index STATISTIKA_UTAKMICE.STATISTIKA_UTAKMICE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STATISTIKA_UTAKMICE')
            and   type = 'U')
   drop table STATISTIKA_UTAKMICE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSFER')
            and   name  = 'KLUB_TRANSFERI_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSFER.KLUB_TRANSFERI_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSFER')
            and   name  = 'IGRAC_TRANSFERI_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSFER.IGRAC_TRANSFERI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRANSFER')
            and   type = 'U')
   drop table TRANSFER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('UTAKMICA')
            and   name  = 'STADION_UTAKMICA_FK'
            and   indid > 0
            and   indid < 255)
   drop index UTAKMICA.STADION_UTAKMICA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UTAKMICA')
            and   type = 'U')
   drop table UTAKMICA
go

create schema Osoblje
go 

create schema Organizacija
go 

create schema Kosarka
go 

create schema Statistike
go 

create schema Rasporedi
go 


/*==============================================================*/
/* Table: IGRAC                                                 */
/*==============================================================*/
create table Osoblje.IGRAC (
   IDIGRAC              int                  identity,
   IME                  nvarchar(20)         not null,
   PREZIME              nvarchar(20)         null,
   GODINE               int                  not null,
   VISINA               numeric(6,2)           not null,
   TEZINA               numeric(6,2)              not null,
   POENI_UKUPNO          int                  not null,
   ASISTENCIJE_UKUPNO    int                  not null,
   SKOKOVI_UKUPNO        int                  not null,
   IDPOZICIJA_IGRACA     int                  not null,
   IDKLUB               int                  not null,
   constraint PK_IGRAC primary key (IDIGRAC)
)
go

/*==============================================================*/
/* Index: POZICIJA_IGRACA_IGRAC_FK                               */
/*==============================================================*/




create nonclustered index POZICIJA_IGRACA_IGRAC_FK on Osoblje.IGRAC (IDPOZICIJA_IGRACA ASC)
go

/*==============================================================*/
/* Index: IGRAC_KLUB_FK                                         */
/*==============================================================*/




create nonclustered index IGRAC_KLUB_FK on Osoblje.IGRAC (IDKLUB ASC)
go

/*==============================================================*/
/* Table: KLUB                                                  */
/*==============================================================*/
create table Organizacija.KLUB (
   IDKLUB               int                  identity,
   NAZIV                nvarchar(30)         not null,
   GODINA_NASTANKA       int                  not null,
   POBEDA               int                  not null,
   PORAZ                int                  not null,
   POSTIGNUTI_POENI      int                  not null,
   PRIMLJENI_POENI       int                  not null,
   constraint PK_KLUB primary key (IDKLUB)
)
go

/*==============================================================*/
/* Table: MENADZER                                              */
/*==============================================================*/
create table Osoblje.MENADZER (
   IDMENADZER           int                  identity,
   IDKLUB               int                  not null,
   IME                  nvarchar(20)         not null,
   PREZIME              nvarchar(20)         not null,
   GODINE               int                  not null,
   constraint PK_MENADZER primary key (IDMENADZER)
)
go

/*==============================================================*/
/* Index: MENADZER_KLUB_FK                                      */
/*==============================================================*/




create nonclustered index MENADZER_KLUB_FK on Osoblje.MENADZER (IDKLUB ASC)
go

/*==============================================================*/
/* Table: POZICIJA_IGRACA                                        */
/*==============================================================*/
create table Kosarka.POZICIJA_IGRACA (
   IDPOZICIJA_IGRACA     int                  identity,
   NAZIV                nvarchar(20)         not null,
   constraint PK_POZICIJA_IGRACA primary key (IDPOZICIJA_IGRACA)
)
go

/*==============================================================*/
/* Table: RASPORED_UTAKMICA                                      */
/*==============================================================*/
create table Rasporedi.RASPORED_UTAKMICA (
   IDRASPORED_UTAKMICA   int                  identity,
   IDSTADION            int                  not null,
   DATUM                date              not null,
   VREME                time             not null,
   constraint PK_RASPORED_UTAKMICA primary key (IDRASPORED_UTAKMICA)
)
go

/*==============================================================*/
/* Index: STADION_RASPORED_UTAKMICA_FK                           */
/*==============================================================*/




create nonclustered index STADION_RASPORED_UTAKMICA_FK on Rasporedi.RASPORED_UTAKMICA (IDSTADION ASC)
go

/*==============================================================*/
/* Table: RASPORED_KLUB                                         */
/*==============================================================*/
create table Rasporedi.RASPORED_KLUB (
   IDRASPORED_UTAKMICA   int                  not null,
   IDKLUB               int                  not null,
  
)
go

/*==============================================================*/
/* Index: RASPORED_KLUB_FK                                      */
/*==============================================================*/




create nonclustered index RASPORED_KLUB_FK on Rasporedi.RASPORED_KLUB (IDRASPORED_UTAKMICA ASC)
go

/*==============================================================*/
/* Index: RASPORED_KLUB2_FK                                     */
/*==============================================================*/




create nonclustered index RASPORED_KLUB2_FK on Rasporedi.RASPORED_KLUB (IDKLUB ASC)
go

/*==============================================================*/
/* Table: STADION                                               */
/*==============================================================*/
create table Organizacija.STADION (
   IDSTADION            int                  identity,
   NAZIV                nvarchar(50)         not null,
   GRAD                 nvarchar(20)         not null,
   KAPACITET            int                  not null,
   constraint PK_STADION primary key (IDSTADION)
)
go

/*==============================================================*/
/* Table: STATISTIKA_IGRACA                                      */
/*==============================================================*/
create table Statistike.STATISTIKA_IGRACA (
   IDUTAKMICA           int                  not null,
   IDIGRAC              int                  not null,
   BROJ_POENA            int                  null,
   BROJ_SKOKOVA          int                  null,
   BROJ_ASISTENCIJA      int                  null,
   constraint PK_STATISTIKA_IGRACA primary key (IDIGRAC, IDUTAKMICA)
)
go

--kreiranje tabele koja prati ko je kreirao neku tabelu (koristi se u DDL trigeru)
CREATE TABLE dbo.CreateTableInfo
(
	id int identity PRIMARY KEY,
	ImeTabele nvarchar(100),
	Komanda nvarchar(max),
	Korisnik nvarchar(100)
)
GO

--kreiranje tabele ErrorsInfo koja ce cuvati informacije o greskama
CREATE TABLE dbo.ErrorsInfo
(
   id int identity PRIMARY KEY,
   ErrorNumber int,
   ErrorSeverity int,
   ErrorLine int,
   ErrorState int,
   ErrorMessage nvarchar(max),
   ErrorProcedure nvarchar(max)
)
GO

/*==============================================================*/
/* Index: STATISTIKA_IGRACA_FK                                   */
/*==============================================================*/




create nonclustered index STATISTIKA_IGRACA_FK on Statistike.STATISTIKA_IGRACA (IDIGRAC ASC)
go

/*==============================================================*/
/* Index: STATISTIKA_IGRACA2_FK                                  */
/*==============================================================*/




create nonclustered index STATISTIKA_IGRACA2_FK on Statistike.STATISTIKA_IGRACA (IDUTAKMICA ASC)
go

/*==============================================================*/
/* Table: STATISTIKA_UTAKMICE                                    */
/*==============================================================*/
create table Statistike.STATISTIKA_UTAKMICE (
   IDUTAKMICA           int                  not null,
   IDKLUB               int                  not null,
   BROJ_POENA            int                  null,
   SUTEVI_ZA_DVA_POENA     int                  null,
   UBACENI_SUTEVI_ZA_DVA_POENA int                  null,
   SUTEVI_ZA_TRI_POENA     int                  null,
   UBACENI_SUTEVI_ZA_TRI_POENA int                  null,
   BROJ_SLOBODNIH_BACANJA int                  null,
   UBACENA_SLOBODNA_BACANJA int                  null,
   BROJ_FAULOVA          int                  null,
   constraint PK_STATISTIKA_UTAKMICE primary key (IDUTAKMICA, IDKLUB)
)
go

/*==============================================================*/
/* Index: STATISTIKA_UTAKMICE_FK                                 */
/*==============================================================*/




create nonclustered index STATISTIKA_UTAKMICE_FK on Statistike.STATISTIKA_UTAKMICE (IDUTAKMICA ASC)
go

/*==============================================================*/
/* Index: STATISTIKA_UTAKMICE2_FK                                */
/*==============================================================*/




create nonclustered index STATISTIKA_UTAKMICE2_FK on Statistike.STATISTIKA_UTAKMICE (IDKLUB ASC)
go

/*==============================================================*/
/* Table: TRANSFER                                              */
/*==============================================================*/
create table Kosarka.TRANSFER (
   IDTRANSFER           int                  identity,
   IDIGRAC              int                  not null,
   IDKLUB               int                  not null,
   DATUM_DOLASKA         date                 not null,
   DATUM_ODLASKA         date                 not null,
   KOLICINA_NOVCA        decimal              not null,
   constraint PK_TRANSFER primary key (IDTRANSFER)
)
go

/*==============================================================*/
/* Index: IGRAC_TRANSFERI_FK                                    */
/*==============================================================*/




create nonclustered index IGRAC_TRANSFERI_FK on Kosarka.TRANSFER (IDIGRAC ASC)
go

/*==============================================================*/
/* Index: KLUB_TRANSFERI_FK                                     */
/*==============================================================*/




create nonclustered index KLUB_TRANSFERI_FK on Kosarka.TRANSFER (IDKLUB ASC)
go

/*==============================================================*/
/* Table: UTAKMICA                                              */
/*==============================================================*/
create table Kosarka.UTAKMICA (
   IDUTAKMICA           int                  identity,
   IDSTADION            int                  not null,
   DATUM                date              not null,
   VREME                time             not null,
   constraint PK_UTAKMICA primary key (IDUTAKMICA)
)
go

/*==============================================================*/
/* Index: STADION_UTAKMICA_FK                                   */
/*==============================================================*/




create nonclustered index STADION_UTAKMICA_FK on Kosarka.UTAKMICA (IDSTADION ASC)
go

alter table Osoblje.IGRAC
   add constraint FK_IGRAC_KLUB foreign key (IDKLUB)
      references Organizacija.KLUB (IDKLUB)
go

alter table Osoblje.IGRAC
   add constraint FK_IGRAC_POZICIJA_IGRACA foreign key (IDPOZICIJA_IGRACA)
      references Kosarka.POZICIJA_IGRACA (IDPOZICIJA_IGRACA)
go

alter table Osoblje.MENADZER
   add constraint FK_MENADZER_KLUB foreign key (IDKLUB)
      references Organizacija.KLUB (IDKLUB)
go

alter table Rasporedi.RASPORED_UTAKMICA
   add constraint FK_RASPORED_STADION foreign key (IDSTADION)
      references Organizacija.STADION (IDSTADION)
go

alter table Rasporedi.RASPORED_KLUB
   add constraint FK_RASPORED_KLUB_RASPORED_UTAKMICA foreign key (IDRASPORED_UTAKMICA)
      references Rasporedi.RASPORED_UTAKMICA (IDRASPORED_UTAKMICA)
go

alter table Rasporedi.RASPORED_KLUB
   add constraint FK_RASPORED_KLUB_KLUB foreign key (IDKLUB)
      references Organizacija.KLUB (IDKLUB)
go

alter table Statistike.STATISTIKA_IGRACA
   add constraint FK_STATISTIKA_IGRACA_IGRAC foreign key (IDIGRAC)
      references Osoblje.IGRAC (IDIGRAC)
go

alter table Statistike.STATISTIKA_IGRACA
   add constraint FK_STATISTIKA_IGRACA_UTAKMICA foreign key (IDUTAKMICA)
      references Kosarka.UTAKMICA (IDUTAKMICA)
go

alter table Statistike.STATISTIKA_UTAKMICE
   add constraint FK_STATISTIKA_UTAKMICE_UTAKMICA foreign key (IDUTAKMICA)
      references Kosarka.UTAKMICA (IDUTAKMICA)
go

alter table Statistike.STATISTIKA_UTAKMICE
   add constraint FK_STATISTIKA_UTAKMICE_KLUB foreign key (IDKLUB)
      references Organizacija.KLUB (IDKLUB)
go

alter table Kosarka.TRANSFER
   add constraint FK_TRANSFER_IGRAC foreign key (IDIGRAC)
      references Osoblje.IGRAC (IDIGRAC)
go

alter table Kosarka.TRANSFER
   add constraint FK_TRANSFER_KLUB foreign key (IDKLUB)
      references Organizacija.KLUB (IDKLUB)
go

alter table Kosarka.UTAKMICA
   add constraint FK_UTAKMICA_STADION foreign key (IDSTADION)
      references Organizacija.STADION (IDSTADION)
go


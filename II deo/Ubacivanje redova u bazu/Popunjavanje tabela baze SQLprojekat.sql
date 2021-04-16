USE SQLprojekat
GO

--Ubacivanje redova u tabelu Pozicija_igraca

INSERT INTO Kosarka.POZICIJA_IGRACA(NAZIV)
VALUES
(N'Plejmejker'),
(N'Bek suter'),
(N'Krilo'),
(N'Krilni centar'),
(N'Centar')
GO


--Popunjavanje tabele Klub

INSERT INTO Organizacija.KLUB
( [NAZIV], [GODINA_NASTANKA], [POBEDA], [PORAZ], [POSTIGNUTI_POENI],[PRIMLJENI_POENI])
VALUES
(N'Los Angeles Lakers',    1947, 1, 0, 92, 78),
(N'Atlanta Hawks',         1946, 0, 1, 78, 92),
(N'Boston Celtics',        1946, 1, 0, 101, 99),
(N'Golden State Warriors', 1943, 0, 1, 99, 101),
(N'Cleveland Cavaliers',   1948, 1, 0, 102, 85),
(N'Miami Heat',            1949, 0, 1, 85, 102),
(N'Chicago Bulls',         1950, 0, 1, 75, 80),
(N'Denver Nuggets',        1939, 1, 0, 80, 75),
(N'Houston Rockets',       1945, 0, 1, 80, 100),
(N'Sacramento Kings',      1944, 1, 0, 100, 80)
GO

--Popunjavanje tabele Igrac

INSERT INTO Osoblje.IGRAC
([IME], [PREZIME], [GODINE], [VISINA], [TEZINA], [POENI_UKUPNO], [ASISTENCIJE_UKUPNO], [SKOKOVI_UKUPNO], [IDKLUB], [IDPOZICIJA_IGRACA])
VALUES
( N'Quinn',  N' Cook ' , '24',  '1.98 ',  '85 ', '13', '6', '4', '1', '1' ),
( N'Alex', N' Caruso ' , '22',  '2.03 ',  '88 ', '16', '4', '2', '1', '2' ),
( N'Devontae', N' Cacok ' , '25',  '2.06 ',  '88 ', '20', '5', '4', '1', '3' ),
( N'Avery',   N' Bradley ' , '23',  '2.10 ',  '90 ', '18', '4', '3', '1', '4' ),
( N'Kostas', N' Antetokounmpo ' , '26',  '2.12 ',  '93 ', '25', '3', '8', '1', '5' ),


( N'Charles', N' Brown Jr. ' , '25',  '1.97 ',  '83 ',   '9',  '4', '1', '2', '1' ),
( N'Vince',      N' Carter ' , '43',  '2.08 ',  '85 ',   '15', '6', '7', '2', '2' ),
( N'John',      N' Collins ' , '26',  '2.05 ',  '87.5 ', '17', '2', '4', '2', '3' ),
( N'Deadre',     N'Bembry  ' , '28',  '2.07 ',  '90 ',   '17', '3', '7', '2', '4' ),
( N'Clint',      N'Capela  ' , '25',  '2.13 ',  '92 ',   '20', '5', '11','2', '5' ),


( N'Carsen', N' Edwards ' , '23',  '1.91 ',  '80 ', '15', '5', '2', '3', '1' ),
( N'Javonte',  N' Green ' , '22',  '1.98 ',  '83 ', '18', '4', '3', '3', '2' ),
( N'Jaylen',   N' Brown ' , '23',  '2.03 ',  '85 ', '25', '3', '4', '3', '3' ),
( N'Enes',    N' Kanter ' , '26',  '2.10 ',  '95 ', '23', '4', '8', '3', '4' ),
( N'Tacko',     N'Fall' , '25',  '2.17 ',  '99 ', '20', '4', '12', '3', '5' ),


( N'Stephen', N' Curry ' , '24',  '1.89 ',  '81 ', '30', '9', '2', '4', '1' ),
( N'Damion',    N' Lee ' , '23',  '1.93 ',  '85 ', '13', '6', '4', '4', '2' ),
( N'Klay', N'Thompson  ' , '25',  '1.97 ',  '88 ', '28', '7', '4', '4', '3' ),
( N'Alen ',N' Smailagic ' , '21',  '2.08 ',  '90 ', '12', '5', '6', '4', '4' ),
( N'Dragan ', N'Bender' , '23',  '2.12 ',  '98 ', '16', '4', '8', '4', '5' ),




( N'Darius ',  N' Garland ' , '24',  '1.92 ',  '82 ', '13', '6', '4', '5', '1' ),
( N'Matthew ', N'Dellavedova  ' , '28',  '1.93 ',  '85 ', '20', '7', '2', '5', '2' ),
( N'Dante ',  N' Exum ' , '25',  '2.00 ',  '88 ', '22', '3', '4', '5', '3' ),
( N'Kevin ',  N' Love ' , '26',  '2.06 ',  '90 ', '23', '6', '7', '5', '4' ),
( N'Andre',   N'  Drummond' , '26',  '2.12 ',  '97 ', '24', '3', '10', '5', '5' ),


( N'Goran ', N'Dragic  ' , '25',  '1.93 ',  '81 ',   '26',  '7', '2', '6', '1' ),
( N'Tyler ',  N' Herro ' , '26',  '1.98 ',  '87 ',   '12', '3', '2', '6', '2' ),
( N'Jimmy ', N'  Butler' , '24',  '2.02 ',  '89 ', '25', '2', '4', '6', '3' ),
( N'Jae ',  N' Crowder ' , '28',  '2.09 ',  '99 ',   '10', '2', '8', '6', '4' ),
( N'Bam ',  N' Adebayo ' , '25',  '2.15 ',  '100 ',   '12', '3', '7','6', '5' ),


( N'Kris ',    N' Dunn ' , '23',  '1.87 ',  '81 ', '8', '5', '2', '7', '1' ),
( N'Ryan ', N' Arcidiacono ' , '22',  '1.93 ',  '83 ', '12', '5', '2', '7', '2' ),
( N'Zach ',  N'LaVine  ' , '24',  '1.98 ',  '86 ', '26', '5', '5', '7', '3' ),
( N'Cristiano ', N'Felicio  ' , '26',  '2.10 ',  '96 ', '12', '2', '6', '7', '4' ),
( N'Daniel ',   N' Gafford ' , '25',  '2.16 ',  '98.5 ', '17', '4', '8', '7', '5' ),


( N'Monte',   N' Morris ' , '24',  '1.87 ',  '80 ', '16', '7', '1', '8', '1' ),
( N'Will ',    N' Barton ' , '26',  '1.91 ',  '83 ', '10', '4', '3', '8', '2' ),
( N'PJ ',      N' Dozier ' , '23',  '1.97 ',  '89 ', '13', '3', '4', '8', '3' ),
( N'Paul ',   N'Millsap  ' , '30',  '2.05 ',  '95 ', '16', '3', '6', '8', '4' ),
( N'Nikola ',   N' Jokic ' , '24',  '2.10 ',  '98 ', '25', '8', '9', '8', '5' ),


( N'Eric ',  N' Gordon ' , '24',  '1.98 ',  '85 ', '10', '5', '7', '9', '1' ),
( N'James ',  N' Harden ' , '22',  '2.03 ',  '88 ', '10', '5', '7', '9', '2' ),
( N'Robert ',N' Covington ' , '25',  '2.06 ',  '88 ', '10', '5', '7', '9', '3' ),
( N'Jeff ',  N'Green  ' , '23',  '2.10 ',  '90 ', '10', '5', '7', '9', '4' ),
( N'Tyson ',  N' Chandler ' , '26',  '2.12 ',  '93 ', '10', '5', '7', '9', '5' ),


( N'Yogi ', N'Ferrel  ' , '23',  '1.97 ',  '83 ',   '15', '5', '7', '10', '1' ),
( N'Bogdan ',N' Bogdanovic ' , '25',  '2.08 ',  '85 ',   '13', '6', '8', '10', '2' ),
( N'Kent ',    N'Bazemore  ' , '26',  '2.05 ',  '87.5 ', '12', '7', '9', '10', '3' ),
( N'Nemanja ',  N'Bjelica  ' , '28',  '2.07 ',  '90 ',   '11', '8', '10', '10', '4' ),
( N'Alex ',   N'Len  ' , '25',  '2.13 ',  '92 ',   '10', '9', '11', '10', '5')
GO

--Ubacivanje redova u tabelu Menadzer

INSERT INTO Osoblje.MENADZER
([IME], [PREZIME], [GODINE], [IDKLUB])
VALUES
(N'Rob ', N' Pelinka', 42, 1),
(N'Danny ', N'Ainge ', 47, 2),
(N'Travis', N'Schlenk', 40, 3),
(N'Steve', N'Kerr', 40, 4),
(N'Koby ', N'Altman', 35, 5),
(N'Erik ', N'Spoelstra ', 44, 6),
(N'Jim ', N'Boylen ', 41, 7),
(N'Arturas ', N'Karnisovas ', 38, 8),
(N'Daryl ', N'Morey ', 40, 9),
(N'Vlade ', N'Divac ', 44, 10)
GO

--Ubacivanje redova u tabelu Stadion

INSERT INTO Organizacija.STADION
([NAZIV], [GRAD], [KAPACITET])
VALUES
('Staples Center', 'Los Angeles', '18997'),
('State Farm Arena', 'Atlanta', '19580'),
('TD Garden', 'Boston', '22000'),
('Chase Center', 'San Francisco', '21500'),
('Rocket Mortgage FieldHouse', 'Cleveland', '20000'),
('AmericanAirlines Arena', 'Miami', '23000'),
('United Center', 'Chicago', '21700'),
('Pepsi Center', 'Denver', '24000'),
('Toyota Center', 'Houston', '22000'),
('Golden 1 Center', 'Sacramento', '25000')
GO

--Ubacivanje redova u tabelu Raspored utakmica

INSERT INTO Rasporedi.RASPORED_UTAKMICA
([IDSTADION], [DATUM], [VREME])
VALUES
(2 , '20200907', '21:00'),
(4 , '20200708', '22:00'),
(6 , '20200806', '20:00'),
(8 , '20200809', '18:00'),
(9 , '20200808', '20:00'),
(2 , '20200712', '21:00'),
(4 , '20200608', '22:00'),
(6 , '20201006', '20:00'),
(8 , '20200621', '18:00'),
(9 , '20200818', '20:00'),
(3 , '20200807', '21:00'),
(4 , '20200715', '22:00'),
(6 , '20200726', '20:00'),
(8 , '20200809', '18:00')
GO

--Ubacivanje redova u tabelu Raspored_Klub

INSERT INTO Rasporedi.RASPORED_KLUB
([IDRASPORED_UTAKMICA], [IDKLUB])
VALUES
(1 , 2 ),
(1 , 1 ),
(2 , 4 ),
(2 , 3 ),
(3 , 6 ),
(3 , 5 ),
(4 , 8 ),
(4 , 7 ),
(5 , 9 ),
(5 , 10),
(6 , 2 ),
(6 , 1 ),
(7 , 4 ),
(7 , 3 ),
(8 , 6 ),
(8 , 5 ),
(9 , 8 ),
(9 , 7 ),
(10 , 9 ),
(10 , 10),
(11 , 2 ),
(11 , 1 ),
(12 , 4 ),
(12 , 3 ),
(13 , 6 ),
(13 , 5 ),
(14 , 8 ),
(14 , 7 )
GO

--Popunjavanje tabele Utakmica

INSERT INTO Kosarka.UTAKMICA
([IDSTADION], [DATUM], [VREME])
VALUES
(1 , '20200505', '22:00'),
(3 , '20200507', '21:00'),
(5 , '20200508', '20:00'),
(7 , '20200509', '18:00'),
(9 , '20200505', '20:00')
GO

--Popunjavanje tabele Statistika Utakmice

INSERT INTO Statistike.STATISTIKA_UTAKMICE
([IDUTAKMICA], [IDKLUB], [BROJ_POENA], [UBACENI_SUTEVI_ZA_DVA_POENA], [SUTEVI_ZA_DVA_POENA],[UBACENI_SUTEVI_ZA_TRI_POENA], [SUTEVI_ZA_TRI_POENA], [UBACENA_SLOBODNA_BACANJA],  [BROJ_SLOBODNIH_BACANJA], [BROJ_FAULOVA])
VALUES
('1','1',92 ,  '20', '60',  '15', '45' , '7', '14' , '20' ),
('1','2',78 ,  '20', '40',  '13', '26' , '9', '18' , '25' ),

('2','3',101 ,  '30', '50',  '10', '30' , '11', '22' , '17' ),
('2','4',99 ,  '15', '45',  '20', '50' , '9', '27' , '18' ),

('3','5',102 ,  '27', '40', '12', '20' , '12', '24' , '23' ),
('3','6',85 ,  '10', '20',  '15', '32' , '20', '25' , '25' ),

('4','7',75 ,  '10', '20',  '14', '42' , '13', '26' , '24' ),
('4','8',80 ,  '12', '36',  '15', '30' , '11', '22' , '27' ),

('5','9',80 ,  '10', '20',  '14', '42' , '18', '36' , '24' ),
('5','10',100 ,  '22', '44',  '15', '30' , '11', '22' , '27' )
GO

--Popounjavanje tabele Statistika Igraca

INSERT INTO Statistike.STATISTIKA_IGRACA
([IDUTAKMICA], [IDIGRAC], [BROJ_POENA],[BROJ_ASISTENCIJA] ,[BROJ_SKOKOVA])
VALUES
('1', '1', '13', '6', '4'),
('1', '2', '16', '4', '2'),
('1', '3', '20', '5', '4'),
('1', '4', '18', '4', '3'),
('1', '5', '25', '3', '8'),

('1', '6', '9',  '4', '1'),
('1', '7', '15', '6', '7'),
('1', '8', '17', '2', '4'),
('1', '9', '17', '3', '7'),
('1', '10', '20', '5', '11'),

('2', '11', '15', '5', '2'),
('2', '12', '18', '4', '3'),
('2', '13', '25', '3', '4'),
('2', '14', '23', '4', '8'),
('2', '15', '20', '4', '12'),

('2', '16', '30', '9', '2'),
('2', '17', '13', '6', '4'),
('2', '18', '28', '7', '4'),
('2', '19', '12', '5', '6'),
('2', '20', '16', '4', '8'),

('3', '21', '13', '6', '4'),
('3', '22', '20', '7', '2'),
('3', '23', '22', '3', '4'),
('3', '24', '23', '6', '7'),
('3', '25', '24', '3', '10'),

('3', '26', '26',  '7', '2'),
('3', '27',  '12', '3', '2'),
('3', '28', '25', '2', '4'),
('3', '29', '10', '2', '8'),
('3', '30',  '12', '3', '7'),

('4', '31', '8', '5', '2'),
('4', '32', '12', '5', '2'),
('4', '33', '26', '5', '5'),
('4', '34', '12', '2', '6'),
('4', '35', '17', '4', '8'),

('4', '36', '16', '7', '1'),
('4', '37', '10', '4', '3'),
('4', '38', '13', '3', '4'),
('4', '39', '16', '3', '6'),
('4', '40', '25', '8', '9'),

('5', '41', '10', '5', '2'),
('5', '42', '10', '5', '2'),
('5', '43', '10', '5', '5'),
('5', '44', '10', '2', '6'),
('5', '45', '10', '4', '8'),

('5', '46', '15', '5', '7'),
('5', '47', '13', '6', '8'),
('5', '48', '12', '7', '9'),
('5', '49', '11', '8', '10'),
('5', '50', '10', '9', '11')
GO

--Popunjavanje tabele Transfer

INSERT INTO Kosarka.[TRANSFER]
([IDIGRAC], [IDKLUB], [DATUM_DOLASKA], [DATUM_ODLASKA], [KOLICINA_NOVCA])
VALUES
(10 ,1 , '20180507','20200705',1200000),
(20 ,2 , '20160509','20200813',12000000),
(33 ,3 , '20180512','20190907',1500000),
(4 ,4 , '20160821','20200309',3450000),
(8 ,5 , '20180726','20191102',130000000),
(13 ,5 , '20160413','20200515',20000000),
(23 ,5 , '20180205','20201013',15500000),
(15 ,6 , '20160503','20190520',1000000),
(7 ,7 , '20180606','20200703',8000000),
(2 ,8 , '20170908','20180906',6500000)
GO


--Koriscenje OPENJSON funkcije

DECLARE @json NVARCHAR(MAX) = N'{"Klubovi":[{"Menadzer":{"ime":"Rob ","prezime":" Pelinka"},"IDKLUB":1,"NAZIV":"Los Angeles Lakers","GODINA_NASTANKA":1945,"POSTIGNUTI_POENI":123,"PRIMLJENI_POENI":13},{"Menadzer":{"ime":"Danny ","prezime":"Ainge "},"IDKLUB":2,"NAZIV":"Atlanta Hawks","GODINA_NASTANKA":1946,"POSTIGNUTI_POENI":78,"PRIMLJENI_POENI":92},{"Menadzer":{"ime":"Travis","prezime":"Schlenk"},"IDKLUB":3,"NAZIV":"Boston Celtics","GODINA_NASTANKA":1946,"POSTIGNUTI_POENI":200,"PRIMLJENI_POENI":99},{"Menadzer":{"ime":"Steve","prezime":"Kerr"},"IDKLUB":4,"NAZIV":"Golden State Warriors","GODINA_NASTANKA":1943,"POSTIGNUTI_POENI":99,"PRIMLJENI_POENI":101},{"Menadzer":{"ime":"Koby ","prezime":"Altman"},"IDKLUB":5,"NAZIV":"Cleveland Cavaliers","GODINA_NASTANKA":1948,"POSTIGNUTI_POENI":200,"PRIMLJENI_POENI":85},{"Menadzer":{"ime":"Erik ","prezime":"Spoelstra "},"IDKLUB":6,"NAZIV":"Miami Heat","GODINA_NASTANKA":1949,"POSTIGNUTI_POENI":85,"PRIMLJENI_POENI":102},{"Menadzer":{"ime":"Jim ","prezime":"Boylen "},"IDKLUB":7,"NAZIV":"Chicago Bulls","GODINA_NASTANKA":1950,"POSTIGNUTI_POENI":75,"PRIMLJENI_POENI":80},{"Menadzer":{"ime":"Arturas ","prezime":"Karnisovas "},"IDKLUB":8,"NAZIV":"Denver Nuggets","GODINA_NASTANKA":1949,"POSTIGNUTI_POENI":200,"PRIMLJENI_POENI":75},{"Menadzer":{"ime":"Daryl ","prezime":"Morey "},"IDKLUB":9,"NAZIV":"Houston Rockets","GODINA_NASTANKA":1945,"POSTIGNUTI_POENI":80,"PRIMLJENI_POENI":100},{"Menadzer":{"ime":"Vlade ","prezime":"Divac "},"IDKLUB":10,"NAZIV":"Sacramento Kings","GODINA_NASTANKA":1944,"POSTIGNUTI_POENI":200,"PRIMLJENI_POENI":80}]}'  
   
SELECT *
FROM OPENJSON ( @json , '$.Klubovi')  
WITH 
(   
    ImeMenadzera  VARCHAR(20) '$.Menadzer.ime',  
	PrezimeMenadzera  VARCHAR(20) '$.Menadzer.prezime',
	IDkluba int '$.IDKLUB',
	Naziv VARCHAR(20) '$.NAZIV',
	GodinaNastanka int '$.GODINA_NASTANKA',
	PostignutiPoeni int '$.POSTIGNUTI_POENI',
	PrimljeniPoeni int '$.PRIMLJENI_POENI'
 )
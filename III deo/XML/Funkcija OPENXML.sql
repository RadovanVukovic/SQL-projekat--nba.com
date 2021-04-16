-- Koriscenje OPENXML funkcije

DECLARE @idoc INT, @doc VARCHAR(1000);  
SET @doc ='  
<Klubovi>
  <Klub>
    <Menadzer ime="Rob " prezime=" Pelinka" />
    <IDKLUB>1</IDKLUB>
    <NAZIV>Los Angeles Lakers</NAZIV>
    <GODINA_NASTANKA>1945</GODINA_NASTANKA>
    <POSTIGNUTI_POENI>123</POSTIGNUTI_POENI>
    <PRIMLJENI_POENI>13</PRIMLJENI_POENI>
  </Klub>
  <Klub>
    <Menadzer ime="Danny " prezime="Ainge " />
    <IDKLUB>2</IDKLUB>
    <NAZIV>Atlanta Hawks</NAZIV>
    <GODINA_NASTANKA>1946</GODINA_NASTANKA>
    <POSTIGNUTI_POENI>78</POSTIGNUTI_POENI>
    <PRIMLJENI_POENI>92</PRIMLJENI_POENI>
  </Klub>
  <Klub>
    <Menadzer ime="Travis" prezime="Schlenk" />
    <IDKLUB>3</IDKLUB>
    <NAZIV>Boston Celtics</NAZIV>
    <GODINA_NASTANKA>1946</GODINA_NASTANKA>
    <POSTIGNUTI_POENI>200</POSTIGNUTI_POENI>
    <PRIMLJENI_POENI>99</PRIMLJENI_POENI>
  </Klub>
</Klubovi>

';  
 
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc;  
 
SELECT * FROM OPENXML(@idoc, '/Klubovi/Klub' , 1 )  
WITH 
(
	ImeMenadzera  VARCHAR(20) 'Menadzer/@ime',  
	PrezimeMenadzera  VARCHAR(20) 'Menadzer/@prezime',
	IDkluba int 'IDKLUB',
	Naziv VARCHAR(20) 'NAZIV',
	GodinaNastanka int 'GODINA_NASTANKA',
	PostignutiPoeni int 'POSTIGNUTI_POENI',
	PrimljeniPoeni int 'PRIMLJENI_POENI'
);  
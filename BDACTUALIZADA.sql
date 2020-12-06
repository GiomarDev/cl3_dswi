--CLINICA
USE MASTER 
GO 
IF DB_ID('CLINICA')IS NOT NULL
	DROP DATABASE CLINICA
GO 

CREATE DATABASE CLINICA
GO 

USE CLINICA
GO

CREATE TABLE ESPECIALIDAD(
	IDE_ESP			INT		NOT NULL PRIMARY KEY IDENTITY(1,1),
	DES_ESP			VARCHAR(30)	NOT NULL
)
GO 

INSERT INTO ESPECIALIDAD VALUES
('MEDICINA GENERAL'),
('PEDIATRIA'),
('GINECOLOGIA'),
('PSICOLOGIA'),
('MEDICINA ALTERNATIVA')
GO

CREATE TABLE DISTRITO(
 IDE_DIS INT	NOT NULL PRIMARY KEY IDENTITY(1,1),
 NOM_DIS VARCHAR(50)
)
GO

INSERT INTO DISTRITO(NOM_DIS) VALUES
('SURCO'),
('JESUS MARIA'),
('SAN ISIDRO'),
('LA MOLINA'),
('SAN MIGUEL'),
('MIRAFLORES'),
('BARRANCO'),
('CHORRILLOS'),
('SAN BORJA'),
('LINCE'),
('BRENA'),
('MAGDALENA'),
('RIMAC'),
('SURQUILLO'),
('PUEBLO LIBRE'),
('BELLAVISTA'),
('CALLAO'),
('SAN MARTIN DE PORRES'),
('SANTA ANITA'),
('LOS OLIVOS'),
('INDEPENDENCIA'),
('LIMA - CERCADO'),
('SAN LUIS'),
('EL AGUSTINO'),
('SAN JUAN DE LURIGANCHO'),
('ATE - VITARTE'),
('SAN JUAN DE MIRAFLORES'),
('CARMEN DE LA LEGUA'),
('COMAS'),
('VILLA MARIA DEL TRIUNFO'),
('VILLA EL SALVADOR'),
('LA PERLA'),
('VENTANILLA'),
('PUENTE PIEDRA'),
('CARABAYLLO'),
('SANTA MARIA'),
('LA PUNTA')
GO

CREATE TABLE DOCTOR(
	IDE_DOC		INT			NOT NULL PRIMARY KEY IDENTITY(1,1),
	NOM_DOC		VARCHAR(30)	NOT NULL,
	APE_DOC		VARCHAR(30)	NOT NULL,
	IDE_ESP		INT			NOT NULL REFERENCES ESPECIALIDAD,
	TEL_DOC		VARCHAR(15)	NOT NULL,
	COR_DOC		VARCHAR(50)	NOT NULL,
	IDE_DIS		INT			NOT NULL REFERENCES DISTRITO
)
GO 

INSERT INTO DOCTOR(NOM_DOC,APE_DOC,IDE_ESP,TEL_DOC,COR_DOC,IDE_DIS) VALUES
('JUANA ROSA','CALVO BRIONES','1','982258741','JCALV@GMAIL.COM','1'),
('JUAN','MEDICO HURTADO','2','982258742','JMEDI@GMAIL.COM','2'),
('CARLOS','CARDENAS JURADO','2','982258743','CCARD@GMAIL.COM','7'),
('CESAR AUGUSTO','OJEDA MENDOZA','3','982258744','COJED@GMAIL.COM','8'),
('JULIO ARMANDO','VEGA VEGA','1','982258745','JVEGA@GMAIL.COM','1'),
('ANA MARIA','FONSECA DE LA VEGA','4','982258746','AFONS@GMAIL.COM','7'),
('JOSE LUIS','PALACIOS MERZ','3','982258747','JPALA@GMAIL.COM','10'),
('RUBEN MARCO','LAZARO FERNANDEZ','1','982258748','RLAZA@GMAIL.COM','7'),
('PATRICIA','VIVANCO SECADA','1','982258749','PVIVA@GMAIL.COM','3'),
('RENATO IGNACIO','LOPEZ MOLINA','2','982258750','RLOPE@GMAIL.COM','2'),
('VERONICA VANESSA ','DRENZ LICAS','4','982258751','VDREN@GMAIL.COM','8'),
('GEIDI FERNANDA','SUAREZ VIVANCO','2','982258752','GSUAR@GMAIL.COM','9'),
('BELINDA MIA','CACERES ROCA','2','982258753','BCACE@GMAIL.COM','4'),
('CARLOS CESAR','LUDENA MENDOZA','3','982258754','CLUDE@GMAIL.COM','9'),
('MARCO JULIO','STEIN JURADO','3','982258755','MSTEI@GMAIL.COM','4'),
('ROSSANA MELISA','IGLESIA SANTANA','4','982258756','RIGLE@GMAIL.COM','3'),
('JOSE ANTONIO','CORONA SOTO','4','982258757','JCORO@GMAIL.COM','5'),
('RUBEN JORGE','DIAZ VERA','4','982258758','RDIAZ@GMAIL.COM','10'),
('LUCIA PATRICIA','FIGUEROA MINA','1','982258759','LFIGU@GMAIL.COM','4'),
('LUIS RENATO','POMA BRENZ','1','982258760','LPOMA@GMAIL.COM','6'),
('CONSUELO JUANA','FERNANDEZ ZAMORA','2','982258761','CFERN@GMAIL.COM','11'),
('MARORI DINA','TORRES RAMOS','1','982258762','MTORR@GMAIL.COM','3'),
('KARLA JOSEFA','ANDRADE CHANG','3','982258763','KANDR@GMAIL.COM','6'),
('CESAR PETER','CALLE DE LA CRUZ','4','982258764','CCALL@GMAIL.COM','11'),
('JOSELITO','VERA GARCIA','2','982258765','JVERA@GMAIL.COM','4'),
('CARLA MORIA','ORTIZ POLO','5','982258766','CORTI@GMAIL.COM','3'),
('JOSE RONALDO','PALACIOS URQUIAGA','5','982258767','JPALA@GMAIL.COM','5'),
('MARISOL CARMEN','MENDOZA DE LA CRUZ','5','982258768','MMEND@GMAIL.COM','3'),
('DOLORES LAURA','ROJAS JUAREZ','5','982258769','DROJA@GMAIL.COM','5'),
('TERESA ANITA','CARRANZA SOTO','5','982258770','TCARR@GMAIL.COM','4')
GO


CREATE TABLE PACIENTE(
	IDE_PAC		INT		NOT NULL PRIMARY KEY IDENTITY(1,1),
	NOM_PAC		VARCHAR(30)	NOT NULL,
	APE_PAC		VARCHAR(30)	NOT NULL,
	FNA_PAC		DATE		NOT NULL,
	FON_PAC		CHAR(15)	NOT NULL
)
GO

INSERT INTO PACIENTE VALUES('GREYSI','ROJAS VALVERDE','1985-01-05','985632585')
INSERT INTO PACIENTE VALUES('MARIA REYNA','FERNANDEZ HIJAR','1985-01-05','954521421')
INSERT INTO PACIENTE VALUES('JULIA ROSAS','IBARRA KYLAR','1985-10-05','998898956')
INSERT INTO PACIENTE VALUES('GUILANA','RUGERSON JIREL','1975-07-23','925212552')
INSERT INTO PACIENTE VALUES('GEIDI','DAMASO AGUIRRE','1965-05-15','969696554')
INSERT INTO PACIENTE VALUES('JANETH','ROMAN ESTRADA','1965-03-15','914452222')
INSERT INTO PACIENTE VALUES('MILAGROS','SILIPU JULTON','1972-05-25','965652585')
INSERT INTO PACIENTE VALUES('ROSA','CARRANZA LOPEZ','1975-11-10','978554552')
INSERT INTO PACIENTE VALUES('ALICIA','ERAZO ROJAS','1985-07-02','902255552')
INSERT INTO PACIENTE VALUES('ANA','HELLYGON RETUERTO','1965-12-05','921555222')
INSERT INTO PACIENTE VALUES('PILAR ROSA','RIOS JURADO','1965-12-07','915585855')
INSERT INTO PACIENTE VALUES('DORA','LUIS NICOLAS','1995-01-17','989656555')
INSERT INTO PACIENTE VALUES('MARGARITA','HERRERA ROJAS','1985-06-20','948587585')
INSERT INTO PACIENTE VALUES('DENISSE','GUILLERMO NICOLAS','1995-02-20','936336655')
INSERT INTO PACIENTE VALUES('DIANA','DIAZ DIAZ','1985-08-15','901445255')
INSERT INTO PACIENTE VALUES('ROCIO MARIA','WONG RIOS','1981-02-10','978855545')
INSERT INTO PACIENTE VALUES('SUSANA LIZBETH','POLAR GARCIA','1985-07-12','914411541')
INSERT INTO PACIENTE VALUES('MARLENE','LARCO RIMAC','1981-07-25','978887755')
INSERT INTO PACIENTE VALUES('LUCIA LINDA','MORENO ZACARIAS','1981-02-12','955555255')
INSERT INTO PACIENTE VALUES('ANABELLA','PLUTARCO JUAREZ','1981-03-15','948545412')

CREATE TABLE RECETA(
	NUM_REC		INT		NOT NULL PRIMARY KEY IDENTITY(1,1),
	FEC_REC		DATE	NOT NULL,
	IND_REC		VARCHAR(100)	NOT NULL,
	IDE_PAC		INT	NOT NULL,
	IDE_DOC		INT	NOT NULL,
	FOREIGN KEY (IDE_PAC) REFERENCES PACIENTE,
	FOREIGN KEY (IDE_DOC) REFERENCES DOCTOR
)
GO

INSERT INTO RECETA VALUES('2016-11-20','12 TABLETAS 8h/d','10','6')
INSERT INTO RECETA VALUES('2016-11-23','DESCANSO MEDICO','2','9')
INSERT INTO RECETA VALUES('2016-11-26','DESCANSO MEDICO','5','6')
INSERT INTO RECETA VALUES('2016-11-30','TOMAR EN AYUNAS','20','2')
INSERT INTO RECETA VALUES('2016-12-15','DESCANSO MEDICO','11','6')
INSERT INTO RECETA VALUES('2016-12-17','DESCANSO MEDICO','15','10')
INSERT INTO RECETA VALUES('2016-12-18','12 TABLETAS 8h/d','9','10')
INSERT INTO RECETA VALUES('2016-12-19','DESCANSO MEDICO','1','6')
INSERT INTO RECETA VALUES('2016-12-20','TOMAR EN AYUNAS','5','2')
INSERT INTO RECETA VALUES('2017-01-10','12 TABLETAS 8h/d','20','1')
INSERT INTO RECETA VALUES('2017-01-11','12 TABLETAS 8h/d','14','2')
INSERT INTO RECETA VALUES('2017-01-12','DESCANSO MEDICO','13','1')
INSERT INTO RECETA VALUES('2017-02-10','12 TABLETAS 8h/d','11','2')
INSERT INTO RECETA VALUES('2017-02-11','TOMAR EN AYUNAS','10','3')
INSERT INTO RECETA VALUES('2017-02-12','12 TABLETAS 8h/d','12','4')
INSERT INTO RECETA VALUES('2017-03-13','DESCANSO MEDICO','13','8')
INSERT INTO RECETA VALUES('2017-03-14','12 TABLETAS 8h/d','14','5')
INSERT INTO RECETA VALUES('2017-03-15','DESCANSO MEDICO','18','3')
INSERT INTO RECETA VALUES('2017-04-10','TOMAR EN AYUNAS','17','5')
INSERT INTO RECETA VALUES('2017-04-11','12 TABLETAS 8h/d','10','2')
INSERT INTO RECETA VALUES('2017-04-12','TOMAR EN AYUNAS','20','7')
INSERT INTO RECETA VALUES('2017-05-14','DESCANSO MEDICO','12','1')
INSERT INTO RECETA VALUES('2017-05-15','12 TABLETAS 8h/d','10','2')
INSERT INTO RECETA VALUES('2017-06-10','DESCANSO MEDICO','1','9')
INSERT INTO RECETA VALUES('2017-06-13','12 TABLETAS 8h/d','2','10')
INSERT INTO RECETA VALUES('2018-01-11','12 TABLETAS 8h/d','14','2')
INSERT INTO RECETA VALUES('2018-01-12','DESCANSO MEDICO','13','1')
INSERT INTO RECETA VALUES('2018-02-10','12 TABLETAS 8h/d','11','2')
INSERT INTO RECETA VALUES('2018-02-11','TOMAR EN AYUNAS','10','3')
INSERT INTO RECETA VALUES('2018-02-12','12 TABLETAS 8h/d','12','4')
INSERT INTO RECETA VALUES('2018-03-13','DESCANSO MEDICO','13','8')
INSERT INTO RECETA VALUES('2018-03-14','12 TABLETAS 8h/d','14','5')
INSERT INTO RECETA VALUES('2018-03-15','DESCANSO MEDICO','18','3')
INSERT INTO RECETA VALUES('2018-04-10','TOMAR EN AYUNAS','17','5')
INSERT INTO RECETA VALUES('2018-04-11','12 TABLETAS 8h/d','10','2')
INSERT INTO RECETA VALUES('2018-04-12','TOMAR EN AYUNAS','20','7')
INSERT INTO RECETA VALUES('2018-05-14','DESCANSO MEDICO','12','1')
INSERT INTO RECETA VALUES('2018-05-15','12 TABLETAS 8h/d','10','2')
INSERT INTO RECETA VALUES('2018-06-10','DESCANSO MEDICO','1','9')
INSERT INTO RECETA VALUES('2018-06-13','12 TABLETAS 8h/d','2','10')

SELECT * FROM ESPECIALIDAD
SELECT * FROM DOCTOR
SELECT * FROM PACIENTE
SELECT * FROM RECETA
SELECT * FROM DISTRITO
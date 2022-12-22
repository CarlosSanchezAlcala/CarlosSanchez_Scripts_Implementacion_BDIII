------------------------------------------------------------------------ INICIAR EN ORACLE DEVELOPER:

------------------------------------------------------------------------ TABLAS:

-- TABLA UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPAR varchar2(100)  NOT NULL,
    PROVI varchar2(100)  NOT NULL,
    DISTRI varchar2(100)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
) ;

--- TABLA USUARIO
CREATE TABLE USUARIO (
    IDUSU int  NOT NULL,
    NOMUSU varchar2(100)  NOT NULL,
    APEPATUSU varchar2(100)  NOT NULL,
    APEMATUSU varchar2(100)  NOT NULL,
    DNIUSU char(8)  NOT NULL,
    PASSUSU varchar2(50)  NOT NULL,
    LEVEUSU char(1)  NOT NULL,
    CORUSU varchar2(100)  NOT NULL,
    CELUSU char(9)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    DIRUSU varchar2(100)  NOT NULL,
    TURUSU char(1)  NOT NULL,
    ESTUSU char(1) DEFAULT 'A',
    CONSTRAINT USUARIO_pk PRIMARY KEY (IDUSU)
) ;

-- TABLA CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL,
    NOMCLI varchar2(100)  NOT NULL,
    APEPATCLI varchar2(100)  NOT NULL,
    APEMATCLI varchar2(100)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    CORCLI varchar2(100)  NULL,
    CELCLI char(9)  NULL,
    CODUBI char(6)  NOT NULL,
    DIRCLI varchar2(100)  NOT NULL,
    ESTCLI char(1) DEFAULT 'A',
    CONSTRAINT CLIENTE_pk PRIMARY KEY (IDCLI)
) ;

-- TABLA PRODUCTO
CREATE TABLE PRODUCTO (
    IDPROD int  NOT NULL,
    NOMPROD varchar2(50)  NOT NULL,
    TIPOPROD varchar2(1)  NOT NULL,
    DESPROD varchar2(300)  NOT NULL,
    PREPROD number(5,2)  NOT NULL,
    STOCKPROD int  NOT NULL,
    ESTPROD char(1) DEFAULT 'A',
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (IDPROD)
) ;

-- TABLA PROVEEDOR
CREATE TABLE PROVEEDOR (
    IDPROV int  NOT NULL,
    RAZSOCPROV varchar2(200)  NOT NULL,
    RUCPROV char(11)  NOT NULL,
    EMAIPROV varchar2(50)  NOT NULL,
    CELPROV char(9)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    DIRPROV varchar2(100)  NOT NULL,
    ESTPROV char(1) DEFAULT 'A',
    CONSTRAINT PROVEEDOR_pk PRIMARY KEY (IDPROV)
) ;

-- TABLA VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL,
    FECVEN date  NOT NULL,
    IDUSU int  NOT NULL,
    IDCLI int  NOT NULL,
    TIPOVEN char(1)  NOT NULL,
    TIPOPAG char(1)  NOT NULL,
	TOTALVEN decimal(10,2) NOT NULL,
    ESTVEN char(1) DEFAULT 'A',
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVEN)
) ;

-- TABLA VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int  NOT NULL,
    IDVEN int  NOT NULL,
    CANTVEND int  NOT NULL,
    SUBTOTVEN decimal(10,2)  NOT NULL,
    IDPROD int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENDET)
) ;

-- TABLA COMPRA
CREATE TABLE COMPRA (
    IDCOM int  NOT NULL,
    FECCOM date  NOT NULL,
    IDUSU int  NOT NULL,
    IDPROV int  NOT NULL,
	TOTALCOM decimal(10,2) NOT NULL,
    ESTCOM char(1) DEFAULT 'A',
    CONSTRAINT COMPRA_pk PRIMARY KEY (IDCOM)
) ;

-- TABLA COMPRA_DETALLE
CREATE TABLE COMPRA_DETALLE (
    IDCOMDET int  NOT NULL,
    IDCOM int  NOT NULL,
    CANTPRO int  NOT NULL,
    SUBTOTALCOMP decimal(10,2)  NOT NULL,
    IDPROD int  NOT NULL,
    CONSTRAINT COMPRA_DETALLE_pk PRIMARY KEY (IDCOMDET)
) ;




------------------------------------------------------------------------ FOREIGN KEYS:

-- Relación entre CLIENTE-UBIGEO
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

-- Relación entre COMPRA_DETALLE-COMPRA
ALTER TABLE COMPRA_DETALLE ADD CONSTRAINT COMPRA_DETALLE_COMPRA FOREIGN KEY (IDCOM) REFERENCES COMPRA (IDCOM);

-- Relación entre COMPRA_DETALLE-PRODUCTO
ALTER TABLE COMPRA_DETALLE ADD CONSTRAINT COMPRA_DETALLE_PRODUCTO FOREIGN KEY (IDPROD) REFERENCES PRODUCTO (IDPROD);

-- Relación entre COMPRA-PROVEEDOR
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_PROVEEDOR FOREIGN KEY (IDPROV) REFERENCES PROVEEDOR (IDPROV);

-- Relación entre COMPRA-USUARIO
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_USUARIO FOREIGN KEY (IDUSU) REFERENCES USUARIO (IDUSU);

-- Relación entre PROVEEDOR-UBIGEO
ALTER TABLE PROVEEDOR ADD CONSTRAINT PROVEEDOR_UBIGEO FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

-- Relación entre USUARIO-UBIGEO
ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_UBIGEO FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

-- Relación entre VENTA-CLIENTE
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (IDCLI) REFERENCES CLIENTE (IDCLI);

-- Relación entre VENTA_DETALLE-PRODUCTO
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO FOREIGN KEY (IDPROD) REFERENCES PRODUCTO (IDPROD);

-- Relación entre VENTA_DETALLE-VENTA
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (IDVEN) REFERENCES VENTA (IDVEN);

-- Relación entre VENTA-USUARIO
ALTER TABLE VENTA ADD CONSTRAINT VENTA_USUARIO FOREIGN KEY (IDUSU) REFERENCES USUARIO (IDUSU);




------------------------------------------------------------------------ SECUENCIAS:

-- INCREMENTO INC_USU -- USUARIO
CREATE SEQUENCE INC_USU START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_CLI -- CLIENTE
CREATE SEQUENCE INC_CLI START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_PROD -- PRODUCTO
CREATE SEQUENCE INC_PROD START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_PROV -- PROVEEDOR
CREATE SEQUENCE INC_PROV START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_VEN -- VENTA
CREATE SEQUENCE INC_VEN START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_VENDET -- VENTA:DETALLE
CREATE SEQUENCE INC_VENDET START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_COM -- COMPRA
CREATE SEQUENCE INC_COM START WITH 1 INCREMENT BY 1 ORDER;

-- INCREMENTO INC_COMDET -- COMPRA:DETALLE
CREATE SEQUENCE INC_COMDET START WITH 1 INCREMENT BY 1 ORDER;




------------------------------------------------------------------------ TRIGGERS:

-- AUTOINCREMENTABLE TRG_INC_USU -- USUARIO
CREATE TRIGGER TRG_INC_USU
BEFORE INSERT ON USUARIO
FOR EACH ROW
BEGIN

	SELECT INC_USU.NEXTVAL INTO :NEW.IDUSU
	FROM DUAL;

END;

-- AUTOINCREMENTABLE TRG_INC_CLI -- CLIENTE
CREATE TRIGGER TRG_INC_CLI
BEFORE INSERT ON CLIENTE
FOR EACH ROW

	BEGIN SELECT INC_CLI.NEXTVAL INTO :NEW.IDCLI
	FROM DUAL;

END;

-- AUTOINCREMENTABLE TRG_INC_PROD -- PRODUCTO
CREATE TRIGGER TRG_INC_PROD
BEFORE INSERT ON PRODUCTO
FOR EACH ROW

	BEGIN SELECT INC_PROD.NEXTVAL INTO :NEW.IDPROD
	FROM DUAL;

END;

-- AUTOINCREMENTABLE TRG_INC_PROV -- PROVEEDOR
CREATE TRIGGER TRG_INC_PROV
BEFORE INSERT ON PROVEEDOR
FOR EACH ROW
BEGIN

	SELECT INC_PROV.NEXTVAL INTO :NEW.IDPROV
	FROM DUAL;

END;

-- AUTOINCREMENTABLE TRG_INC_VEN -- VENTA
CREATE TRIGGER TRG_INC_VEN
BEFORE INSERT ON VENTA
FOR EACH ROW
BEGIN

	SELECT INC_VEN.NEXTVAL INTO :NEW.IDVEN
	FROM DUAL;

END;

-- AUTOINCREMENTABLE TRG_INC_VENDET -- VENTA
CREATE TRIGGER TRG_INC_VENDET
BEFORE INSERT ON VENTA_DETALLE
FOR EACH ROW
BEGIN

	SELECT INC_VENDET.NEXTVAL INTO :NEW.IDVENDET
	FROM DUAL;
	
END;

-- AUTOINCREMENTABLE TRG_INC_COM -- COMPRA
CREATE TRIGGER TRG_INC_COM
BEFORE INSERT ON COMPRA
FOR EACH ROW
BEGIN

	SELECT INC_COM.NEXTVAL INTO :NEW.IDCOM
	FROM DUAL;

END;

-- AUTOINCREMENTABLE TRG_INC_COMDET -- COMPRA:DETALLE
CREATE TRIGGER TRG_INC_COMDET
BEFORE INSERT ON COMPRA_DETALLE
FOR EACH ROW
BEGIN

	SELECT INC_COMDET.NEXTVAL INTO :NEW.IDCOMDET
	FROM DUAL;

END;

-- RESTAR EL STOCK DE PRODUCTO
CREATE OR REPLACE TRIGGER RESTAR_STOCK
AFTER INSERT ON VENTA_DETALLE
FOR EACH ROW
DECLARE
BEGIN

	UPDATE PRODUCTO SET
	STOCKPROD = STOCKPROD - :NEW.CANTVEND
	WHERE IDPROD = :NEW.IDPROD;

END;

-- SUMAR EL STOCK DE PRODUCTO
CREATE OR REPLACE TRIGGER SUMAR_STOCK
AFTER INSERT ON COMPRA_DETALLE
FOR EACH ROW
DECLARE
BEGIN

	UPDATE PRODUCTO SET
	STOCKPROD = STOCKPROD + :NEW.CANTPRO
	WHERE IDPROD = :NEW.IDPROD;

END;




------------------------------------------------------------------------ REGISTROS:

-- DATA UBIGEO
INSERT ALL
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150101'		,'LIMA'		,'LIMA'			,'LIMA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150102'		,'LIMA'		,'LIMA'			,'ANCON')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150103'		,'LIMA'		,'LIMA'			,'ATE')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150104'		,'LIMA'		,'LIMA'			,'BARRANCO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150105'		,'LIMA'		,'LIMA'			,'BREÑA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150106'		,'LIMA'		,'LIMA'			,'CARABAYLLO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150107'		,'LIMA'		,'LIMA'			,'CHACLACAYO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150108'		,'LIMA'		,'LIMA'			,'CHORRILLOS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150109'		,'LIMA'		,'LIMA'			,'CIENEGUILLA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150110'		,'LIMA'		,'LIMA'			,'COMAS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150111'		,'LIMA'		,'LIMA'			,'EL AGUSTINO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150112'		,'LIMA'		,'LIMA'			,'INDEPENDENCIA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150113'		,'LIMA'		,'LIMA'			,'JESUS MARIA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150114'		,'LIMA'		,'LIMA'			,'LA MOLINA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150115'		,'LIMA'		,'LIMA'			,'LA VICTORIA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150116'		,'LIMA'		,'LIMA'			,'LINCE')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150117'		,'LIMA'		,'LIMA'			,'LOS OLIVOS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150118'		,'LIMA'		,'LIMA'			,'LURIGANCHO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150119'		,'LIMA'		,'LIMA'			,'LURIN')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150120'		,'LIMA'		,'LIMA'			,'MAGDALENA DEL MAR')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150121'		,'LIMA'		,'LIMA'			,'PUEBLO LIBRE')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150122'		,'LIMA'		,'LIMA'			,'MIRAFLORES')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150123'		,'LIMA'		,'LIMA'			,'PACHACAMAC')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150124'		,'LIMA'		,'LIMA'			,'PUCUSANA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150125'		,'LIMA'		,'LIMA'			,'PUENTE PIEDRA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150126'		,'LIMA'		,'LIMA'			,'PUNTA HERMOSA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150127'		,'LIMA'		,'LIMA'			,'PUNTA NEGRA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150128'		,'LIMA'		,'LIMA'			,'RIMAC')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150129'		,'LIMA'		,'LIMA'			,'SAN BARTOLO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150130'		,'LIMA'		,'LIMA'			,'SAN BORJA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150131'		,'LIMA'		,'LIMA'			,'SAN ISIDRO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150132'		,'LIMA'		,'LIMA'			,'SAN JUAN DE LURIGANCHO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150133'		,'LIMA'		,'LIMA'			,'SAN JUAN DE MIRAFLORES')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150134'		,'LIMA'		,'LIMA'			,'SAN LUIS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150135'		,'LIMA'		,'LIMA'			,'SAN MARTIN DE PORRES')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150136'		,'LIMA'		,'LIMA'			,'SAN MIGUEL')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150137'		,'LIMA'		,'LIMA'			,'SANTA ANITA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150138'		,'LIMA'		,'LIMA'			,'SANTA MARIA DEL MAR')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150139'		,'LIMA'		,'LIMA'			,'SANTA ROSA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150140'		,'LIMA'		,'LIMA'			,'SANTIAGO DE SURCO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150141'		,'LIMA'		,'LIMA'			,'SURQUILLO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150142'		,'LIMA'		,'LIMA'			,'VILLA EL SALVADOR')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150143'		,'LIMA'		,'LIMA'			,'VILLA MARIA DEL TRIUNFO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150201'		,'LIMA'		,'BARRANCA'		,'BARRANCA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150202'		,'LIMA'		,'BARRANCA'		,'PARAMONGA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150203'		,'LIMA'		,'BARRANCA'		,'PATIVILCA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150204'		,'LIMA'		,'BARRANCA'		,'SUPE')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150205'		,'LIMA'		,'BARRANCA'		,'SUPE PUERTO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150301'		,'LIMA'		,'CAJATAMBO'	,'CAJATAMBO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150302'		,'LIMA'		,'CAJATAMBO'	,'COPA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150303'		,'LIMA'		,'CAJATAMBO'	,'GORGOR')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150304'		,'LIMA'		,'CAJATAMBO'	,'HUANCAPON')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150305'		,'LIMA'		,'CAJATAMBO'	,'MANAS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150401'		,'LIMA'		,'CANTA'		,'CANTA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150402'		,'LIMA'		,'CANTA'		,'ARAHUAY')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150403'		,'LIMA'		,'CANTA'		,'HUAMANTANGA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150404'		,'LIMA'		,'CANTA'		,'HUAROS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150405'		,'LIMA'		,'CANTA'		,'LACHAQUI')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150406'		,'LIMA'		,'CANTA'		,'SAN BUENAVENTURA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150407'		,'LIMA'		,'CANTA'		,'SANTA ROSA DE QUIVES')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150501'		,'LIMA'		,'CAÑETE'		,'SAN VICENTE DE CAÑETE')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150502'		,'LIMA'		,'CAÑETE'		,'ASIA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150503'		,'LIMA'		,'CAÑETE'		,'CALANGO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150504'		,'LIMA'		,'CAÑETE'		,'CERRO AZUL')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150505'		,'LIMA'		,'CAÑETE'		,'CHILCA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150506'		,'LIMA'		,'CAÑETE'		,'COAYLLO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150507'		,'LIMA'		,'CAÑETE'		,'IMPERIAL')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150508'		,'LIMA'		,'CAÑETE'		,'LUNAHUANA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150509'		,'LIMA'		,'CAÑETE'		,'MALA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150510'		,'LIMA'		,'CAÑETE'		,'NUEVO IMPERIAL')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150511'		,'LIMA'		,'CAÑETE'		,'PACARAN')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150512'		,'LIMA'		,'CAÑETE'		,'QUILMANA')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150513'		,'LIMA'		,'CAÑETE'		,'SAN ANTONIO')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150514'		,'LIMA'		,'CAÑETE'		,'SAN LUIS')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150515'		,'LIMA'		,'CAÑETE'		,'SANTA CRUZ DE FLORES')
    INTO UBIGEO (CODUBI, DEPAR, PROVI, DISTRI) VALUES ('150516'		,'LIMA'		,'CAÑETE'		,'ZUÑIGA')
    SELECT * FROM DUAL
COMMIT;

-- DATA EMPLEADO
INSERT ALL
    INTO USUARIO (NOMUSU, APEPATUSU, APEMATUSU, DNIUSU, PASSUSU, LEVEUSU, CORUSU, CELUSU, CODUBI, DIRUSU, TURUSU) VALUES ('CARLOS EDIDSON'	,'SANCHEZ'	,'ALCALA'	,'73829932'		,'5417bf2638865eb2da1d3f0260fdb0a9'		,'1'	,'CarlosS789789@hotmail.com'		,'965879417'	,'150504'	,'Av. Alfonso Ugarte 1345'	,'N')
    INTO USUARIO (NOMUSU, APEPATUSU, APEMATUSU, DNIUSU, PASSUSU, LEVEUSU, CORUSU, CELUSU, CODUBI, DIRUSU, TURUSU) VALUES ('NAOMI SHANTAL'	,'CAMA'		,'ELIAS'	,'75248569'		,'424d63770da24e36dc803d5577052b15'		,'2'	,'CamaNaomiShantal@hotmail.com'		,'963521458'	,'150506'	,'Calle Alfonso Guadalupe'	,'T')
    SELECT * FROM DUAL
COMMIT;

-- DATA CLIENTE
INSERT ALL
    INTO CLIENTE (NOMCLI, APEPATCLI, APEMATCLI, DNICLI, CORCLI, CELCLI, CODUBI, DIRCLI) VALUES ('JOSE ANTONIO'		,'CAMPOS'		,'ZALAZAR'		,'87965465'		,'JoseCampos123@hotmail.com'	,'989786787'	,'150501'	,'Av. Mariscal Benavides 1534')
    INTO CLIENTE (NOMCLI, APEPATCLI, APEMATCLI, DNICLI, CORCLI, CELCLI, CODUBI, DIRCLI) VALUES ('JACINTA BELINDA'	,'ERLINDA'		,'CAMPOS'		,'87967856'		,'JacintaCampos@hotmail.com'	,'989876543'	,'150501'	,'Av. Mariscal Caceres 1524')
    INTO CLIENTE (NOMCLI, APEPATCLI, APEMATCLI, DNICLI, CORCLI, CELCLI, CODUBI, DIRCLI) VALUES ('HERLINDA PAULA'	,'MANRIQUE'		,'QUISPE'		,'76876897'		,'HerlindaP@gmail.com'			,'900878987'	,'150506'	,'Jr. Oggings 3421')
    INTO CLIENTE (NOMCLI, APEPATCLI, APEMATCLI, DNICLI, CORCLI, CELCLI, CODUBI, DIRCLI) VALUES ('OMAR FELIPE'		,'ARIAS'		,'MANCO'		,'89700009'		,'AriasArias@outlook.com'		,'980786756'	,'150504'	,'Calle Alfonso Ugarte 1234')
    SELECT * FROM DUAL
COMMIT;

-- DATA PRODUCTO
INSERT ALL
    INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Arroz Chaufa'				,'N'	,'Cerdo.'						,'15,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Arroz Chaufa'				,'N'	,'Pollo.'						,'12,00'	,'100')
    INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Carapulcra con Sopa Seca'	,'N'	,'Cerdo.'						,'20,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Carapulcra con Sopa Seca'	,'N'	,'Pollo.'						,'15,00'	,'100')
    INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Carapulcra'					,'N'	,'Cerdo.'						,'13,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Carapulcra'					,'N'	,'Pollo.'						,'9,00'		,'100')
    INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Sopa Seca'					,'N'	,'Cerdo.'						,'13,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Sopa Seca'					,'N'	,'Pollo.'						,'9,00'		,'100')
    INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Cau Cau'					,'N'	,'Mondongo.'					,'15,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Cau Cau'					,'N'	,'Pollo.'						,'13,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Cau Cau'					,'N'	,'Cerdo.'						,'16,00'	,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Hamburguesa'				,'C'	,'Pollo.'						,'5,00'		,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Hamburguesa'				,'C'	,'Carne.'						,'5,00'		,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Hamburguesa'				,'C'	,'Chorizo.'						,'6,00'		,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Hamburguesa'				,'C'	,'Pollo Deshilachado.'			,'7,00'		,'100')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Inka Kola 1/2 L'			,'B'	,'Descartable.'					,'5,00'		,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Inka Kola 1/2 L'			,'B'	,'Vidrio.'						,'4,00'		,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Inka Kola 1 L'				,'B'	,'Descartable.'					,'11,00'	,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Inka Kola 1 L'				,'B'	,'Vidrio.'						,'10,00'	,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Coca Cola 1 1/2 L'			,'B'	,'Descartable.'					,'13,00'	,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Coca Cola 1 1/2 L'			,'B'	,'Vidrio.'						,'12,00'	,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Coca Cola 3 L'				,'B'	,'Descartable.'					,'15,00'	,'200')
	INTO PRODUCTO (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD) VALUES ('Coca Cola 3 L'				,'B'	,'Vidrio.'						,'14,00'	,'200')
    SELECT * FROM DUAL
COMMIT;

-- DATA PROVEEDOR
INSERT ALL
    INTO PROVEEDOR (RAZSOCPROV, RUCPROV, EMAIPROV, CELPROV, CODUBI, DIRPROV) VALUES ('PROAGRO PERUANOS'			,'20781362943'		,'proagro.peruanos@gmail.com'		,'956219873'	,'150504'	,'CALLE SIMON BOLIVAR 7894')
    INTO PROVEEDOR (RAZSOCPROV, RUCPROV, EMAIPROV, CELPROV, CODUBI, DIRPROV) VALUES ('AVÍCOLA TRANSAVIC'		,'20598462835'		,'avícolatransavic@gmail.com'		,'976183761'	,'150501'	,'AV. NUEVA CALLE CERRADA 8563')
    INTO PROVEEDOR (RAZSOCPROV, RUCPROV, EMAIPROV, CELPROV, CODUBI, DIRPROV) VALUES ('CARNICERIA FIDELITA'		,'20545872654'		,'carniceriafideli@gmail.com'		,'956219821'	,'150506'	,'JR. VILLA NUEVA 7825')
    INTO PROVEEDOR (RAZSOCPROV, RUCPROV, EMAIPROV, CELPROV, CODUBI, DIRPROV) VALUES ('PESCADO FRESQUITO'		,'20479534208'		,'arrozelblanquito@gmail.com'		,'946753723'	,'150501'	,'NO ENCONTRADA EN SUNAT')
    INTO PROVEEDOR (RAZSOCPROV, RUCPROV, EMAIPROV, CELPROV, CODUBI, DIRPROV) VALUES ('ARROZ EL QUEMAITO'		,'20568713629'		,'pescadofresquito@gmail.com'		,'929127648'	,'150506'	,'CALLE MARISCAL BENAVIDES 7863')
    SELECT * FROM DUAL
COMMIT;

-- DATA VENTA:
INSERT ALL
    INTO VENTA (FECVEN, IDUSU, IDCLI, TIPOVEN, TIPOPAG, TOTALVEN) VALUES ('06/11/22'	,'1'	,'1'	,'D'	,'E'	,'50,00')
    INTO VENTA (FECVEN, IDUSU, IDCLI, TIPOVEN, TIPOPAG, TOTALVEN) VALUES ('06/11/22'	,'1'	,'2'	,'D'	,'E'	,'50,00')
    INTO VENTA (FECVEN, IDUSU, IDCLI, TIPOVEN, TIPOPAG, TOTALVEN) VALUES ('06/11/22'	,'1'	,'3'	,'D'	,'E'	,'50,00')
SELECT * FROM DUAL
COMMIT;

-- DATA VENTA_DETALLE:
INSERT ALL
    INTO VENTA_DETALLE (IDVEN, CANTVEND, SUBTOTVEN, IDPROD) VALUES ('1'		,'5'	,'50,00'	,'19')
    INTO VENTA_DETALLE (IDVEN, CANTVEND, SUBTOTVEN, IDPROD) VALUES ('2'		,'5'	,'50,00'	,'19')
    INTO VENTA_DETALLE (IDVEN, CANTVEND, SUBTOTVEN, IDPROD) VALUES ('3'		,'5'	,'50,00'	,'19')
SELECT * FROM DUAL
COMMIT;

-- DATA COMPRA:
INSERT ALL
    INTO COMPRA (FECCOM, IDUSU, IDPROV, TOTALCOM) VALUES ('06/11/22'	,'1'	,'1'	,'50,00')
    INTO COMPRA (FECCOM, IDUSU, IDPROV, TOTALCOM) VALUES ('06/11/22'	,'1'	,'2'	,'50,00')
    INTO COMPRA (FECCOM, IDUSU, IDPROV, TOTALCOM) VALUES ('06/11/22'	,'1'	,'3'	,'50,00')
SELECT * FROM DUAL
COMMIT;

-- DATA COMPRA_DETALLE:
INSERT ALL
    INTO COMPRA_DETALLE (IDCOM, CANTPRO, SUBTOTALCOMP, IDPROD) VALUES ('1', '5', '50,00', '19')
    INTO COMPRA_DETALLE (IDCOM, CANTPRO, SUBTOTALCOMP, IDPROD) VALUES ('2', '5', '50,00', '19')
    INTO COMPRA_DETALLE (IDCOM, CANTPRO, SUBTOTALCOMP, IDPROD) VALUES ('3', '5', '50,00', '19')
SELECT * FROM DUAL
COMMIT;



------------------------------------------------------------------------ VISTAS:

-- VISTA-DATOS CLIENTES
CREATE VIEW DatosClientes
AS
SELECT
IDCLI AS IDENTIFICADOR,
INITCAP(NOMCLI) AS NOMBRE,
INITCAP(APEPATCLI) AS APELLIDOPAT,
INITCAP(APEMATCLI) AS APELLIDOMAT,
DNICLI AS DNI,
CORCLI AS CORREO,
CELCLI AS CELULAR,
C.CODUBI AS UBIGEO,
INITCAP(DEPAR || ' - ' || PROVI || ' - ' ||DISTRI) AS UBICACION,
DIRCLI AS DIRECCION,
ESTCLI AS ESTADO
FROM CLIENTE C
INNER JOIN UBIGEO U ON C.CODUBI = U.CODUBI
;

-- VISTA-DATOS USUARIOS
CREATE VIEW DatosUsuarios
AS
SELECT
IDUSU AS IDENTIFICADOR,
INITCAP(NOMUSU) AS NOMBRE,
INITCAP(APEPATUSU) AS APELLIDOPAT,
INITCAP(APEMATUSU) AS APELLIDOMAT,
DNIUSU AS DNI,
PASSUSU AS CONTRASEÑA,
LEVEUSU AS NIVEL,
CORUSU AS CORREO,
CELUSU AS CELULAR,
T.CODUBI AS UBIGEO,
INITCAP(DEPAR || ' - ' || PROVI || ' - ' ||DISTRI) AS UBICACION,
DIRUSU AS DIRECCION,
TURUSU AS TURNO,
ESTUSU AS ESTADO
FROM USUARIO T
INNER JOIN UBIGEO U ON T.CODUBI = U.CODUBI
;
	
-- VISTA-DATOS PROVEEDORES
CREATE VIEW DatosProveedor
AS
SELECT
IDPROV AS IDENTIFICADOR,
INITCAP(RAZSOCPROV) AS RAZONSOCIAL,
RUCPROV AS RUC,
INITCAP(EMAIPROV) AS CORREO,
CELPROV AS CELULAR,
P.CODUBI AS UBIGEO,
INITCAP(DEPAR || ' - ' || PROVI || ' - ' ||DISTRI) AS UBICACION,
INITCAP(DIRPROV) AS DIRECCION,
ESTPROV AS ESTADO
FROM PROVEEDOR P
INNER JOIN UBIGEO U ON P.CODUBI = U.CODUBI
;

-- VISTA-DATOS VENTAS
CREATE VIEW INFOVENTAS
AS
SELECT
V.IDVEN,
V.FECVEN,
U.IDUSU,
INITCAP(U.APEPATUSU || ' ' || U.APEMATUSU || ', ' ||U.NOMUSU) AS NOMBREUSU,
U.DNIUSU,
C.IDCLI,
INITCAP(C.APEPATCLI || ' ' || C.APEMATCLI || ', ' ||C.NOMCLI) AS NOMBRECLI,
C.DNICLI,
V.TOTALVEN
FROM VENTA V
INNER JOIN CLIENTE C ON V.IDCLI = C.IDCLI
INNER JOIN USUARIO U ON V.IDUSU = U.IDUSU
;

-- VISTA-DATOS COMPRAS
CREATE VIEW INFOCOMPRAS
AS
SELECT
C.IDCOM,
C.FECCOM,
U.IDUSU,
INITCAP(U.APEPATUSU || ' ' || U.APEMATUSU || ', ' ||U.NOMUSU) AS NOMBREUSU,
U.DNIUSU,
PROVEEDOR.IDPROV,
INITCAP(PROVEEDOR.RAZSOCPROV) AS NOMBREPROVEEDOR,
PROVEEDOR.RUCPROV,
C.TOTALCOM
FROM COMPRA C
INNER JOIN USUARIO U ON C.IDUSU = U.IDUSU
INNER JOIN PROVEEDOR PROVEEDOR ON C.IDPROV = PROVEEDOR.IDPROV
;

-- VISTA-DATOS-COMPLETOS VENTA
CREATE VIEW DATOSVENTAS
AS
SELECT
V.IDVEN AS IDVEN,
V.FECVEN AS FECHA,
V.TOTALVEN AS TOTAL,
INITCAP(C.APEPATCLI || ' ' || C.APEMATCLI || ', ' || C.NOMCLI) AS NOMBRECLIENTE,
C.DNICLI AS DNICLIENTE,
INITCAP(U.APEPATUSU || ' ' || U.APEMATUSU || ', ' || U.NOMUSU) AS NOMBREUSUARIO,
U.DNIUSU AS DNIUSUARIO,
P.NOMPROD AS PRODUCTO,
P.PREPROD AS PRECIO,
VD.CANTVEND AS CANTIDAD,
VD.SUBTOTVEN AS SUBTOTAL

FROM VENTA_DETALLE VD
INNER JOIN PRODUCTO P ON P.IDPROD = VD.IDPROD
INNER JOIN VENTA V ON V.IDVEN = VD.IDVEN
INNER JOIN CLIENTE C ON C.IDCLI = V.IDCLI
INNER JOIN USUARIO U ON U.IDUSU = V.IDUSU
;

-- CREACION DE LA VISTA DE PRODUCTOS MAS VENDIDOS
CREATE OR REPLACE VIEW MAS_PRODUCTOS
AS
SELECT
INITCAP(P.NOMPROD || ', ' || P.DESPROD) AS PRODUCTO,
SUM(VD.CANTVEND) AS CANTIDAD

FROM VENTA_DETALLE VD INNER JOIN PRODUCTO P ON VD.IDPROD = P.IDPROD
GROUP BY P.NOMPROD, P.DESPROD
ORDER BY SUM(VD.CANTVEND) DESC
;


-- CREACION DE LA VISTA DE PRODUCTOS MAS COMPRADOS
CREATE OR REPLACE VIEW MAS_PRODUCTOS_COMPRADOS
AS
SELECT
INITCAP(P.NOMPROD || ', ' || P.DESPROD) AS PRODUCTO,
SUM(CD.CANTPRO) AS CANTIDAD

FROM COMPRA_DETALLE CD INNER JOIN PRODUCTO P ON CD.IDPROD = P.IDPROD
GROUP BY P.NOMPROD, P.DESPROD
ORDER BY SUM(CD.CANTPRO) DESC
;

-- CREACION DE LA VISTA DE PRODUCTOS MAS COMPRADOS
CREATE OR REPLACE VIEW EMPLEADOS_CON_MAS_VENTAS
AS
SELECT
INITCAP(U.APEPATUSU || ' ' || U.APEMATUSU || ', ' || U.NOMUSU) AS EMPLEADO,
SUM(V.TOTALVEN) AS CANTIDAD

FROM VENTA V INNER JOIN USUARIO U ON V.IDUSU = U.IDUSU
GROUP BY U.NOMUSU, U.APEPATUSU, U.APEMATUSU, V.TIPOVEN
ORDER BY SUM(V.TOTALVEN) DESC
;

------------------------------------------------------------------------ PROCEDURE:

------------------------------------------------------------------------ CLIENTE:

-- PROCEDIMIENTOS ALMACENADOS PARA INSERTAR DATOS EN LA TABLA DE CLIENTES
CREATE OR REPLACE PROCEDURE INSERTAR_DATOS_CLIENTE
(
NOMBRE VARCHAR2,
APELLIDOPAT VARCHAR2,
APELLIDOMAT VARCHAR2,
DNI CHAR,
CORREO VARCHAR2,
CELULAR CHAR,
UBIGEO CHAR,
DIRECCION VARCHAR2,
ESTADO CHAR
)
AS
BEGIN

    INSERT INTO CLIENTE
    (NOMCLI, APEPATCLI, APEMATCLI, DNICLI, CORCLI, CELCLI, CODUBI, DIRCLI, ESTCLI)
    VALUES
    (UPPER(NOMBRE), UPPER(APELLIDOPAT), UPPER(APELLIDOMAT), DNI, INITCAP(CORREO), CELULAR, UBIGEO, INITCAP(DIRECCION), ESTADO);

END;

-- PROCEDIMIENTO ALMACENADOS PARA ACTUALIZAR DATOS EN LA TABLA CLIENTES
CREATE OR REPLACE PROCEDURE ACTUALIZAR_DATOS_CLIENTE
(
NOMBRE VARCHAR2,
APELLIDOPAT VARCHAR2,
APELLIDOMAT VARCHAR2,
DNI CHAR,
CORREO VARCHAR2,
CELULAR CHAR,
UBIGEO CHAR,
DIRECCION VARCHAR2,
ESTADO CHAR,
CODIGO VARCHAR
)
AS
BEGIN

    UPDATE CLIENTE SET
    NOMCLI = UPPER(NOMBRE),
    APEPATCLI = UPPER(APELLIDOPAT),
    APEMATCLI = UPPER(APELLIDOMAT),
    DNICLI = DNI,
    CORCLI = INITCAP(CORREO),
    CELCLI = CELULAR,
    CODUBI = UBIGEO,
    DIRCLI = INITCAP(DIRECCION),
    ESTCLI = UPPER(ESTADO)
    WHERE IDCLI = CODIGO;

END;

-- PROCEDIMIENTO ALMACENADOS PARA ELIMINAR O DESHABILITAR A LOS CLIENTES
CREATE OR REPLACE PROCEDURE ELIMINAR_DESHABILITAR_CLIENTE
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE CLIENTE SET
    ESTCLI = 'I'
    WHERE IDCLI = CODIGO;

END;

-- PROCEDIMIENTO ALMACENADOS PARA PODER HABILITAR A LOS CLIENTES
CREATE OR REPLACE PROCEDURE HABILITAR_CLIENTE
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE CLIENTE SET
    ESTCLI = 'A'
    WHERE IDCLI = CODIGO;

END;

------------------------------------------------------------------------ USUARIO:

 -- PROCEDIMIENTO ALMACENADOS PARA REGISTRAR O INSERTAR DATOS EN LA TABLA DE USUARIO
 CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_USUARIO
 (
 NOMBRE VARCHAR2,
 APELLIDOPAT VARCHAR2,
 APELLIDOMAT VARCHAR2,
 DNIUSU CHAR,
 PASSUSU VARCHAR2,
 LEVEUSU CHAR,
 CORUSU VARCHAR2,
 CELUSU CHAR,
 CODUBI CHAR,
 DIRUSU VARCHAR2,
 TURUSU VARCHAR2,
 ESTUSU CHAR
 )
 AS
 BEGIN
 
    INSERT INTO USUARIO
    (NOMUSU, APEPATUSU, APEMATUSU, DNIUSU, PASSUSU, LEVEUSU, CORUSU, CELUSU, CODUBI, DIRUSU, TURUSU, ESTUSU)
    VALUES
    (NOMBRE, APELLIDOPAT, APELLIDOMAT, DNIUSU, PASSUSU, LEVEUSU, CORUSU, CELUSU, CODUBI, DIRUSU, TURUSU, ESTUSU);
 
 END;

-- PROCEDIMIENTO ALMACENADOS PARA PODER ACTUALIZAR LOS DATOS DE LA TABLA DE USUARIO
CREATE OR REPLACE PROCEDURE ACTUALIZAR_DATOS_USUARIO
(
NOMBRE VARCHAR2,
APELLIDOPAT VARCHAR2,
APELLIDOMAT VARCHAR2,
DNI CHAR,
CLAVE VARCHAR2,
NIVEL CHAR,
CORREO VARCHAR2,
CELULAR CHAR,
UBIGEO CHAR,
DIRECCION VARCHAR2,
TURNO VARCHAR2,
ESTADO CHAR,
CODIGO NUMBER
)
AS
BEGIN

    UPDATE USUARIO SET
    NOMUSU = UPPER(NOMBRE),
    APEPATUSU = UPPER(APELLIDOPAT),
    APEMATUSU = UPPER(APELLIDOMAT),
    DNIUSU = DNI,
    PASSUSU = CLAVE,
    LEVEUSU = NIVEL,
    CORUSU = INITCAP(CORREO),
    CELUSU = CELULAR,
    CODUBI = UBIGEO,
    DIRUSU = DIRECCION,
    TURUSU = TURNO,
    ESTUSU = ESTADO
    WHERE IDUSU = CODIGO;

END;

-- PROCEDIMIENTO ALMACEADOS PARA ELIMINAR O DESHABILITAR USUARIOS
CREATE OR REPLACE PROCEDURE ELIMINAR_DESHABILITAR_USUARIO
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE USUARIO SET
    ESTUSU = 'I'
    WHERE IDUSU = CODIGO;

END;

-- PROCEDIMIENTO ALMACEADOS PARA HABILITAR USUARIOS
CREATE OR REPLACE PROCEDURE HABILITAR_USUARIO
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE USUARIO SET
    ESTUSU = 'A'
    WHERE IDUSU = CODIGO;

END;

------------------------------------------------------------------------ PROVEEDORES:

-- PROCEDIMIENTO ALMACENADOS PARA PODER REGISTRAR DATOS EN LA TABLA DE PROVEEDORES
CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_PROVEEDOR
(
RAZONSOCIAL VARCHAR2,
RUC CHAR,
CORREO VARCHAR2,
CELULAR CHAR,
UBIGEO CHAR,
DIRECCION VARCHAR2,
ESTADO CHAR
)
AS
BEGIN

    INSERT INTO PROVEEDOR
    (RAZSOCPROV, RUCPROV, EMAIPROV, CELPROV, CODUBI, DIRPROV, ESTPROV)
    VALUES
    (RAZONSOCIAL, RUC, CORREO, CELULAR, UBIGEO, DIRECCION, ESTADO);

END;

-- PROCEDIMIENTO ALMACENADOS PARA ACTUALIZAR LOS DATOS DE LA TABLA DE PROVEEDOR
CREATE OR REPLACE PROCEDURE ACTUALIZAR_DATOS_PROVEEDOR
(
RAZONSOCIAL VARCHAR2,
RUC CHAR,
CORREO VARCHAR2,
CELULAR CHAR,
UBIGEO CHAR,
DIRECCION VARCHAR2,
ESTADO CHAR,
CODIGO NUMBER
)
AS
BEGIN

    UPDATE PROVEEDOR SET
    RAZSOCPROV = UPPER(RAZONSOCIAL),
    RUCPROV = RUC,
    EMAIPROV = INITCAP(CORREO),
    CELPROV = CELULAR,
    CODUBI = UBIGEO,
    DIRPROV = INITCAP(DIRECCION),
    ESTPROV = ESTADO
    WHERE IDPROV = CODIGO;

END;

-- PROCEDIMIENTO ALMACENADOS PARA PODER ELIMINAR O DESHABILITAR LOS PROVEEDORES
CREATE OR REPLACE PROCEDURE DESACTIVAR_PROVEEDORES
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE PROVEEDOR SET
    ESTPROV = 'I'
    WHERE IDPROV = CODIGO;

END;

-- PROCEDIMIENTO ALMACENADOS PARA PODER HABILITAR DATOS DE PROVEEDORES
CREATE OR REPLACE PROCEDURE HABILITAR_PROVEEDOR
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE PROVEEDOR SET
    ESTPROV = 'A'
    WHERE IDPROV = CODIGO;

END;

------------------------------------------------------------------------ PRODUCTOS:

-- PROCEDIMIENTO ALMACENADOS PARA REGISTRAR DATOS DE PRODUCTO
CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_PRODUCTO
(
NOMBRE VARCHAR2,
TIPO VARCHAR2,
DESCRIPCION VARCHAR2,
PRECIO NUMBER,
STOCK NUMBER,
ESTADO CHAR
)
AS
BEGIN

    INSERT INTO PRODUCTO
    (NOMPROD, TIPOPROD, DESPROD, PREPROD, STOCKPROD, ESTPROD)
    VALUES
    (NOMBRE, TIPO, DESCRIPCION, PRECIO, STOCK, ESTADO);

END;

-- PROCEDIMIENTO ALMACENADOS PARA ACTUALIZAR DATOS DE PRODUCTO
CREATE OR REPLACE PROCEDURE ACTUALIZAR_DATOS_PRODUCTO
(
NOMBRE VARCHAR2,
TIPO VARCHAR2,
DESCRIPCION VARCHAR2,
PRECIO NUMBER,
STOCK NUMBER,
ESTADO CHAR,
CODIGO NUMBER
)
AS
BEGIN

    UPDATE PRODUCTO SET
    NOMPROD = INITCAP(NOMBRE),
    TIPOPROD = TIPO,
    DESPROD = INITCAP(DESCRIPCION),
    PREPROD = PRECIO,
    STOCKPROD = STOCK,
    ESTPROD = ESTADO
    WHERE IDPROD = CODIGO;

END;

-- PROCEDIMIENTO ALMACENADOS PARA ELIMINAR O DESHABILITAR DATOS DE PRODUCTO
CREATE OR REPLACE PROCEDURE ELIMINAR_DESACTIVAR_DATOS_PRODUCTO
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE PRODUCTO SET
    ESTPROD = 'I'
    WHERE IDPROD = CODIGO;

END;

-- PROCEDIMIENTO ALMACENADOS PARA HABILITAR DATOS DE PRODUCTO
CREATE OR REPLACE PROCEDURE HABILITAR_DATOS_PRODUCTO
(
CODIGO NUMBER
)
AS
BEGIN

    UPDATE PRODUCTO SET
    ESTPROD = 'A'
    WHERE IDPROD = CODIGO;

END;

------------------------------------------------------------------------ VENTA Y VENTA DETALLE:

-- PROCEDIMIENTO ALMACENADOS PARA EL REGISTRAR DE LA TABLA VENTA
CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_VENTAS
(
FECHAVENTA DATE,
USUARIO NUMBER,
CLIENTE NUMBER,
TIPOVENTA CHAR,
TIPOPAGO CHAR,
TOTALVENTA NUMBER,
ESTADO CHAR
)
AS
BEGIN

    INSERT INTO VENTA
    (FECVEN, IDUSU, IDCLI, TIPOVEN, TIPOPAG, TOTALVEN, ESTVEN)
    VALUES
    (FECHAVENTA, USUARIO, CLIENTE, TIPOVENTA, TIPOPAGO, TOTALVENTA, ESTADO);

END;

-- PROCEDIMIENTO ALMACENADOS PARA EL REGISTRAR DE LA TABLA VENTA DETALLE
CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_VENTA_DETALLE
(
IDVENTA NUMBER,
CANTIDADVENDIDA NUMBER,
SUBTOTAL NUMBER,
IDPRODUCTO NUMBER
)
AS
BEGIN

    INSERT INTO VENTA_DETALLE
    (IDVEN, CANTVEND, SUBTOTVEN, IDPROD)
    VALUES
    (IDVENTA, CANTIDADVENDIDA, SUBTOTAL, IDPRODUCTO);

END;

------------------------------------------------------------------------ COMPRA Y COMPRA DETALLE:

-- PROCEDIMIENTO ALMACENADOS PARA EL REGISTRAR DE LA TABLA COMPRA
CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_COMPRA
(
FECHA DATE,
USUARIO NUMBER,
PROVEEDOR NUMBER,
TOTALCOMPRA NUMBER,
ESTADO CHAR
)
AS
BEGIN

    INSERT INTO COMPRA
    (FECCOM, IDUSU, IDPROV, TOTALCOM, ESTCOM)
    VALUES
    (FECHA, USUARIO, PROVEEDOR, TOTALCOMPRA, ESTADO);

END;

-- PROCEDIMIENTO ALMACENADOS PARA EL REGISTRAR DE LA TABLA COMPRA DETALLE
CREATE OR REPLACE PROCEDURE REGISTRAR_DATOS_COMPRA_DETALLE
(
COMPRA NUMBER,
CANTIDAD NUMBER,
SUBTOTAL NUMBER,
PRODUCTO NUMBER
)
AS
BEGIN

    INSERT INTO COMPRA_DETALLE
    (IDCOM, CANTPRO, SUBTOTALCOMP, IDPROD)
    VALUES
    (COMPRA, CANTIDAD, SUBTOTAL, PRODUCTO);

END;

------------------------------------------------------------------------ JASPERREPORT:

-- ACOPLAR AL JASPERREPORT PARA HACER LA BOLETA CORRECTA
-- WHERE IDVEN = $P{IDVEN}
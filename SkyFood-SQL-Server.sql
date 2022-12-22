-- Creamos la Base de Datos
CREATE DATABASE SKYNET_SKYFOOD;

-- Ponemos en uso la Base de Datos
USE SKYNET_SKYFOOD;

-- Establecemos formatos de fecha dd/mm/yyyy
SET DATEFORMAT
dmy
;

-- Creamos la tabla UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPAR varchar(100)  NOT NULL,
    PROVI varchar(100)  NOT NULL,
    DISTRI varchar(100)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);

-- Ingresamos los registros a la tabla UBIGEO
INSERT INTO UBIGEO
	  (CODUBI		,DEPAR		,PROVI			,DISTRI)
VALUES('150102'	    ,'LIMA'	    ,'LIMA'			,'ANCON'),
      ('150103'	    ,'LIMA'		,'LIMA'			,'ATE'),
      ('150104'	    ,'LIMA'		,'LIMA'			,'BARRANCO'),
      ('150105'	    ,'LIMA'		,'LIMA'			,'BREÑA'),
      ('150101'	    ,'LIMA'		,'LIMA'   	 	,'LIMA'),
      ('150106'	    ,'LIMA'		,'LIMA'			,'CARABAYLLO'),
      ('150107'	    ,'LIMA'		,'LIMA'			,'CHACLACAYO'),
      ('150108'	    ,'LIMA'		,'LIMA'			,'CHORRILLOS'),
      ('150109'	    ,'LIMA'	    ,'LIMA'			,'CIENEGUILLA'),
      ('150110'	    ,'LIMA'	    ,'LIMA'			,'COMAS'),
      ('150111'	    ,'LIMA'	    ,'LIMA'			,'EL AGUSTINO'),
      ('150112'	    ,'LIMA'	    ,'LIMA'			,'INDEPENDENCIA'),
      ('150113'	    ,'LIMA'	    ,'LIMA'			,'JESUS MARIA'),
      ('150114'	    ,'LIMA'	    ,'LIMA'			,'LA MOLINA'),
      ('150115'	    ,'LIMA'	    ,'LIMA'			,'LA VICTORIA'),
      ('150116'	    ,'LIMA'	    ,'LIMA'			,'LINCE'),
      ('150117'     ,'LIMA'		,'LIMA'			,'LOS OLIVOS'),
      ('150118'     ,'LIMA'		,'LIMA'			,'LURIGANCHO'),
      ('150119'     ,'LIMA'    	,'LIMA'			,'LURIN'),
      ('150120'     ,'LIMA'     ,'LIMA'			,'MAGDALENA DEL MAR'),
      ('150121'     ,'LIMA'     ,'LIMA'			,'PUEBLO LIBRE'),
      ('150122'     ,'LIMA'     ,'LIMA'			,'MIRAFLORES'),
      ('150123'     ,'LIMA'     ,'LIMA'			,'PACHACAMAC'),
      ('150124'     ,'LIMA'     ,'LIMA'			,'PUCUSANA'),
      ('150125'     ,'LIMA'     ,'LIMA'			,'PUENTE PIEDRA'),
      ('150126'     ,'LIMA'     ,'LIMA'			,'PUNTA HERMOSA'),
      ('150127'     ,'LIMA'     ,'LIMA'			,'PUNTA NEGRA'),
      ('150128'     ,'LIMA'     ,'LIMA'			,'RIMAC'),
      ('150129'     ,'LIMA'     ,'LIMA'			,'SAN BARTOLO'),
      ('150130'     ,'LIMA'     ,'LIMA'			,'SAN BORJA'),
      ('150131'     ,'LIMA'     ,'LIMA'			,'SAN ISIDRO'),
      ('150132'     ,'LIMA'     ,'LIMA'			,'SAN JUAN DE LURIGANCHO'),
      ('150133'     ,'LIMA'     ,'LIMA'			,'SAN JUAN DE MIRAFLORES'),
      ('150134'     ,'LIMA'     ,'LIMA'			,'SAN LUIS'),
      ('150135'     ,'LIMA'     ,'LIMA'			,'SAN MARTIN DE PORRES'),
      ('150136'     ,'LIMA'     ,'LIMA'			,'SAN MIGUEL'),
      ('150137'     ,'LIMA'     ,'LIMA'			,'SANTA ANITA')
      ('150138'     ,'LIMA'     ,'LIMA'			,'SANTA MARIA DEL MAR'),
      ('150139'     ,'LIMA'     ,'LIMA'			,'SANTA ROSA'),
      ('150140'     ,'LIMA'     ,'LIMA'			,'SANTIAGO DE SURCO'),
      ('150141'     ,'LIMA'     ,'LIMA'			,'SURQUILLO'),
      ('150142'     ,'LIMA'     ,'LIMA'			,'VILLA EL SALVADOR'),
      ('150143'     ,'LIMA'     ,'LIMA'			,'VILLA MARIA DEL TRIUNFO'),
      ('150201'     ,'LIMA'     ,'BARRANCA'		,'BARRANCA'),
      ('150202'     ,'LIMA'		,'BARRANCA'		,'PARAMONGA'),
      ('150203'     ,'LIMA'		,'BARRANCA'		,'PATIVILCA'),
      ('150204'     ,'LIMA'		,'BARRANCA'		,'SUPE'),
      ('150205'     ,'LIMA'		,'BARRANCA'		,'SUPE PUERTO'),
      ('150301'     ,'LIMA'		,'CAJATAMBO'	,'CAJATAMBO'),
      ('150302'     ,'LIMA'		,'CAJATAMBO'	,'COPA'),
      ('150303'     ,'LIMA'		,'CAJATAMBO'	,'GORGOR'),
      ('150304'     ,'LIMA'		,'CAJATAMBO'	,'HUANCAPON'),
      ('150305'     ,'LIMA'		,'CAJATAMBO'	,'MANAS'),
      ('150401'     ,'LIMA'		,'CANTA'		,'CANTA'),
      ('150402'     ,'LIMA'		,'CANTA'		,'ARAHUAY'),
      ('150403'     ,'LIMA'		,'CANTA'		,'HUAMANTANGA'),
      ('150404'     ,'LIMA'		,'CANTA'		,'HUAROS'),
      ('150405'     ,'LIMA'		,'CANTA'		,'LACHAQUI'),
      ('150406'     ,'LIMA'		,'CANTA'		,'SAN BUENAVENTURA'),
      ('150407'     ,'LIMA'		,'CANTA'		,'SANTA ROSA DE QUIVES'),
      ('150501'     ,'LIMA'		,'CAÑETE'		,'SAN VICENTE DE CAÑETE'),
      ('150502'     ,'LIMA'		,'CAÑETE'		,'ASIA'),
      ('150503'     ,'LIMA'		,'CAÑETE'		,'CALANGO'),
      ('150504'     ,'LIMA'		,'CAÑETE'		,'CERRO AZUL'),
      ('150505'     ,'LIMA'		,'CAÑETE'		,'CHILCA'),
      ('150506'     ,'LIMA'		,'CAÑETE'		,'COAYLLO'),
      ('150507'     ,'LIMA'		,'CAÑETE'		,'IMPERIAL'),
      ('150508'     ,'LIMA'		,'CAÑETE'		,'LUNAHUANA'),
      ('150509'     ,'LIMA'		,'CAÑETE'		,'MALA'),
      ('150510'     ,'LIMA'		,'CAÑETE'		,'NUEVO IMPERIAL'),
      ('150511'     ,'LIMA'		,'CAÑETE'		,'PACARAN'),
      ('150512'     ,'LIMA'		,'CAÑETE'		,'QUILMANA'),
      ('150513'     ,'LIMA'		,'CAÑETE'		,'SAN ANTONIO'),
      ('150514'     ,'LIMA'		,'CAÑETE'		,'SAN LUIS'),
      ('150515'     ,'LIMA'		,'CAÑETE'		,'SANTA CRUZ DE FLORES'),
      ('150516'     ,'LIMA'		,'CAÑETE'		,'ZUÑIGA')
;

-- Creamos la tabla CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int NOT NULL IDENTITY(1,1),
    NOMCOMCLI varchar(100)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    CORCLI varchar(100)  NULL,
    CELCLI char(9)  NULL,
    CODUBI char(6)  NOT NULL,
    DIRCLI varchar(100)  NOT NULL,
    ESTCLI char(1)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

-- Ingresamos los registros a la tabla CLIENTE
INSERT INTO CLIENTE
	  (NOMCOMCLI						,DNICLI			,CORCLI						,CELCLI			,CODUBI		,DIRCLI							,ESTCLI)
VALUES('Jose Carlos Alcantara Salazar'	,'45256325'		,'josealcantara@gmail.com'	,'935125478'	,'150126'	,'Jr. Caceres Alcampos 1525'	,'A'),
	  ('Marco Antonio Salazar Sanchez'	,'59632478'		,'marcoantonio@gmail.com'	,'978478254'	,'150501'	,'Jr. Ovalo Grau 1523'			,'A'),
	  ('Carlos Albeto Sanchez Alcala'	,'96584215'		,'carlosalberto@gmail.com'	,'936644841'	,'150510'	,'Av. Campos Caceres 5454'		,'A'),
	  ('Jose Angel Campos Sanchez'		,'21457752'		,'joseangel@gmail.com'		,'922311644'	,'150121'	,'Jr. Lolo Fernandez 1254'		,'A'),
	  ('Luis Angel Chupanqui Mamani'	,'32558444'		,'luisangel@gmail.com'		,'900031154'	,'150516'	,'Jr. Chile America 1547'		,'A')
;

-- Creamos la tabla EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int NOT NULL IDENTITY(1,1),
    NOMCOMEMP varchar(100)  NOT NULL,
    DNIEMP char(8)  NOT NULL,
    COREMP varchar(100)  NULL,
    CELEMP char(9)  NULL,
    CODUBI char(6)  NOT NULL,
    DIREMP varchar(100)  NOT NULL,
    TURNO char(1)  NOT NULL,
    ESTEMP char(1)  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);

-- Ingresamos los registros a la tabla EMPLEADO
INSERT INTO EMPLEADO
	  (NOMCOMEMP							,DNIEMP			,COREMP							,CELEMP			,CODUBI		,DIREMP						,TURNO	,ESTEMP)
VALUES('Carlos Edidson Sanchez Alcala'		,'24863154'		,'carlossanchez@outlook.com'	,'948154214'	,'150504'	,'Jr. Almanares 1548'		,'M'	,'A'),
	  ('Naomi Shantal Cama Elias'			,'32547454'		,'naomicama@gmail.com	'		,'978451652'	,'150507'	,'Jr. Ogghins 1487'			,'T'	,'A'),
	  ('Marcos Alberto Corrales Quispe'		,'36522148'		,'marcosalberto@gmail.com'		,'931654654'	,'150504'	,'Av. Siempre Viva 1548'	,'N'	,'A'),
	  ('Quevedo Bizarrap Session Quispe'	,'63226454'		,'quevedobzrp@hotmail.com'		,'921321021'	,'150507'	,'Jr, Los Simpson 1877'		,'M'	,'A'),
	  ('Paulo Londra Quispe Mamani'			,'32516547'		,'paulolondra@outlook.com'		,'985453154'	,'150507'	,'Av. Semana Santa 8484'	,'T'	,'A')
;

-- Creamos la tabla PLATILLO
CREATE TABLE PLATILLO (
    IDPLA int  NOT NULL IDENTITY(1,1),
    NOMPLA varchar(50)  NOT NULL,
    DESPLA varchar(300)  NOT NULL,
    PREPLA decimal(5,2)  NOT NULL,
    STOCKPLA int  NOT NULL,
    ESTPLA char(1)  NOT NULL,
    CONSTRAINT PLATILLO_pk PRIMARY KEY  (IDPLA)
);

-- Ingresamos registros a la tabla PLATILLO
INSERT INTO PLATILLO
	  (NOMPLA			,DESPLA												,PREPLA		,STOCKPLA	,ESTPLA)
VALUES('Seco de Pollo'	,'Pollo, papa, alberja, zanahoria, Albahaca y etc.'	,'15.00'	,'15'		,'A'),
	  ('Seco de Pato'	,'Pato, papa, alberja, zanahoria, Albahaca y etc.'	,'15.00'	,'15'		,'A'),
	  ('Ceviche'		,'Pescado, camote, alberja, limón, cacnhita y etc.'	,'15.00'	,'15'		,'A'),
	  ('Lomo Saltado'	,'Pollo, carne, papa, zanahoria, alberja y etc.'	,'15.00'	,'15'		,'A')
;

-- Creamos la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL IDENTITY(1,1),
    NOMPRO varchar(100)  NOT NULL,
    DESPRO varchar(300)  NOT NULL,
    PREPRO decimal(5,2)  NOT NULL,
    ESTPRO char(1)  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (IDPRO)
);

-- Ingresamos registros a la tabla PRODUCTO
INSERT INTO PRODUCTO
	  (NOMPRO		,DESPRO												,PREPRO		,ESTPRO)
VALUES('Fideos'		,'Fideo de alta calidad, marca Margarita'			,'15.00'	,'A'),
	  ('Papa'		,'Papa de alta calidad, papa blanca'				,'15.00'	,'A'),
	  ('Arroz'		,'Arroz de alta calidad, marca Caserito'			,'15.00'	,'A'),
	  ('Aceite'		,'Aceite de alta calidad, marca Juanito'			,'15.00'	,'A'),
	  ('Tomate'		,'Son tomates rojos de alta calidad, exquisito.'	,'15.00'	,'A')
;

-- Creamos la tabla PROVEEDOR
CREATE TABLE PROVEEDOR (
    IDPROV int  NOT NULL IDENTITY(1,1),
    RAZSOCPROV varchar(200)  NOT NULL,
    RUCPROV char(11)  NOT NULL,
    PROVEND varchar(100)  NOT NULL,
    EMAIPROV varchar(50)  NOT NULL,
    CELPROV char(9)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    DIRPROV varchar(100)  NOT NULL,
    ESTPROV char(1)  NOT NULL,
    CONSTRAINT PROVEEDOR_pk PRIMARY KEY  (IDPROV)
);

-- Ingresamos registros a la tabla PROVEEDOR
INSERT INTO PROVEEDOR
      (RAZSOCPROV				,RUCPROV		,PROVEND		,EMAIPROV						,CELPROV		,CODUBI		,DIRPROV						,ESTPROV)
VALUES('Proagro Peruanos'		,'20781362943'	,'Papas'		,'proagro.peruanos@gmail.com'	,'956219873'	,'150119'	,'Av. Gallinazos Negros 1526'	,'A'),
      ('Avícola Transavic'		,'20598462835'	,'Pollos'		,'avícolatransavic@gmail.com'	,'976183761'	,'150102'	,'Av. Proceres 1523'			,'I'),
      ('Carniceria Fidelita'	,'20545872654'	,'Carnes'		,'carniceriafideli@gmail.com'	,'956219821'	,'150403'	,'Av. Ovalo Grau 1258'			,'A'),
      ('Pescado Fresquito'		,'20479534208'	,'Pescado'		,'pescadofresquito@gmail.com'	,'946753723'	,'150120'	,'Jr. Ogghins 1548'				,'A'),
      ('Arroz el Blanquito'		,'20568713629'	,'Arroz'		,'arrozelblanquito@gmail.com'	,'929127648'	,'150119'	,'Av. Simon Bolivar 4589'		,'A'),
      ('El Caserito S.A.C.'		,'20582645304'	,'Fideos'		,'elcaserito@gmail.com'			,'954826852'	,'150120'	,'Av. Campos Alcanara 2356'		,'A')
;

-- Creamos la tabla VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY(1,1),
    FECVEN date  NOT NULL,
    IDEMP int  NOT NULL,
    IDCLI int  NOT NULL,
    ESTVEN char(1)  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- Creamos la tabla VENTA-DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int  NOT NULL IDENTITY(1,1),
    IDVEN int  NOT NULL,
    CANTVEND int  NOT NULL,
    SUBTOTVEN decimal(10,2)  NOT NULL,
    IDPLA int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
);

-- Creamos la tabla COMPRA
CREATE TABLE COMPRA (
    IDCOM int  NOT NULL IDENTITY(1,1),
    FECCOM date  NOT NULL,
    IDEMP int  NOT NULL,
    IDPROV int  NOT NULL,
    ESTCOM char(1)  NOT NULL,
    CONSTRAINT COMPRA_pk PRIMARY KEY  (IDCOM)
);

-- Creamos la tabla COMPRA-DETALLE
CREATE TABLE COMPRA_DETALLE (
    IDCOMDET int  NOT NULL IDENTITY(1,1),
    IDCOM int  NOT NULL,
    CANTPRO int  NOT NULL,
    SUBTOTALCOMP decimal(5,2)  NOT NULL,
    IDPRO int  NOT NULL,
    CONSTRAINT COMPRA_DETALLE_pk PRIMARY KEY  (IDCOMDET)
);

-- Creamos la relación entre CLIENTE-UBIGEO
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Creamos la relación entre COMPRADETALLE-COMPRA
ALTER TABLE COMPRA_DETALLE ADD CONSTRAINT COMPRA_DETALLE_COMPRA
    FOREIGN KEY (IDCOM)
    REFERENCES COMPRA (IDCOM);

-- Creamos la relación entre COMPRADETALLE-PRODUCTO
ALTER TABLE COMPRA_DETALLE ADD CONSTRAINT COMPRA_DETALLE_PRODUCTO
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO);

-- Creamos la relación entre COMPRA-EMPLEADO
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Creamos la relación entre COMPRA-PROVEEDOR
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_PROVEEDOR
    FOREIGN KEY (IDPROV)
    REFERENCES PROVEEDOR (IDPROV);

-- Creamos la relación entre EMPLEADO-UBIGEO
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Creamos la relación entre PROVEEDOR-UBIGEO
ALTER TABLE PROVEEDOR ADD CONSTRAINT PROVEEDOR_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Creamos la relación entre VENTADETALLE-PLATILLO
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PLATILLO
    FOREIGN KEY (IDPLA)
    REFERENCES PLATILLO (IDPLA);

-- Creamos la relación entre VENTADETALLE-VENTA
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVEN)
    REFERENCES VENTA (IDVEN);

-- Creamos la relación entre VENTA-CLIENTE
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI);

-- Creamos la relación entre VENTA-EMPLEADO
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Creamos la vista de los datos de los Cliente
CREATE VIEW DatosClientes
AS
SELECT
IDCLI,
NOMCOMCLI,
DNICLI,
CORCLI,
CELCLI,
C.CODUBI,
DEPAR,
PROVI,
DISTRI,
DIRCLI,
ESTCLI
FROM CLIENTE C INNER JOIN UBIGEO U
	ON C.CODUBI = U.CODUBI
;

-- Creamos la vista de los datos de los Empleados
CREATE VIEW DatosEmpleados
AS
SELECT
IDEMP,
NOMCOMEMP,
DNIEMP,
COREMP,
CELEMP,
E.CODUBI,
DEPAR,
PROVI,
DISTRI,
DIREMP,
TURNO,
ESTEMP
FROM EMPLEADO E INNER JOIN UBIGEO U
	ON E.CODUBI = U.CODUBI
;
	
-- Creamos la vista de los datos de los Proveedores
CREATE VIEW DatosProveedor
AS
SELECT
IDPROV,
RAZSOCPROV,
RUCPROV,
PROVEND,
EMAIPROV,
CELPROV,
P.CODUBI,
DEPAR,
PROVI,
DISTRI,
DIRPROV,
ESTPROV
FROM PROVEEDOR P INNER JOIN UBIGEO U
	ON P.CODUBI = U.CODUBI
;
	
-- Creamos la vista de venta
CREATE VIEW DetalleCompletoVenta
AS
SELECT
V.IDVEN,
FECVEN,
V.IDEMP,
NOMCOMEMP,
DNIEMP,
V.IDCLI,
NOMCOMCLI,
DNICLI,
VD.IDPLA,
NOMPLA,
CANTVEND,
SUBTOTVEN
FROM VENTA V INNER JOIN EMPLEADO E
	ON V.IDEMP = E.IDEMP
	INNER JOIN CLIENTE C
	ON V.IDCLI = C.IDCLI
	INNER JOIN VENTA_DETALLE VD
	ON  V.IDVEN =  VD.IDVEN
	INNER JOIN PLATILLO P
	ON VD.IDPLA = P.IDPLA
;
	
-- Creamos la vista de nombre de la ubicación
CREATE VIEW DatosUbigeo
AS
SELECT
CODUBI,
(DEPAR + ' - ' + PROVI + ' - ' + DISTRI) AS  UBICACIÓN
FROM UBIGEO
;
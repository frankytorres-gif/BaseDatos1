-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-09-05 03:20:47.473

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    ID int  NOT NULL,
    tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    email varchar(80)  NULL,
    celular char(9)  NULL,
    fecha_nacimiento date  NOT NULL,
    activo bool  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (ID)
);

-- Table: PRENDA
CREATE TABLE PRENDA (
    ID int  NOT NULL,
    descripcion varchar(90)  NOT NULL,
    marca varchar(60)  NOT NULL,
    cantidad int  NOT NULL,
    talla varchar(10)  NOT NULL,
    precio decimal(8,2)  NOT NULL,
    activo bool  NOT NULL,
    CONSTRAINT PRENDA_pk PRIMARY KEY (ID)
);

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    ID int  NOT NULL,
    tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    salario decimal(8,2)  NOT NULL,
    celular char(9)  NULL,
    email varchar(80)  NULL,
    activo bool  NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (ID)
);

-- Table: VENTA
CREATE TABLE VENTA (
    ID int  NOT NULL,
    fecha_hora timestamp  NOT NULL,
    activo bool  NOT NULL,
    cliente_id int  NOT NULL,
    vendedor_id int  NOT NULL,
    CLIENTE_ID int  NOT NULL,
    VENDEDOR_ID int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (ID)
);

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    ID int  NOT NULL,
    cantidad int  NOT NULL,
    venta_id int  NOT NULL,
    prenda_id int  NOT NULL,
    VENTA_ID int  NOT NULL,
    PRENDA_ID int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (ID)
);

-- foreign keys
-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CLIENTE_ID)
    REFERENCES CLIENTE (ID);

-- Reference: VENTA_DETALLE_PRENDA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (PRENDA_ID)
    REFERENCES PRENDA (ID);

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (VENTA_ID)
    REFERENCES VENTA (ID);

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (VENDEDOR_ID)
    REFERENCES VENDEDOR (ID);

-- End of file.


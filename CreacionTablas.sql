
#creacion de la base de datos
create database Ecommerce;

#
use Ecommerce;

# creacion de tablas

create table Proveedores
(
codProveedor varchar(20) not null,
razonSocial text,
cuit varchar(20),
telefono varchar(20),
contacto text,
web nchar(30),
email nchar(50),
CONSTRAINT codProPK PRIMARY KEY(codProveedor)
);

alter table Proveedores add direccion varchar(20) null;  
alter table Proveedores add ciudad text null;
alter table Proveedores add provincia text null;


create table Articulos
(
codArticulo varchar(20) not null,
codProveedor varchar(20) not null,
descripcion text,
stock int,
precio real
);
alter table Articulos add constraint codArticuloPK PRIMARY KEY(codArticulo,codProveedor) ;
alter table Articulos add constraint codProveFK FOREIGN KEY(codProveedor) REFERENCES Proveedores(codProveedor);
alter table Articulos add precio real default(0);

create table Clientes
(
Dni varchar(20) not null,
nombre varchar(20),
apellido varchar(20),
direccion varchar(20),
telefono varchar(20) default(111),
CONSTRAINT dniPK PRIMARY KEY(dni)
);

create table Cuentas(
codCuenta varchar(20) not null unique,
nroCuenta varchar(20) not null unique,
dniCu varchar(20) not null unique,
limiteCuenta real,
sueldoCuenta real default(0),
estado boolean default(true),
constraint dniFK FOREIGN KEY(dniCu) references Clientes(Dni),
constraint codCuNroCueDniPK PRIMARY KEY(codCuenta,nroCuenta,dniCu)
);

create table Facturas
(
codFactura varchar(20) not null,
codCuenta varchar(20) not null,
nroCuenta varchar(20) not null,
dniCuenta varchar(20) not null,
total real default(0),
fecha date default(DATE(now())),
CONSTRAINT  codCuNroCuDniCuFK FOREIGN KEY(codCuenta,nroCuenta,dniCuenta) references Cuentas(codCuenta,nroCuenta,dniCu),
CONSTRAINT codFacturaPK PRIMARY KEY(codFactura)
);


create table FacturasDetalladas
(
codFacturaDetallada varchar(20) not null,
codFactuara varchar(20) not null,
codProveedor varchar(20) not null,
codArticulo varchar(20) not null,
cantidad bigint,
precio real,
Constraint codFaDcodFPK PRIMARY KEY(codFacturaDetallada),
constraint codFacturaFK FOREIGN KEY(codFactuara) REFERENCES Facturas(codFactura),
constraint codProCodArtFK FOREIGN KEY(codProveedor,codArticulo) REFERENCES Articulos(codProveedor,codArticulo)
);


SELECT DATE(NOW()) AS fecha, CURDATE() AS fecha2


-- CREACION DE PROCEDIMIENTOS ALMACENADOS

DELIMITER //
create PROCEDURE insertProveedores
(codPro varchar(20),
razSoc text,
cuit varchar(20),
telefono varchar(20),
contac text,
direccion text,
ciudad text,
provincia text
)
begin
insert into Proveedores(codProveedor,razonSocial,cuit,telefono,contacto,direccion,ciudad,provincia)
select codPro,razSoc,cuit,telefono,contac,direccion,ciudad,provincia;
end //
DELIMITER ;

drop procedure insertProveedores


call insertProveedores('cp01','Detoys','147',1547,'Cesar','10','Buenos Aires','Buenos Aires');

select * from Proveedores







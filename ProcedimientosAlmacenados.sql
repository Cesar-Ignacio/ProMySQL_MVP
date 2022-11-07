
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


DELIMITER //
CREATE PROCEDURE insertArticulo
(
codArticulo varchar(20),
codProveedor varchar(20),
descripcion text,
stock int,
precio real
)
begin
insert into Articulos(codArticulo,codProveedor,descripcion,stock,precio)
select codArticulo,codProveedor,descripcion,stock,precio;
end //
DELIMITER ;

DELIMITER //
create procedure insertClientes(
Dni varchar(20) ,
nombre varchar(20),
apellido varchar(20),
direccion varchar(20),
telefono varchar(20)
)
begin
insert into Clientes(Dni,nombre,apellido,direccion,telefono) 
select Dni,nombre,apellido,direccion,telefono;
end //
DELIMITER ;

DELIMITER //
create procedure insertCuentas(
codCuenta varchar(20) ,
nroCuenta varchar(20) ,
dniCu varchar(20) ,
limiteCuenta real,
sueldoCuenta real
)
begin
insert into Cuentas(codCuenta,nroCuenta,dniCu,limiteCuenta,sueldoCuenta)
select codCuenta,nroCuenta,dniCu,limiteCuenta,sueldoCuenta;
end //
DELIMITER ;


DELIMITER //
create procedure insertFacturas(
codFactura varchar(20) ,
codCuenta varchar(20),
nroCuenta varchar(20) ,
dniCuenta varchar(20) 
)
begin
insert into Facturas(codFactura,codCuenta,nroCuenta,dniCuenta)
select codFactura,codCuenta,nroCuenta,dniCuenta;
end //
DELIMITER ;

DELIMITER //
create procedure insertFacturasDetalladas(
codFacturaDetallada varchar(20),
codFactuara varchar(20) ,
codProveedor varchar(20) ,
codArticulo varchar(20),
cantidad bigint
)
begin
insert into FacturasDetalladas(codFacturaDetallada,codFactuara,codProveedor,codArticulo,cantidad)
select codFacturaDetallada,codFactuara,codProveedor,codArticulo,cantidad;
end //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE spArticuloContraladorStock
(
stock01 int
)
begin
select * from Articulos where stock>stock01;
end//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spInversionPorProveedor
(
codProveedor01 varchar(20)
)
begin
select pr.razonSocial,codArticulo,stock*precio as "Inversion" from Articulos as ar inner join Proveedores as pr
on ar.codProveedor=pr.codProveedor
where ar.codProveedor=codProveedor01;
end//
DELIMITER ;


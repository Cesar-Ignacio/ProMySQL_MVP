select * from Proveedores;
select * from Articulos;
select * from Clientes;
select * from Cuentas;
select * from Facturas;
select * from FacturasDetalladas;

#Mostrar las ventas detalladas de una factura
select * from Facturas where codFactura='cf01';
select * from FacturasDetalladas  where codFactuara='cf01';

# Articulos mayores a un determinado stock

call spArticuloContraladorStock (0);

/*Informe la razón social del proveedor, el artículo y la inversión hasta el 
momento en stock (stock * precio unitario) de un artículo determinado. Cree 
procedimiento almacenado. */

CALL spInversionPorProveedor('cp03')




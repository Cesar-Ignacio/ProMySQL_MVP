DELIMITER //
create trigger tr_insertFacturaDetallada after insert on facturasDetalladas
for each row 
begin
    
    #ACTUALIZAR TOTAL EN FACTURAS
    update Facturas set total=total+
    (NEW.cantidad*(select precio from Articulos where codArticulo=NEW.codArticulo and codProveedor=NEW.codProveedor)) 
    where Facturas.codFactura=NEW.codFactuara;
    
    #DESCONTRAR EL STOCK
    
    update Articulos set stock=stock-NEW.cantidad where codArticulo=NEW.codArticulo and codProveedor=NEW.codProveedor;
    
    
end//
DELIMITER ;



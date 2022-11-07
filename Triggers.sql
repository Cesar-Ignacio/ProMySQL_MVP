DELIMITER //
create trigger tr_insertFacturaDetallada after insert on facturasdetalladas
for each row begin
    select @codA=codArticulo,@codP=codProveedor, @fd=codFacturaDetallada,@cf=codFactura from inserted;
	select @pre=precio from Articulos where codArticulo=@codA and codProveedor=@codP;
	update facturasdetalladas set precio=@pre where codFacturaDetallada=@fd and codFactura=@cf;
end//
DELIMITER ;

DELIMITER //
create trigger tr_insertFacturaDetallada after insert on facturasdetalladas
for each row begin
select * from inserted;
end//
DELIMITER ;
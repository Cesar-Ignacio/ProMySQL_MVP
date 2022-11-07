
# Insert Proveedores
call insertProveedores('cp01','Detoys','147',1547,'Cesar','10','Buenos Aires','Buenos Aires');
call insertProveedores('cp02','Hotweels','147',1547,'Sebastian','12','Buenos Aires','Buenos Aires');
call insertProveedores('cp03','Roddi','147',1547,'Cosme','17','Mendoza','Mendoza');

# Insert Articulos

CALL insertArticulo('art01','cp01','Pelota Mundia',50,2500);
CALL insertArticulo('art02','cp01','Pelota Tenis',70,800);
CALL insertArticulo('art03','cp03','Pata Pata',25,6000);
CALL insertArticulo('art04','cp02','Autos Pequeños',20,1500);
CALL insertArticulo('art05','cp02','Motos Metal',30,2000);

# Insert Clientes

CALL insertClientes('111','Cesar','Awuia','174',111);
CALL insertClientes('222','Juan','Quitero','174',111);
CALL insertClientes('333','Juan','Santa','174',111);
CALL insertClientes('444','Romina','Cruz','174',111);
CALL insertClientes('555','Brenda','Aguilar','174',111);

#	Insert Cuenta

CALL insertCuentas('cu01','nc01','111',100000,50000);
CALL insertCuentas('cu02','nc02','222',100000,30000);
CALL insertCuentas('cu03','nc03','333',100000,55000);
CALL insertCuentas('cu04','nc04','444',100000,80000);

# Insert Facturas

CALL insertFacturas('cf01','cu02','nc02','222');
CALL insertFacturas('cf03','cu01','nc01','111');
CALL insertFacturas('cf04','cu04','nc04','444');

# Insert Factura Detallada

CALL insertFacturasDetalladas('cfd01','cf01','cp01','art02',4);
CALL insertFacturasDetalladas('cfd02','cf01','cp03','art03',2);
CALL insertFacturasDetalladas('cfd01','cf03','cp01','art02',2);
CALL insertFacturasDetalladas('cfd01','cf04','cp02','art05',2);


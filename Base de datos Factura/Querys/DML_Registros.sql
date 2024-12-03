USE Facturacion 
 

/*Procidimiento almacenado para la inserccion en la tabla Cliente*/

                        --Nit   |   1.Nombre | 2.Nombre | 3.Nombre | 1.Apellido |  2.Apellido |  ApellidoCasa  | FechanNa |  Direccion 
execute Sp_InsertCliente '23563454-U',  'Juan',  'Carlos',  'Andrés',  'Pérez',   'Gómez',   null,  '2000-02-12', 'Ciudad de Guatemala'
execute Sp_InsertCliente '34769845-K', 'Homero' , 'Manuel', null, 'Simpson', 'Chamale', null, '1987-06-23', 'Ciudad de Guatemala'
execute Sp_InsertCliente '67453467-I', 'Sergio' , 'Jose', null, 'Gomez', 'Gonzales', null, '2012-08-15', 'Ciudad de Guatemala'
execute Sp_InsertCliente '23541265-T', 'Roberto' , 'Santiago', null, 'Hernandez', 'Soto', null, '1987-11-24', 'Ciudad de Guatemala'
execute Sp_InsertCliente '65523534-O', 'Javier' , 'Lorenzo', null, 'Gomez', 'Chamale', null, '1899-05-20','Ciudad de Guatemala '
execute Sp_InsertCliente '39817482-N', 'María', 'Elena', 'Lisa', 'López', 'Gómez', 'Hola', '1985-09-10', 'Ciudad de Guatemala'
execute Sp_InsertCliente '75234896-L', 'Luis', 'Legolas', null, 'Martínez', 'Hernández', null, '1990-07-15', 'Ciudad de Guatemala'
execute Sp_InsertCliente '46238159-P', 'Ana', 'Isabel', null, 'García', 'Pérez', 'Mera', '1988-03-25', 'Ciudad de Guatemala'
execute Sp_InsertCliente '58741236-K', 'Carlos', 'Tranduhil', 'Frodo', 'Fernández', 'Díaz', null, '1992-11-30', 'Ciudad de Guatemala'
execute Sp_InsertCliente '62394718-J', 'Laura', 'Tusa', 'Mara', 'Rodríguez', 'Sánchez', null, '1996-02-18', 'Ciudad de Guatemala'

execute Sp_InsertCliente '81472935-M', 'Pedro', 'Humo', null, 'Gómez', 'Martínez', null, '1987-08-05', 'Ciudad de Guatemala'
execute Sp_InsertCliente '54981273-J', 'Carmen', 'María', 'Negro', 'Hernández', 'López', 'Suares', '1993-04-12', 'Ciudad de Guatemala'
execute Sp_InsertCliente '23548719-P', 'Pablo', 'José', null, 'Díaz', 'Gómez', null, '1989-10-20', 'Ciudad de Guatemala'
execute Sp_InsertCliente '67421839-M', 'Rosa', 'Melano', 'Hulugrun', 'Pérez', 'Fernández', 'Medrano', '1995-06-08', 'Ciudad de Guatemala'
execute Sp_InsertCliente '48291357-L', 'Francisco', 'Cepillo', 'Rosa', 'Sánchez', 'Martínez', null, '1986-12-15', 'Ciudad de Guatemala'
execute Sp_InsertCliente '12463466-K', 'Oracle', 'Server', 'Server', 'Ojuela', 'Mendez', null, '2001-01-12', 'Ciudad de Guatemala'


select * from Cliente 
select * from Clientelog

update Cliente
SET	PrimerNombre = 'Hola mundo'
where Nit = '81472935-M'



/*Procedimiento almacenado para la inserccion en la tabla Empleado*/

                     -- Cod | 1.Nombre | 2.Nombre | 3.Nombre | 1.Apellido | 2.Apellido | ApellidoCasa | FechaNaci | CorreoElectro | Telefono | FechaBaja|Genero 
execute Sp_InsertEmpleado '3456Y', 'Abraham', 'Lorenzo', null, 'García', 'Martínez', null, '12-07-2000','abrahamgarcia@gmail.com', '1254-5467', null, 'M'
execute Sp_InsertEmpleado '4577H', 'Manuel', 'Juan', 'Jefe', 'González', 'Pérez', null, '09-11-2012', 'manueljuan634@gmail.com', '2354-6478', null, 'M'
execute Sp_InsertEmpleado '4764K', 'Jose', 'Neptuno', null, 'Martínez', 'López', null, '1989-03-12', 'josemartinez234@gmail.com', '1276-8675', null, 'M'
execute Sp_InsertEmpleado '6467K', 'Rolando', 'Venuz', null, 'Rodríguez', 'Sánchez', null, '03-07-1990', 'rolandoVenuz23@gmail.com', '2345-8754', null, 'M'
execute Sp_InsertEmpleado '3462M', 'Carlo', 'Nvidia', null, 'López', 'Pérez', null, '02-12-2002', 'carlo123mm@gmail.com', '1245-2356', null, 'M'
execute Sp_InsertEmpleado '7534K', 'Neymar', 'Ojuela', null, 'Nori', 'López', null, '1988-06-12', 'NeymarJr34@gmail.com', '1346-3455', '2021-03-12', 'F'
execute Sp_InsertEmpleado '5435L', 'María', 'Elena', 'Rafa', 'Martínez', 'González', null, '1988-10-20', 'mariamartinez@gmail.com', '9876-4321', null, 'F'
execute Sp_InsertEmpleado '3456B', 'Ana', 'Isabel', null, 'Gómez', 'Fernández', null, '1992-12-30', 'anagomez@gmail.com', '4561-2378', null, 'F'
execute Sp_InsertEmpleado '7478G', 'Pablo', 'José', null, 'Jiménez', 'Pérez', null, '1994-02-28', 'pablojimenez@gmail.com', '3216-5498', null, 'M'
execute Sp_InsertEmpleado '3456S', 'Rosa', 'Serio', null, 'Martínez', 'Fernández', 'Oreo', '1997-11-10', 'rosa.martinez@gmail.com', '6543-2178', null, 'F'

execute Sp_InsertEmpleado '1263Y', 'Francisco', 'Pc', 'Raton', 'González', 'López', null, '1985-08-22', 'francisco.gonzalez@gmail.com', '9875-4123', '2012-09-12', 'M'
execute Sp_InsertEmpleado '4623C', 'Elena', 'Mera', null, 'Fernández', 'García', null, '1996-01-17', 'elena.fernandez@gmail.com', '3219-8764', null, 'F'
execute Sp_InsertEmpleado '4684X', 'Carlos', 'Oreo', null, 'Díaz', 'Martínez', null, '1990-07-03', 'carlos.diaz@gmail.com', '6541-3987', '2008-09-23', 'M'
execute Sp_InsertEmpleado '2356Z', 'Sofía', 'Luz', null, 'Rodríguez', 'Sánchez', null, '1988-04-29', 'sofia.rodriguez@gmail.com', '9765-4321', null, 'F'
execute Sp_InsertEmpleado '2351A', 'Javier', 'Soledad', 'Euro', 'Pérez', 'Gómez', null, '1993-02-14', 'javierperez@gmail.com', '3216-5487', null, 'M'
execute Sp_InsertEmpleado '5734U', 'Isabel', 'Coco', null, 'López', 'Fernández', null, '1986-09-08', 'isabellopez@gmail.com', '6532-1789', '2011-10-02', 'F'
execute Sp_InsertEmpleado '9505T', 'Miguel', '', null, 'Gómez', 'Martínez', null, '1991-12-05', 'miguelgomez@gmail.com', '9865-4321', null, 'M'
execute Sp_InsertEmpleado '2356W', 'Paula', 'Rubio', null, 'Martínez', 'Sánchez', 'Jute', '1989-06-21', 'paulamartinez@gmail.com', '2198-7654', null, 'F'
execute Sp_InsertEmpleado '2684Q', 'Alejandro', 'Nelson', null, 'Fernández', 'Rodríguez', null, '1994-03-18', 'alejandrofernandez@gmail.com', '6543-1987', '2015-09-24', 'M'
execute Sp_InsertEmpleado '2509F', 'Luis', 'Osico', 'Melvin', 'Hernández', 'Rodríguez', null, '1995-03-08', 'luishernandez@example.com', '6549-8321', null, 'M'


select * from Empleado
select * from Empleadolog

update Empleado
set PrimerApellido = ''
where CodigoEmpleado = ''


/*Procedimiento almacenado para la inserccion en la tabla Producto*/

                    -- CodigoP | NombreProducto |  Marca  | Tamanio | Descripcion | Precio Venta
execute Sp_InsertProducto '845R', 'Arroz',  'Troll',  '1 kg',  'Arroz blanco de grano blanco',  02.99
execute Sp_InsertProducto '345H','Leche', 'Alpura', '1 litro', 'Leche entera pasteurizada', 01.99
execute Sp_InsertProducto '124J','Pan', 'Osito Furioso', '400g', 'Pan de trigo blanco rebanado', 02.49
execute Sp_InsertProducto '867N','Huevos', 'Locas Locas', '12 unidades', 'Huevos frescos de gallinas criadas en libertad', 03.99
execute Sp_InsertProducto '987L','Frijoles', 'La Greñuda', '430g', 'Frijoles negros enlatados', 01.79
execute Sp_InsertProducto '536G','Pasta', 'La Grasosa', '500g', 'Pasta italiana tipo spaghetti', 01.29
execute Sp_InsertProducto '836K','Cereal', 'Kelloggs', '500g', 'Cereal de maíz con azúcar', 03.99
execute Sp_InsertProducto '346H', 'Aceite de Cocina', 'MarcaC', '1 litro', 'Aceite vegetal para cocinar, ideal para freír y preparar alimentos', 3.99
execute Sp_InsertProducto '245C', 'Azúcar Blanca', 'MarcaD', '2 kg', 'Azúcar refinada de caña, perfecta para endulzar bebidas y postres', 1.79
execute Sp_InsertProducto '747N', 'Sal de Mesa', 'MarcaE', '1 kg', 'Sal fina para sazonar alimentos y conservar alimentos', 01.99

execute Sp_InsertProducto '138T', 'Café Molido', 'MarcaF', '500 g', 'Café tostado y molido, ideal para preparar café americano o espresso', 4.99
execute Sp_InsertProducto '638L', 'Sopa Instantánea', 'MarcaI', '85 g', 'Sopa instantánea en sobre, fácil de preparar y deliciosa', 05.79
execute Sp_InsertProducto '524X', 'Salsa de Tomate', 'MarcaJ', '400 g', 'Salsa de tomate lista para usar, perfecta para pizzas, pastas y más', 1.29
execute Sp_InsertProducto '526E', 'Galletas Saladas', 'MarcaK', '200 g', 'Galletas saladas ideales para acompañar con queso o untables', 1.19
execute Sp_InsertProducto '067I', 'Aceitunas Verdes', 'MarcaL', '250 g', 'Aceitunas verdes sin hueso, perfectas como aperitivo o para ensaladas', 2.99
execute Sp_InsertProducto '263P', 'Vinagre de Manzana', 'MarcaM', '500 ml', 'Vinagre de manzana orgánico, ideal para aderezar ensaladas y marinar carne', 3.49
execute Sp_InsertProducto '250D', 'Miel de Abeja', 'MarcaN', '350 g', 'Miel pura de abeja, endulzante natural para infusiones, postres y más', 4.99
execute Sp_InsertProducto '623Q', 'Papas Fritas', 'MarcaP', '200 g', 'Papas fritas crujientes y deliciosas, perfectas como snack', 1.79
execute Sp_InsertProducto '619V', 'Refresco de Cola', 'MarcaQ', '2 litros', 'Refresco sabor cola, refrescante y delicioso para acompañar comidas', 1.49
execute Sp_InsertProducto '473U', 'Agua Mineral', 'MarcaR', '1.5 litros', 'Agua mineral natural, perfecta para hidratarse en cualquier momento', 02.99


select * from Producto
select * from Productolog

update Producto
set Nombreproducto = ''
where CodigoProducto = ''


/*Procidimiento almacenado para la inserccion en la tabla Proveedor*/

                    -- CorrelativoProveedor | NombreProveedor | Direccion | Telefono | CorreoElectronico | Pais 
execute Sp_InsertProveedor 'DK125', 'Distribuidora Alimentos Guatemalteca', '15 Avenida A, Zona 10, Ciudad de Guatemala', '+502 1234-5678', 'info@distribuidoraalimentos.gt', 'Guatemala'
execute Sp_InsertProveedor 'JK798', 'Lácteos de Occidente', '3a Calle 6-23, Zona 1, Quetzaltenango', '+502 9876-5432', 'ventas@lacteosdeoccidente.gt', 'Guatemala'
execute Sp_InsertProveedor 'EV458', 'Panificadora San Raton', '7a Avenida 2-87, Zona 3, Escuintla', '+502 2468-1357', 'contacto@panificadorasanraton.gt', 'Guatemala'
execute Sp_InsertProveedor 'ZX675', 'Huevos Naturales El Pollon Guatemala', 'Boulevard Roosevelt, Zona 5, Cobán', '+502 3698-1472', 'info@huevosnaturaleselpollon.gt', 'Guatemala'
execute Sp_InsertProveedor 'LP978', 'Conservas Guatemaltecas', '12 Calle, Zona 2, Chimaltenango', '+502 1596-3574', 'ventas@conservasgt.gt', 'Guatemala'
execute Sp_InsertProveedor 'NM436', 'Pasta Guatemalteca', 'Boulevard 20 de Octubre, Zona 1, Santa Rosa', '+502 7412-3698', 'ventas@pastaguatemala.gt', 'Guatemala'
execute Sp_InsertProveedor 'OI089', 'Cereales Guatemaltecos', '4a Calle, Zona 1, Flores, Petén', '+502 3698-7412', 'info@cerealesgt.gt', 'Guatemala'
execute Sp_InsertProveedor 'FD890', 'Aceites  Ltda.', 'Avenida Central #789', '456123789', 'contacto@aceitesycondimentos.com', 'Colombia'
execute Sp_InsertProveedor 'DF467', 'Industria Azucarera', 'Avenida Dulzura #1718', '789123456', 'ventas@azucarera.com', 'Panamá'
execute Sp_InsertProveedor 'CJ193', 'Productos del Mar S.A.', 'Av. Principal #123', '123456789', 'info@distribuidoraalimentos.com', 'México'

execute Sp_InsertProveedor 'XM248', 'Cafés del Sur Ltda.', 'Paseo de las Aromas #678', '321654987', 'info@cafesdelsur.com', 'Argentina'
execute Sp_InsertProveedor 'SI218', 'Distribuidora Sopas S.A.', 'Calle de los Espaguetis #910', '654321987', 'contacto@pastas.com', 'Chile'
execute Sp_InsertProveedor 'UD824', 'Salsas y Aderezos Exportadores', 'Avenida del Sabor #1112', '987321654', 'ventas@salsasyaderezos.com', 'Ecuador'
execute Sp_InsertProveedor 'CB478', 'Galletas Nacional S.A.', 'Carrera 10 #345', '789456123', 'ventas@harineranacional.com', 'Perú'
execute Sp_InsertProveedor 'PL239', 'Empacadora Frutas Tropicales', 'Calle del Mango #1920', '321456789', 'info@frutastropicales.com', 'Costa Rica'
execute Sp_InsertProveedor 'AS258', 'Fábrica de Conservas Naturales', 'Calle de los Vegetales #2526', '456321789', 'info@conservas.com', 'Nicaragua'
execute Sp_InsertProveedor 'XK319', 'Abeja reina S.A.', 'Carrera de los Granos #1516', '321789654', 'contacto@cerealeros.com', 'Uruguay'
execute Sp_InsertProveedor 'SD391', 'Fabricante Galgerias', 'Calle de los Aromas #3132', '789654123', 'info@especiasyhierbas.com', 'República Dominicana'
execute Sp_InsertProveedor 'LZ824', 'Distribuidora Bebidas Refrescantes', 'Avenida de las Burbujas #2728', '123789456', 'ventas@bebidasrefrescantes.com', 'Belice'
execute Sp_InsertProveedor 'QO913', 'Empaque y Envasado S.A.', 'Carretera del Empaque #2930', '654123789', 'contacto@empaqueyenvasado.com', 'Puerto Rico'


select * from Proveedor
select * from Proveedorlog

update Proveedor 
set NombreProveedor = ''
where CorrelativoProveedor = ''



/*Procedimieto almaceando para la inserccion en la tabla Inventario*/

--CorrelativoInventario | Proveedor1 | NombreProducto | FechaIngreso | Lote | FechaCaducidad | CantidadProducto | Categoria | Ubicacion | Marca | PrecioUnitarioVenta    
execute Sp_InsertInventario 'INV001', 'DK125', 'Arroz', '2024-03-13 10:00:00', 'Lote001', '2025-03-13', 100 , 'Alimentos secos', 'Bodega 1', 'Nestlé', 02.99
execute Sp_InsertInventario 'INV002', 'JK798', 'Leche', '2024-03-13 10:15:00', 'Lote002', '2024-04-13', 50, 'Lácteos', 'Refrigerador 1', 'Alpura', 01.99
execute Sp_InsertInventario 'INV003', 'EV458', 'Pan', '2024-03-13 10:30:00', 'Lote003', '2024-03-20', 20, 'Panadería', 'Estantería 2', 'Bimbo', 02.49
execute Sp_InsertInventario 'INV004', 'ZX675', 'Huevos', '2024-03-13 10:45:00', 'Lote004', '2024-03-20', 60, 'Huevos y lácteos', 'Refrigerador 2', 'San Juan', 03.99
execute Sp_InsertInventario 'INV005', 'LP978', 'Frijoles', '2024-03-13 11:00:00', 'Lote005', '2025-03-13', 80, 'Alimentos secos', 'Bodega 2', 'La Costeña', 01.79
execute Sp_InsertInventario 'INV006', 'NM436', 'Pasta', '2024-03-13 11:30:00', 'Lote006', '2024-05-13', 40, 'Alimentos secos', 'Bodega 3', 'Barilla', 01.29
execute Sp_InsertInventario 'INV007', 'OI089', 'Cereal', '2024-03-13 12:00:00', 'Lote007', '2024-04-30', 15 , 'Cereales y desayunos', 'Estantería 5', 'Kellogg', 3.99
execute Sp_InsertInventario 'INV008',  'FD890', 'Aceite de Cocina', '2024-04-03 11:20:00', 'Lote008', '2025-05-20', 100, 'Aceites y Condimentos', 'Estantería 3', 'Aceites y Condimentos Ltda.', 3.99
execute Sp_InsertInventario 'INV009',  'DF467', 'Azúcar Blanca', '2024-04-04 08:00:00', 'Lote009', '2025-02-28', 500, 'Endulzantes', 'Estantería 4', 'Distribuidora Azúcares S.A.', 1.79
execute Sp_InsertInventario 'INV0010', 'CJ193', 'Sal de Mesa', '2024-04-05 14:15:00', 'Lote0010', '2025-06-10', 500, 'Condimentos', 'Estantería 22', 'Distribuidora Condimentos Ltda.', 01.99

execute Sp_InsertInventario 'INV0011', 'XM248', 'Café Molido', '2024-04-06 13:30:00', 'Lote0011', '2025-04-15', 150, 'Cafés y Tés', 'Estantería 6', 'Cafés del Sur Ltda.', 5.99
execute Sp_InsertInventario 'INV0012', 'SI218', 'Sopa Instantanea', '2024-04-08 11:00:00', 'Lote0012', '2025-02-28', 200, 'Pastas y Salsas', 'Estantería 8', 'Distribuidora Pastas S.A.', 5.79
execute Sp_InsertInventario 'INV0013', 'UD824', 'Salsa de Tomate', '2024-04-10 09:30:00', 'Lote013', '2025-04-20', 250, 'Pastas y Salsas', 'Estantería 10', 'Salsas y Aderezos Exportadores', 1.29
execute Sp_InsertInventario 'INV0014', 'CB478', 'Galletas Saladas', '2024-04-11 08:45:00', 'Lote014', '2025-03-25', 359, 'Snacks y Galletas', 'Estantería 11', 'Galletera Central S.A.', 1.19
execute Sp_InsertInventario 'INV0015', 'PL239', 'Aceitunas Verdes', '2024-04-12 10:00:00', 'Lote015', '2025-06-05', 200, 'Aceitunas y Encurtidos', 'Estantería 12', 'Productos del Campo S.A.', 2.99
execute Sp_InsertInventario 'INV0016', 'AS258', 'Vinagre de Manzana', '2024-04-13 11:15:00', 'Lote016', '2025-05-15', 150, 'Condimentos y Vinagres', 'Estantería 13', 'Aceites y Condimentos Ltda.', 3.49
execute Sp_InsertInventario 'INV0017', 'XK319', 'Miel de Abeja', '2024-04-14 09:30:00', 'Lote017', '2025-03-10', 250 , 'Endulzantes y Mieles', 'Estantería 14', 'Apicultura Nacional S.A.', 4.99
execute Sp_InsertInventario 'INV0018', 'SD391', 'Papas Fritas', '2024-04-16 10:00:00', 'Lote018', '2025-06-20', 400, 'Snacks y Frituras', 'Estantería 16', 'Patatas S.A.', 1.79
execute Sp_InsertInventario 'INV0019', 'LZ824', 'Refresco de Cola', '2024-04-17 11:15:00', 'Lote019', '2025-05-05', 200, 'Bebidas Gaseosas', 'Estantería 17', 'Bebidas Refrescantes S.A.', 1.49
execute Sp_InsertInventario 'INV0020', 'QO913', 'Agua Mineral', '2024-04-18 09:30:00', 'Lote020', '2025-07-01', 300, 'Bebidas No Alcohólicas', 'Estantería 18', 'Agua Pura S.A.', 02.99


select * from Inventario
select * from Inventariolog 

update Inventario 
set CantidadProducto = 
where CorrelativoInventario = ''



/*Procimiento almacenado para la inserccion en la tabla ProdcutoInventario*/

                  -- CorrelativoInventario | CodigoProducto 
execute Sp_InsertarProductoInventario 'INV001', '845R'
execute Sp_InsertarProductoInventario 'INV002', '345H'
execute Sp_InsertarProductoInventario 'INV003', '124J'
execute Sp_InsertarProductoInventario 'INV004', '867N'
execute Sp_InsertarProductoInventario 'INV005', '987L'
execute Sp_InsertarProductoInventario 'INV006', '536G'
execute Sp_InsertarProductoInventario 'INV007', '836K'
execute Sp_InsertarProductoInventario  'INV008',  '346H'
execute Sp_InsertarProductoInventario  'INV009',  '245C'
execute Sp_InsertarProductoInventario  'INV0010', '747N'

execute Sp_InsertarProductoInventario  'INV0011', '138T'
execute Sp_InsertarProductoInventario  'INV0012', '638L'
execute Sp_InsertarProductoInventario  'INV0013', '524X'
execute Sp_InsertarProductoInventario  'INV0014', '526E'
execute Sp_InsertarProductoInventario  'INV0015', '067I'
execute Sp_InsertarProductoInventario  'INV0016', '263P'
execute Sp_InsertarProductoInventario  'INV0017', '250D'
execute Sp_InsertarProductoInventario  'INV0018', '623Q'
execute Sp_InsertarProductoInventario  'INV0019', '619V'
execute Sp_InsertarProductoInventario  'INV0020', '473U'


select * from ProductoInventario 
select * from ProductoInventariolog



/*Procedimiento almacenado para la inserccion en la tabla Empresa*/

 --NitEmpresa | NombreLegal | NombreComercial | Telefono | Direccion | CorreoElectronico 
execute Sp_InsertEmpresa '12436580-K', 'El señor de los anillos Ulugrun', 'El señor de los anillos', '1245-2345', '7 Avenida A, Zona 10', 'anillosmagicos123@gmail.com'

update Empresa
set NombreLegal = 'Hola como estas'
where NitEmpresa = '12436580-K'

select * from Empresa
select * from Empresalog






















































































































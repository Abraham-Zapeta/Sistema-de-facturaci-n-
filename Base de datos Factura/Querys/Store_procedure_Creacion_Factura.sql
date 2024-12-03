
USE Facturacion



/*Procedimiento almacenado para crear una factura*/

/*Tabla Temporal*/

create table ##TFacturaDetalle (
   Correlativo varchar (50) primary key not null,
   NombreProducto varchar (50) not null, 
   PrecioUnitario decimal (10,2) check (PrecioUnitario > 0) not null,
   Cantidad int check (Cantidad > 0) not null,
   Subtotal decimal (10,2) check (Subtotal > 0) not null, 
   Fel varchar (50) not null,                                                                
   CodigoProducto varchar (50) not null
)



/*  Proceso Almacenado para FacturaEncabezado  */

create procedure Sp_InsertarEncabezado
    @NitClienteN varchar (50),
    @CodigoEmpleadoN varchar (50)
as
begin 
    begin try
        -- Iniciar la transacción
        begin transaction 

        declare @FelN varchar (50)

        -- Generar un nuevo Fel usando la función NEWID
        set @FelN = CONVERT(varchar (50), NEWID())

        -- Nit de la empresa predefinido (12541345-M)
        declare @NitEmpresaN varchar (50)
        set @NitEmpresaN = '12436580-K' 

-- Declarar el cursor para insertar en FacturaEncabezado
declare cursorencabezado cursor scroll
        for select @FelN, @NitClienteN, @NitEmpresaN, @CodigoEmpleadoN

--Abro el cursor 		
open cursorencabezado
		declare @FelCursorN varchar (50)
        declare @NitClienteCursorN varchar (50)
        declare @NitEmpresaCursorN varchar (50)
        declare @CodigoEmpleadoCursorN varchar (50)

		fetch next from cursorencabezado
		into @FelCursorN, @NitClienteCursorN, @NitEmpresaCursorN, @CodigoEmpleadoCursorN

while (@@FETCH_STATUS = 0)
		begin
        -- Insertar el nuevo registro en la tabla FacturaEncabezado
        insert into FacturaEncabezado (Fel, Nit, NitEmpresa, CodigoEmpleado)
        values (@FelCursorN, @NitClienteCursorN, @NitEmpresaCursorN, @CodigoEmpleadoCursorN)
        
		fetch next from cursorencabezado
		into @FelCursorN, @NitClienteCursorN, @NitEmpresaCursorN, @CodigoEmpleadoCursorN

		end
--Cierro el cursor         
close cursorencabezado
deallocate cursorencabezado

        -- Commit de la transacción si todo es exitoso
		 SELECT '00000' AS Codigo, 'Insertado exitosamente' AS Mensaje

        commit transaction 
    end try 
    begin catch
        -- Rollback de la transacción si hay algún error
        if (@@TRANCOUNT > 0)
            rollback transaction 

        -- Captura y muestra el mensaje de error
        declare @ErrorMessage varchar (200)
        declare @ErrorSeverity varchar (200)
        

        select
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_NUMBER ()

        
    end catch
end




/*Procedimiento almacenado para la tabla temporal*/

create procedure Sp_InsertarDetalleTemporal
    @Fel1 VARCHAR(50),
    @CodigoProducto2 VARCHAR(50),
    @Cantidad3 INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        DECLARE @Correlativo1 VARCHAR(50)
        DECLARE @NombreProducto2 VARCHAR(50)
        DECLARE @PrecioUnitario3  DECIMAL(10,2)
        DECLARE @Subtotal4 DECIMAL(10,2)

        -- Generar un nuevo correlativo usando la función NEWID
        SET @Correlativo1 = CONVERT(VARCHAR(50), NEWID())

        -- Obtener el nombre del producto, precio unitario
        SELECT @NombreProducto2 = NombreProducto, @PrecioUnitario3 = PrecioVenta
        FROM Producto
        WHERE CodigoProducto = @CodigoProducto2


        -- Calcular el subtotal
        SET @Subtotal4 = @PrecioUnitario3 * @Cantidad3

        -- Insertar los datos en la tabla temporal #TFacturaDetalle
        INSERT INTO ##TFacturaDetalle (Correlativo, NombreProducto, PrecioUnitario, Cantidad, Subtotal, Fel, CodigoProducto)
        VALUES (@Correlativo1, @NombreProducto2, @PrecioUnitario3, @Cantidad3, @Subtotal4, @Fel1, @CodigoProducto2)

        SELECT '00000' AS Codigo, 'Insertado exitosamente' AS Mensaje

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION

        DECLARE @ErrorMessage VARCHAR(300)
        DECLARE @ErrorNumber VARCHAR(300)

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorNumber = ERROR_NUMBER()
    END CATCH
END





/*Procedimiento almacenado para la tabla Facturadetalle*/


CREATE PROCEDURE Sp_FacturaDetalleReal
AS
BEGIN
    -- Declaración de variables para el cursor
    DECLARE @VarCorrelativo varchar(50),
            @VarNombreProducto NVARCHAR(100),
            @VarPrecioUnitario DECIMAL(18, 2),
            @VarCantidad INT,
            @VarSubtotal DECIMAL(18, 2),
            @VarFel NVARCHAR(50),
            @VarCodigoProducto NVARCHAR(50)
    
    -- Declaración del cursor
    DECLARE CursorFacturaDetalle11 CURSOR FOR
        SELECT Correlativo, NombreProducto, PrecioUnitario, Cantidad, Subtotal, Fel, CodigoProducto
        FROM ##TFacturaDetalle

    -- Inicio de la transacción
    BEGIN TRANSACTION

    BEGIN TRY
        -- Abrir el cursor
        OPEN CursorFacturaDetalle11

        -- Recuperar la primera fila
        FETCH NEXT FROM CursorFacturaDetalle11 INTO @VarCorrelativo, @VarNombreProducto, 
            @VarPrecioUnitario, @VarCantidad, @VarSubtotal, @VarFel, @VarCodigoProducto

        -- Iterar sobre todas las filas
        WHILE (@@FETCH_STATUS = 0)
        BEGIN
            -- Insertar cada fila en FacturaDetalle
            INSERT INTO FacturaDetalle (Correlativo, NombreProducto, PrecioUnitario, Cantidad, Subtotal, Fel, CodigoProducto)
            VALUES (@VarCorrelativo, @VarNombreProducto, @VarPrecioUnitario, @VarCantidad, @VarSubtotal, @VarFel, @VarCodigoProducto)

            -- Actualizar la cantidad de productos en Inventario
            UPDATE Inventario
            SET CantidadProducto = CantidadProducto - @VarCantidad
            WHERE NombreProducto = @VarNombreProducto

            -- Recuperar la siguiente fila
            FETCH NEXT FROM CursorFacturaDetalle11 INTO @VarCorrelativo, @VarNombreProducto, 
                @VarPrecioUnitario, @VarCantidad, @VarSubtotal, @VarFel, @VarCodigoProducto
        END

        -- Cerrar y desasignar el cursor
        CLOSE CursorFacturaDetalle11
        DEALLOCATE CursorFacturaDetalle11

        -- Paso 2: Actualizar el total en FacturaEncabezado
        UPDATE TablaEncabezado
        SET TablaEncabezado.Total = TablaSuma.TotalSumado
        FROM FacturaEncabezado TablaEncabezado
        JOIN (
            SELECT Fel, SUM(Subtotal) AS TotalSumado
            FROM FacturaDetalle
            GROUP BY Fel 
        ) TablaSuma ON TablaEncabezado.Fel = TablaSuma.Fel

        -- Eliminar datos de la tabla temporal
        DELETE FROM ##TFacturaDetalle

        -- Confirmar la transacción
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION

        DECLARE @MensajeError NVARCHAR(300)
        DECLARE @NumeroError INT

        SELECT 
            @MensajeError = ERROR_MESSAGE(),
            @NumeroError = ERROR_NUMBER()
        
        -- Manejo de errores (puede personalizarse según sea necesario)
        RAISERROR (@MensajeError, 16, 1)
    END CATCH
END



/* Vista factura completa */

create view V_Factura_Completa
as 
select  em.NitEmpresa,em.NombreLegal, f.Fel, f.Fecha, em.Direccion, c.Nit as Nit_Cliente, c.PrimerNombre, c.SegundoNombre, c.TercerNombre, 
c.PrimerApellido, c.SegundoApellido, c.ApellidoCasada, e.CodigoEmpleado as [No.Asalariado], e.PrimerNombre as Nombre_asalariado, 
c.SegundoApellido as Apellido_asalariado, p.Nombreproducto as Producto, 
p.Descripción, p.Marca, d.Cantidad, d.PrecioUnitario as Precio, d.Subtotal as total 
from FacturaEncabezado as f
Inner join FacturaDetalle as d
     on f.Fel = d.Fel
inner join Cliente as c
     on c.Nit = f.Nit
inner join Empleado  as e
     on e.CodigoEmpleado = f.CodigoEmpleado
inner join Empresa as em
     on em.NitEmpresa =  f.NitEmpresa
inner join Producto as p 
     on p.CodigoProducto = d.CodigoProducto



                              --Nit_cliente  -- Codigo_empleado
execute Sp_InsertarEncabezado '81472935-M', '123423-s'

                                 -- Fel -- Codigo_producto -- Cantidad                  
execute Sp_InsertarDetalleTemporal '054EF60B-121B-4818-85E5-7681260CA078', '138T', 10

execute Sp_FacturaDetalleReal


select * from V_Factura_Completa



select * from Producto
select * from Productolog
select * from Empleado
select * from Cliente
select * from Clientelog
select * from ##TFacturaDetalle
select * from FacturaEncabezado
select * from FacturaEncabezadolog
SELECT * FROM FacturaDetalle
SELECT * FROM Inventario
select * from Inventariolog

SELECT * FROM FacturaDetalle
select * from FacturaDetallelog






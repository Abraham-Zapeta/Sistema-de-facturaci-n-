use Facturacion 


/*Procedimiento almacenado para la insercion en la tabla Cliente*/

create procedure Sp_InsertCliente
    @Nit varchar(50),
    @Primernombre varchar(50),
    @Segundonombre varchar(50) = null,
    @Tercernombre varchar(50) = null,
    @Primerapellido varchar(50),
    @Segundoapellido varchar(50) = null,
    @ApellidoCasada varchar(50) = null,
	@FechaNacimiento1 date null,
    @Direccion varchar(50) = null
as
begin
    begin try
        begin transaction

--almaceno el recuento de registros de clientes con el mismo Nit
        declare @Cliente int
          set @Cliente = 0

		declare @Edad123 varchar(20)
          set @Edad123 = ''

     if @FechaNacimiento1 is not null
        begin
            set @Edad123 = CONVERT(varchar(20), DATEDIFF(YEAR, @FechaNacimiento1, GETDATE()))
        end

--obtengo el recuento de registros de clientes con el mismo NIT
        declare ClientCursor cursor 
           for select COUNT(*) from Cliente where Nit = @Nit
--consulta que cuenta el número de registros en la tabla Cliente con el Nit
           open ClientCursor


		while (@@FETCH_STATUS = 0)
        fetch next from ClientCursor into @Cliente
           close ClientCursor  
           deallocate ClientCursor

--Se verifica si el recuento de registros es igual a cero sii es así, significa que no hay ningún cliente con el mismo Nit
        if @Cliente = 0
        begin
            insert into Cliente (Nit, PrimerNombre, SegundoNombre, TercerNombre, 
                                PrimerApellido, SegundoApellido, ApellidoCasada, FechaNacimiento, Edad, Direccion)
            values (@Nit, @Primernombre, @Segundonombre, @Tercernombre,
                    @Primerapellido, @Segundoapellido, @ApellidoCasada, @FechaNacimiento1, @Edad123, @Direccion)
            
            select '00000' AS Codigo, ' Cliente insertado exitosamente ' as Mensaje
            commit transaction
        end 
        else
        begin
            select ' Cliente con Nit ' +  @Nit  as Mensaje
        end
    end try
    begin catch
	select
	        ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje
        
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    end catch
end



/*Procedimiento almacenado para la insercion en la tabla Empleado*/

create procedure Sp_InsertEmpleado
    @Codigo varchar(50),
    @Primernombre1 varchar(50),
    @Segundonombre1 varchar(50) = null,
    @Tercernombre1 varchar(50) = null,
    @Primerapellido1 varchar(50),
    @Segundoapellido1 varchar(50) = null,
    @ApellidoCasada1 varchar(50) = null,
    @Fechanacimiento2 date = null,
    @CorreoElectronico varchar(50),
    @Telefono333 varchar(50),
    @FechaBaja date = null,
    @Genero char(1) = null
as
begin
    begin try
        begin transaction

        declare @Empleado int
           set @Empleado = 0

        declare @Edad varchar(20)
           set @Edad = ''

        if @Fechanacimiento2 is not null
        begin
            set @Edad = CONVERT(varchar(20), DATEDIFF(YEAR, @Fechanacimiento2, GETDATE()))
        end

        declare EmpleadoCursor cursor 
           for select COUNT(*) from Empleado
        where CodigoEmpleado = @Codigo 
	
           open EmpleadoCursor
		while (@@FETCH_STATUS = 0)
        fetch next from EmpleadoCursor into @Empleado
           close EmpleadoCursor
           deallocate EmpleadoCursor

        if @Empleado = 0
        begin
            insert into Empleado (CodigoEmpleado, PrimerNombre, SegundoNombre, TercerNombre, PrimerApellido,
                                  SegundoApellido, ApellidoCasada, FechaNacimiento, Edad, CorreoElectronico, Telefono, FechaBaja, Genero)
            values (@Codigo, @Primernombre1, @Segundonombre1, @Tercernombre1, @Primerapellido1,
                    @Segundoapellido1, @ApellidoCasada1, @Fechanacimiento2, @Edad, @CorreoElectronico, @Telefono333, @FechaBaja, @Genero)
              
            select '00000' AS Codigo, 'Empleado insertado exitosamente' as Mensaje
            commit transaction
        end 
        else
        begin
            select 'Cliente con Nit ' +  @Codigo  as Mensaje
        end
    end try
    begin catch
          select
	        ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje
        
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
    end catch
end





/*Procedimiento almacenado para la insercion de la tabla Producto*/

create procedure Sp_InsertProducto
    @Codigoproducto varchar(50),
    @Nombreproducto varchar(50),
    @Marca varchar(50),
    @Tamanio111 varchar(50),
    @Descripcion varchar(200),
    @PrecioVenta decimal(10, 2)
as
begin
    begin try
        begin transaction

        declare @Producto int
           set @Producto = 0

        -- Verificar si el código de producto ya existe
        declare ProductoCursor cursor 
          for select COUNT(*) from Producto
            where Codigoproducto = @Codigoproducto
          open ProductoCursor
		while (@@FETCH_STATUS = 0)
        fetch next from ProductoCursor into @Producto
          close ProductoCursor
          deallocate ProductoCursor

        if @Producto = 0
        begin
            insert into Producto (Codigoproducto, Nombreproducto, Marca, Tamanio, Descripción, PrecioVenta)
            values (@Codigoproducto, @Nombreproducto, @Marca, @Tamanio111, @Descripcion, @PrecioVenta)
              
            select '00000' AS Codigo, 'Producto insertado exitosamente' as Mensaje
            commit transaction
        end 
        else
        begin
            select '00000' AS Codigo, 'Producto con Código ' + @Codigoproducto as Mensaje
        end
    end try
    begin catch
        select
	        ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje
        
            if @@TRANCOUNT > 0
            rollback transaction 
    end catch
end





/*Procimiento almacenado para la insercion de la tabla Proveedor*/

create procedure Sp_InsertProveedor
    @CorrelativoProveedor varchar(50),
    @NombreProveedor varchar(50),
    @Direccion22 varchar(50),
    @Telefono varchar(50),
    @CorreoElectronico1 varchar(50),
    @Pais varchar(50)
as
begin
    begin try
        begin transaction

        declare @Proveedor int
           set @Proveedor = 0

        -- Verificar si el correlativo del proveedor ya existe
        declare ProveedorCursor cursor 
          for select COUNT(*) from Proveedor 
		  where CorrelativoProveedor = @CorrelativoProveedor

          open ProveedorCursor
		while (@@FETCH_STATUS = 0)
        fetch next from ProveedorCursor into @Proveedor
          close ProveedorCursor
          deallocate ProveedorCursor

        if @Proveedor = 0
        begin
            insert into Proveedor (CorrelativoProveedor, NombreProveedor, Dirección, Telefono, CorreoElectronico, Pais)
            values (@CorrelativoProveedor, @NombreProveedor, @Direccion22, @Telefono, @CorreoElectronico1, @Pais)
            
            select '00000' AS Codigo, 'Proveedor insertado exitosamente' as Mensaje
            commit transaction
        end 
        else
        begin
            select 'Proveedor con Correlativo ya existe' + @CorrelativoProveedor as Mensaje
        end
    end try
    begin catch
        select
	        ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje
        
           if @@TRANCOUNT > 0
            rollback transaction 
    end catch
end






/*Procedimiento almacenado para la inserccion de la tabla Inventario*/

create procedure Sp_InsertInventario
    @CorrelativoInventario varchar(50),
	@Proveedor1 varchar (30),
    @NombreProducto555 varchar(50),
    @FechaIngreso datetime,
    @Lote varchar(50),
    @FechaCaducidad date,
    @CantidadProducto int,
    @Categoria varchar(50),
    @Ubicacion varchar(50),
    @Marca1111 varchar(50),
    @PrecioUnitarioVenta decimal(10,2)
as
begin
    begin try
        begin transaction

        -- Almaceno el recuento de registros de productos con el mismo CorrelativoInventario
        declare @Producto int
           set @Producto = 0

        -- Obtengo el recuento de registros de productos con el mismo CorrelativoInventario
        declare ProductCursor cursor for 
            select COUNT(*) from Inventario where CorrelativoInventario = @CorrelativoInventario
        
            open ProductCursor
		while (@@FETCH_STATUS = 0)
        fetch next from ProductCursor into @Producto
           close ProductCursor
           deallocate ProductCursor

        -- Se verifica si el recuento de registros es igual a cero, es decir, no hay ningún producto con el mismo CorrelativoInventario
        if @Producto = 0
        begin
            insert into Inventario (CorrelativoInventario,CorrelativoProveedor, NombreProducto, FechaIngreso, Lote, FechaCaducidad, 
                                    CantidadProducto, Categoria, Ubicación, Marca, PrecioUnitarioVenta)
            values (@CorrelativoInventario,@Proveedor1, @NombreProducto555, @FechaIngreso, @Lote, @FechaCaducidad, 
                    @CantidadProducto, @Categoria, @Ubicacion, @Marca1111, @PrecioUnitarioVenta)
            
            select '00000' AS Codigo, 'Producto insertado exitosamente' as Mensaje
            commit transaction
        end 
        else
        begin
            select 'Ya existe un producto con el CorrelativoInventario ' + @CorrelativoInventario 
        end
    end try
    begin catch
        select
            ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje

        if @@TRANCOUNT > 0
            rollback transaction
    end catch
end






/*Procedimiento almcenado para la insercion de la tabla Empresa*/

create procedure Sp_InsertEmpresa
   @NitEmpresa VARCHAR(50),
   @NombreLegal VARCHAR(50),
   @NombreComercial VARCHAR(50),
   @Telefono444 VARCHAR(50),
   @Direccion33 VARCHAR(50),
   @CorreoElectronico123 VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY
        BEGIN TRANSACTION
        
        -- Verificar si la tabla ya tiene algún registro
        IF (SELECT COUNT(*) FROM Empresa) = 0
        BEGIN
            -- La tabla está vacía, se permite la inserción del primer registro
            INSERT INTO Empresa (NitEmpresa, NombreLegal, NombreComercial, Telefono, Direccion, CorreoElectronico)
            VALUES (@NitEmpresa, @NombreLegal, @NombreComercial, @Telefono444, @Direccion33, @CorreoElectronico123);
            
            SELECT '00000' AS Codigo, 'Registro insertado correctamente.' AS Mensaje
            
            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- La tabla ya contiene al menos un registro, mostrar un mensaje de error
            SELECT  'La tabla ya tiene un registro, no se permite la inserción adicional' 
        END
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje
        
        IF @@TRANCOUNT > 0
            rollback transaction 
    END CATCH
END






/*Procedimiento almacenado para la insercion de la tabla ProductoInventario*/

CREATE PROCEDURE Sp_InsertarProductoInventario
    @CorrelativoInventario1 VARCHAR(50),
    @CodigoProducto1 VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION 
        SET NOCOUNT ON

        DECLARE @InventarioExistente INT
        DECLARE @ProductoExistente INT

        -- Verificar la existencia del inventario
        SELECT @InventarioExistente = COUNT(*) 
        FROM Inventario 
        WHERE CorrelativoInventario = @CorrelativoInventario1

        -- Verificar la existencia del producto
        SELECT @ProductoExistente = COUNT(*) 
        FROM Producto 
        WHERE CodigoProducto = @CodigoProducto1

        -- Si tanto el inventario como el producto existen, se realiza la inserción
        IF @InventarioExistente = 1 AND @ProductoExistente = 1
        BEGIN
            -- Insertar datos en la tabla ProductoInventario
            INSERT INTO ProductoInventario (CorrelativoInventario, CodigoProducto)
            VALUES (@CorrelativoInventario1, @CodigoProducto1)
            
            SELECT '00000' AS Codigo, 'Datos insertados correctamente en ProductoInventario.' AS Mensaje
            COMMIT TRANSACTION
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION
            SELECT 'Error: El inventario o el producto especificado no existe.' AS Mensaje
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
        
        SELECT
            ERROR_NUMBER() AS ErrNumero,
            ERROR_MESSAGE() AS ErrMensaje
    END CATCH
END



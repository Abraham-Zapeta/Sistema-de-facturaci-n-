use Facturacion 


/*Desencadenadores / Disparadores */

/*Trigger para la tabla cliente*/

CREATE or alter TRIGGER Tr_Cliente
ON Cliente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada1 VARCHAR(50) = 'Cliente'
    DECLARE @FechaModificacion2 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion3 VARCHAR(50) = SYSTEM_USER

    --Insert
/*1. verifica si hay filas presentes en la tabla inserted   2.  verifica que no haya filas presentes en la tabla deleted,
                                                             que contendra filas si se estuvieran eliminando en la misma transacción*/
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Clientelog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada1, Nit, 'INSERT', @FechaModificacion2, @UsuarioModificacion3
        FROM inserted
    END

    --Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Clientelog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada1, Nit, 'UPDATE', @FechaModificacion2, @UsuarioModificacion3
        FROM inserted

        UPDATE Cliente
        SET FechaModificacion = @FechaModificacion2,
            UsuarioModificacion = @UsuarioModificacion3
        WHERE Nit IN (SELECT Nit FROM inserted)
    END

    --Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Clientelog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada1, Nit, 'DELETE', @FechaModificacion2, @UsuarioModificacion3
        FROM deleted
    END
END



/*Trigger para la tabla Empleado*/

CREATE or alter TRIGGER Tr_Empleado
ON Empleado
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada4 VARCHAR(50) = 'Empleado'
    DECLARE @FechaModificacion5 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion6 VARCHAR(50) = SYSTEM_USER

    -- Insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Empleadolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada4, CodigoEmpleado, 'INSERT', @FechaModificacion5, @UsuarioModificacion6
        FROM inserted
    END

    -- Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Empleadolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada4, CodigoEmpleado, 'UPDATE', @FechaModificacion5, @UsuarioModificacion6
        FROM inserted

        UPDATE Empleado
        SET FechaModificacion = @FechaModificacion5,
            UsuarioModificacion = @UsuarioModificacion6
        WHERE CodigoEmpleado IN (SELECT CodigoEmpleado FROM inserted)
    END

    -- Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Empleadolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada4, CodigoEmpleado, 'DELETE', @FechaModificacion5, @UsuarioModificacion6
        FROM deleted
    END
END



/*Trigger para la tabla Producto*/

CREATE or alter TRIGGER Tr_Producto
ON Producto
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada7 VARCHAR(50) = 'Producto'
    DECLARE @FechaModificacion8 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion9 VARCHAR(50) = SYSTEM_USER

    --Insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Productolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada7, CodigoProducto, 'INSERT', @FechaModificacion8, @UsuarioModificacion9
        FROM inserted
    END

    --Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Productolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada7, CodigoProducto, 'UPDATE', @FechaModificacion8, @UsuarioModificacion9
        FROM inserted

        UPDATE Producto
        SET FechaModificacion = @FechaModificacion8,
            UsuarioModificacion = @UsuarioModificacion9
        WHERE CodigoProducto IN (SELECT CodigoProducto FROM inserted)
    END

    --Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Productolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada7, CodigoProducto, 'DELETE', @FechaModificacion8, @UsuarioModificacion9
        FROM deleted
    END
END





/*Trigger para la tabla Proveedor*/

CREATE or alter TRIGGER Tr_Proveedor
ON Proveedor
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada11 VARCHAR(50) = 'Proveedor'
    DECLARE @FechaModificacion11 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion11 VARCHAR(50) = SYSTEM_USER

    --Insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Proveedorlog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada11, CorrelativoProveedor, 'INSERT', @FechaModificacion11, @UsuarioModificacion11
        FROM inserted
    END

    --Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Proveedorlog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada11, CorrelativoProveedor, 'UPDATE', @FechaModificacion11, @UsuarioModificacion11
        FROM inserted

        UPDATE Proveedor
        SET FechaModificacion = @FechaModificacion11,
            UsuarioModificacion = @UsuarioModificacion11
        WHERE CorrelativoProveedor IN (SELECT CorrelativoProveedor FROM inserted)
    END

    --Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Proveedorlog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada11, CorrelativoProveedor, 'DELETE', @FechaModificacion11, @UsuarioModificacion11
        FROM deleted
    END
END




/*Trigger para la tabla Inventario*/

CREATE or alter TRIGGER Tr_Inventario
ON Inventario
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada22 VARCHAR(50) = 'Inventario'
    DECLARE @FechaModificacion22 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion22 VARCHAR(50) = SYSTEM_USER

    -- Insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Inventariolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada22, CorrelativoInventario, 'INSERT', @FechaModificacion22, @UsuarioModificacion22
        FROM inserted
    END

    -- Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Inventariolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada22, CorrelativoInventario, 'UPDATE', @FechaModificacion22, @UsuarioModificacion22
        FROM inserted

        UPDATE Inventario
        SET FechaModificacion = @FechaModificacion22,
            UsuarioModificacion = @UsuarioModificacion22
        WHERE CorrelativoInventario IN (SELECT CorrelativoInventario FROM inserted)
    END

    -- Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Inventariolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada22, CorrelativoInventario, 'DELETE', @FechaModificacion22, @UsuarioModificacion22
        FROM deleted
    END
END



/*Trigger para la tabla Empresa*/

CREATE or alter TRIGGER Tr_Empresa
ON Empresa
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada33 VARCHAR(50) = 'Empresa'
    DECLARE @FechaModificacion33 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion33 VARCHAR(50) = SYSTEM_USER

    -- Insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Empresalog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada33, NitEmpresa, 'INSERT', @FechaModificacion33, @UsuarioModificacion33
        FROM inserted
    END

    -- Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Empresalog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada33, NitEmpresa, 'UPDATE', @FechaModificacion33, @UsuarioModificacion33
        FROM inserted

        UPDATE Empresa
        SET FechaModificacion = @FechaModificacion33,
            UsuarioModificacion = @UsuarioModificacion33
        WHERE NitEmpresa IN (SELECT NitEmpresa FROM inserted)
    END

    -- Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Empresalog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada33, NitEmpresa, 'DELETE', @FechaModificacion33, @UsuarioModificacion33
        FROM deleted
    END
END


/*Trigger para la tabla FacturaEncabezado*/

CREATE or alter TRIGGER Tr_FacturaEncabezado
ON FacturaEncabezado
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada44 VARCHAR(50) = 'FacturaEncabezado'
    DECLARE @FechaModificacion44 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion44 VARCHAR(50) = SYSTEM_USER

    --Insert
/*1. verifica si hay filas presentes en la tabla inserted   2.  verifica que no haya filas presentes en la tabla deleted,
                                                             que contendra filas si se estuvieran eliminando en la misma transacción*/
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO FacturaEncabezadolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada44, Fel, 'INSERT', @FechaModificacion44, @UsuarioModificacion44
        FROM inserted
    END

    --Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO FacturaEncabezadolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada44, Fel, 'UPDATE', @FechaModificacion44, @UsuarioModificacion44
        FROM inserted

        UPDATE FacturaEncabezado
        SET FechaModificacion = @FechaModificacion44,
            UsuarioModificacion = @UsuarioModificacion44
        WHERE Fel IN (SELECT Fel FROM inserted)
    END

    --Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO FacturaEncabezadolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada44, Fel, 'DELETE', @FechaModificacion44, @UsuarioModificacion44
        FROM deleted
    END
END




/*Trigger para la tabla FacturaDetalle*/

CREATE or alter TRIGGER Tr_FacturaDetalle
ON FacturaDetalle
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada55 VARCHAR(50) = 'FacturaDetalle'
    DECLARE @FechaModificacion55 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion55 VARCHAR(50) = SYSTEM_USER

    --Insert
/*1. verifica si hay filas presentes en la tabla inserted   2.  verifica que no haya filas presentes en la tabla deleted,
                                                             que contendra filas si se estuvieran eliminando en la misma transacción*/
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO FacturaDetallelog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada55, Correlativo, 'INSERT', @FechaModificacion55, @UsuarioModificacion55
        FROM inserted
    END

    --Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO FacturaDetallelog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada55, Correlativo, 'UPDATE', @FechaModificacion55, @UsuarioModificacion55
        FROM inserted

        UPDATE FacturaDetalle
        SET FechaModificacion = @FechaModificacion55,
            UsuarioModificacion = @UsuarioModificacion55
        WHERE Correlativo IN (SELECT Correlativo FROM inserted)
    END

    --Delete 
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO FacturaDetallelog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada55, Correlativo, 'DELETE', @FechaModificacion55, @UsuarioModificacion55
        FROM deleted
    END
END




/*Trigger paa la tabla ProductoInventario*/

CREATE OR ALTER TRIGGER Tr_ProductoInventario
ON ProductoInventario
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TablaAfectada56 VARCHAR(50) = 'ProductoInventario'
    DECLARE @FechaModificacion56 DATETIME = GETDATE()
    DECLARE @UsuarioModificacion56 VARCHAR(50) = SYSTEM_USER

    -- Insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO ProductoInventariolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada56, CorrelativoInventario, 'INSERT', @FechaModificacion56, @UsuarioModificacion56
        FROM inserted
    END

    -- Update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO ProductoInventariolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada56, CorrelativoInventario, 'UPDATE', @FechaModificacion56, @UsuarioModificacion56
        FROM inserted

        UPDATE ProductoInventario
        SET FechaModificacion = @FechaModificacion56,
            UsuarioModificacion = @UsuarioModificacion56
        WHERE CorrelativoInventario IN (SELECT CorrelativoInventario FROM inserted)
    END

    -- Delete
    IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO ProductoInventariolog (TablaAfectada, FilaAfectada, TipoModificacion, FechaModificacion, UsuarioModificacion)
        SELECT @TablaAfectada56, CorrelativoInventario, 'DELETE', @FechaModificacion56, @UsuarioModificacion56
        FROM deleted
    END
END






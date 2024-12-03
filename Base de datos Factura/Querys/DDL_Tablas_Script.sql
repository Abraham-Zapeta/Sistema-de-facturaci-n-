create database Facturacion 
use Facturacion  

--DDL Data Definition Languaje

/*Tablas para el Sistema de Facturacion*/

--Tabla Cliente

create table Cliente (
   Nit varchar (50) primary key not null,
   PrimerNombre varchar (50) not null,
   SegundoNombre varchar (50) null,
   TercerNombre varchar (50) null,
   PrimerApellido varchar (50) not null,
   SegundoApellido varchar (50) null,
   ApellidoCasada varchar (50) null,
   FechaNacimiento date not null,
   Edad varchar (40) not null,
   Direccion varchar (50) null,
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null,
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)

--Tabla Clientelog

create table Clientelog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)



--Tabla Empresa

create table Empresa (
   NitEmpresa varchar (50) primary key not null,
   NombreLegal varchar (50) not null,
   NombreComercial varchar (50) not null,
   Telefono varchar (50) not null,
   Direccion varchar (50) null,
   CorreoElectronico varchar (50) not null,
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null,
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)


--Tabla Empresalog

create table Empresalog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


--Tabla Empleado

create table Empleado (
   CodigoEmpleado varchar (50) primary key not null,
   PrimerNombre varchar (50) not null,
   SegundoNombre varchar (50) null,
   TercerNombre varchar (50) null,
   PrimerApellido varchar (50) not null,
   SegundoApellido varchar (50) null,
   ApellidoCasada varchar (50) null,
   FechaNacimiento Date,
   Edad varchar (50),
   CorreoElectronico varchar (50) not null,
   Telefono varchar (50) null,
   FechaAlta date default GETDATE() not null,
   FechaBaja date null,
   Genero char(1) check (Genero = 'M' or Genero = 'F' or Genero = 'O') null,
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null,
   UsuarioModificacion varchar (50)  null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)


--Tabla Empleadolog

create table Empleadolog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


--Tabla Proveedor 

create table Proveedor (
   CorrelativoProveedor varchar (50) primary key not null,
   NombreProveedor varchar (50) not null,
   Dirección varchar (50) not null,
   Telefono varchar (50) not null,
   CorreoElectronico varchar (50) not null,
   Pais varchar (50) not null,
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null, 
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)


--Tabla Proveedorlog

create table Proveedorlog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


--Tabla Inventario 

create table Inventario (
   CorrelativoInventario varchar (50) primary key not null,
   CorrelativoProveedor varchar (50),
   NombreProducto varchar (50) not null,
   FechaIngreso datetime not null,
   Lote varchar (50) not null,
   FechaCaducidad date not null,
   CantidadProducto int not null,
   Categoria varchar (50) not null,
   Ubicación varchar (50) not null,
   Marca varchar (50) not null,
   PrecioUnitarioVenta decimal (10,2) check (PrecioUnitarioVenta > 0) not null,
   Fechacreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime  null, 
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null,  
   --Llave Foranea
   constraint FK_CorrelativoProveedor foreign key (CorrelativoProveedor) references Proveedor (CorrelativoProveedor)
)

--Tabla Inventariolog

create table Inventariolog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


--Tabla Producto 

create table Producto (
   CodigoProducto varchar (50) primary key not null,
   Nombreproducto varchar (200) not null,
   Marca varchar (200) not null,
   Tamanio varchar (200) not null,
   Descripción varchar (200) not null,
   PrecioVenta decimal (10,2),
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null, 
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)


--Tabla Productolog

create table Productolog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)



--Tabla Factura Encabezado

create table FacturaEncabezado (
   Fel varchar (50) primary key not null,
   Fecha date default CURRENT_TIMESTAMP not null,
   Total decimal (10,2) default 0.1 not null,
   --Llave Foranea 
   Nit varchar (50) not null,                                                             
   NitEmpresa varchar (50) not null,                                                 
   CodigoEmpleado varchar (50) null,   
   constraint FK_Nit foreign key (Nit) references Cliente (Nit),
   constraint FK_NitEmpresa foreign key (NitEmpresa) references Empresa (NitEmpresa),
   constraint FK_CodigoEmpleado foreign key (CodigoEmpleado) references Empleado (CodigoEmpleado),
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null, 
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)



--Tabla FacturaEncabezadolog

create table FacturaEncabezadolog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


--Tabla FacturaDetalle

create table FacturaDetalle (
   Correlativo varchar (50) primary key not null,
   NombreProducto varchar (50) not null,
   PrecioUnitario decimal (10,2) check (PrecioUnitario > 0) not null,
   Cantidad int check (Cantidad > 0) not null,
   Subtotal decimal (10,2) check (Subtotal > 0) not null,
   --Llaves foranea  
   Fel varchar (50) not null,                                                                
   CodigoProducto varchar (50) not null,    
   constraint FK_Fel foreign key (Fel) references FacturaEncabezado (Fel),
   constraint FK_CodigoProducto foreign key (CodigoProducto) references Producto(CodigoProducto),
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null, 
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)



--Tabla FacturaDetallelog

create table FacturaDetallelog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


--Tabla del rompimiento de Producto con Inventario

create table ProductoInventario (
   --Llaves Foraneas 
   CorrelativoInventario varchar (50) not null,
   CodigoProducto varchar (50) not null,
   primary key (CorrelativoInventario, CodigoProducto),
   constraint FK_Correlativo_Inventario foreign key (CorrelativoInventario) references Inventario(CorrelativoInventario),
   constraint FK_Codigo_Producto foreign key (CodigoProducto) references Producto(CodigoProducto),
   FechaCreacion date default GETDATE() not null,
   UsuarioCreacion varchar (50) default SUSER_SNAME() not null,
   FechaModificacion datetime null, 
   UsuarioModificacion varchar (50) null,
   Estado char(1) default 'A' check (Estado = 'A' or Estado = 'I') not null
)

--Tabla ProductoInventariolog

create table ProductoInventariolog (
   TablaAfectada varchar(50) not null,
   FilaAfectada  varchar (50) not null,
   TipoModificacion varchar(50) not null,
   FechaModificacion datetime not null,
   UsuarioModificacion varchar (50) not null
)


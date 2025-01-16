-- Base de Datos Consecionario

create type Estado_Vehiculo as enum ('Usado',
'Nuevo', 'Vendido');

create type Tipo_Cliente as enum ('Actual',
'Potencial');

create type Rol_Empleado as enum ('Mecanico',
'Administrativo');

create type Tipo_Servicio as enum ('Mantenimiento',
'Reparacion');

create table Departamento (
	id SERIAL primary key,
	nombre Varchar(100)  
);

create table Empleado (
	id SERIAL primary key,
	nombreCompleto VARCHAR(100),
	fechaDeContratacion DATE,
	fechaDeNacimiento DATE,
	identificacion VARCHAR(10),
	rol Rol_Empleado,
	idDepartamento INT,
	foreign key (idDepartamento) references Departamento(id)
);

create table Vehiculo (
	id SERIAL primary key,
	marca Varchar(20),
	modelo Varchar(20),
	anio INT,
	precio INT,
	estado Estado_Vehiculo   
);

create table Cliente (
	id SERIAL primary key,
	nombreCompleto Varchar(100) ,
	fechaDeNacimiento DATE ,
	identificacion VARCHAR(10) unique,
	email VARCHAR(100) unique,
	tipo Tipo_Cliente  
);

create table InteresVehiculo(
	id SERIAL primary key,
	idCliente INT ,
	idVehiculo INT ,
	foreign key (idCliente) references Cliente(id),
	foreign key (idVehiculo) references Vehiculo(id)
);

create table Venta(
	id SERIAL primary key,
	fechaDeVenta DATE default (CURRENT_DATE),
	idCliente INT ,
	idVehiculo INT ,
	idEmpleado INT ,
	foreign key (idCliente) references Cliente(id),
	foreign key (idEmpleado) references Empleado(id),
	foreign key (idVehiculo) references Vehiculo(id)
);

create table Servicio(
	id SERIAL primary key,
	tipo Tipo_Servicio,
	fechaDeServicio TIMESTAMP,
	idVehiculo INT ,
	foreign key (idVehiculo) references Vehiculo(id)
);

create table EmpleadoXServicio(
	id SERIAL primary key,
	idServicio INT ,
	idEmpleado INT ,
	foreign key (idServicio) references Servicio(id),
	foreign key (idEmpleado) references Empleado(id)
);

create table Proveedor(
	id SERIAL primary key,
	nombre VARCHAR(100)
);

create table Pieza(
	id SERIAL primary key,
	nombre VARCHAR(100),
	stock INTEGER check (stock >= 0),
	idProveedor INT,
	foreign key (idProveedor) references Proveedor(id)
);

create table PiezaXServicio(
	id SERIAL primary key,
	CantidadUtilizada INT,
	idServicio INT,
	idPieza INT,
	foreign key (idServicio) references Servicio(id),
	foreign key (idPieza) references Pieza(id)
);

create table HistorialPiezas(
	id SERIAL primary key,
	cantidad INT,
	precio INT,
	idPieza INT,
	foreign key (idPieza) references Pieza(id)
);

ALTER TABLE public.empleado ADD horariodeinicio time;

ALTER TABLE public.empleado ADD horariodefin time;

ALTER TABLE public.historialpiezas ADD fechadecompra date;
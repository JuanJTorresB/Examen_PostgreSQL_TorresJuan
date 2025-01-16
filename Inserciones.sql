insert into departamento  (nombre) values
('Ventas'),
('Servicios');

insert into empleado  (nombrecompleto,fechadecontratacion,fechadenacimiento,identificacion,rol,iddepartamento,horariodeinicio,horariodefin) values
('Juan Alcachofa Gutierrez', '2024-09-07', '2000-09-07', '1234567890', 'Mecanico', 2,'06:00:00', '02:00:00'),
('Daniela Andrea Lizaraso Lamus', '2024-09-08', '2000-09-08', '1234567891','Administrativo', 1, '06:00:00', '02:00:00'),
('Lida Andrea Vaca Marquez', '2024-09-09', '2000-09-09', '1234567892', 'Administrativo', 1, '06:00:00', '02:00:00'),
('Juan Carlos Torres Becerra', '2024-09-10', '2000-09-10', '1234567893', 'Mecanico', 2, '06:00:00', '02:00:00');

insert into Vehiculo (marca,modelo,anio,precio,estado) values
('Chevrolet', 'Frontrunner', 2016, 200000000, 'Nuevo'),
('Chevrolet', 'Bagger', 2020, 100000000, 'Vendido'),
('Chevrolet', 'Bagger', 2010, 50000000, 'Usado'),
('Chevrolet', 'Frontrunner', 2020, 85000000, 'Vendido');

insert into Cliente (nombrecompleto,fechadenacimiento,identificacion,email,tipo) values
('Nicolas Martinez', '2024-09-07', '1234567894','nico@gmail.com', 'Actual'),
('Mariana Sepulveda', '2024-09-08', '1234567895','mari@gmail.com', 'Actual'),
('Sofia Melgarejo', '2024-09-09', '1234567896','sofi@gmail.com', 'Potencial'),
('Sara Arciniegas', '2024-09-10', '1234567897','sara@gmail.com', 'Actual');

insert into InteresVehiculo(idcliente,idvehiculo) values
(3,1);

insert into Venta(idcliente,idvehiculo,idempleado) values
(1,2,2),
(1,4,3);

insert into Servicio(tipo,fechadeservicio,idvehiculo) values
('Mantenimiento', '2025-01-14 08:00:00', 3);

insert into EmpleadoXServicio(idservicio,idempleado) values
(1,1),
(1,4);

insert into Proveedor(nombre) values
('Exito'),
('Michelin');

insert into Pieza(nombre,stock,idproveedor) values
('Llantas Michelin', 16, 2),
('Cera Exito', 15, 1);

insert into PiezaXServicio(cantidadutilizada,idservicio,idpieza) values
(1, 1, 1);

insert into HistorialPiezas(cantidad,precio,idpieza,fechadecompra) values
(16, 16000000, 1, '2025-01-14 08:00:00'),
(16, 512000, 2, '2024-12-14 08:00:00');

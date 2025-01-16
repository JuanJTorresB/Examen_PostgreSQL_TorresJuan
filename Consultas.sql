-- Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, incluyendo detalles como marca, modelo, y precio.

select marca,modelo,anio as "Año",precio,estado from vehiculo v where V.estado <> 'Vendido';

-- Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, junto con la información de los vehículos adquiridos.

select nombrecompleto,fechadeventa,marca,modelo,anio as "Año",precio,estado from cliente c join venta v on c.id = v.idcliente join vehiculo v2 on v.idvehiculo = v2.id where v.fechadeventa >= current_date - interval '1 month';

-- Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.

select s.id as "Id Servicio", tipo,fechadeservicio,marca,modelo,anio as "Año",estado,nombrecompleto as "Empleado",fechadecontratacion,fechadenacimiento,identificacion,rol from servicio s join vehiculo v on s.idvehiculo = v.id join empleadoxservicio e on e.idservicio = s.id join empleado e2 on e.idempleado = e2.id;

-- Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados en los servicios de mantenimiento.

select p.nombre as "Nombre Pieza",stock,p2.nombre as "Proveedor Nombre",cantidadutilizada from pieza p join proveedor p2 on p.idproveedor = p2.id join piezaxservicio p3 on p.id = p3.idpieza;

-- Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas en un período específico.

select e.nombrecompleto as "Emplead@", sum(v2.precio)*0.05 as "Comision"  from empleado e join venta v on e.id = v.idempleado join vehiculo v2 on V.idvehiculo = v2.id where v.fechadeventa >= current_date - interval '1 month' and v.fechadeventa <= current_date group by e.id;

-- Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico, incluyendo detalles sobre los vehículos atendidos.

-- //Servicios de el empleado con id 1:

select * from empleado e join empleadoxservicio e2 on e.id = e2.idempleado join servicio s on e2.idservicio = s.id join vehiculo v on s.idvehiculo = v.id where e.id = 1;

-- Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, proporcionando pistas valiosas para estrategias de marketing.

select * from cliente c join interesvehiculo i ON C.id = i.idcliente join vehiculo v on i.idvehiculo = v.id where c.tipo = 'Potencial';

-- Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen al departamento de servicio, junto con sus horarios de trabajo.

select e.nombrecompleto as "Nombre Completo", e.horariodeinicio as "Inicio De Jornada", e.horariodefin as "Fin De Jornada", d.nombre as "Departamento" from empleado e join departamento d on e.iddepartamento = d.id where d.nombre = 'Servicios';

-- Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango de precios específico, proporcionando datos útiles para análisis de ventas.

select * from vehiculo v where precio between 80000000 and 150000000 and v.estado = 'Vendido';

-- Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra en el concesionario, destacando la lealtad del cliente.

select c.nombrecompleto as "Cliente", count(*) as "Numero_De_Compras" from cliente c join venta v on v.idcliente = c.id group by c.id having count(*) > 1;


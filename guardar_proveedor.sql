
---
--- procedimiento para almacenar datos en la tabla proveedores
...
---
delimiter //
create procedure guardar_datos_proveedor (in codigo varchar(20),in entidad varchar(20))
begin
insert into tbl_proveedores
 values (codigo,lower(entidad));
end
//

delimiter ;
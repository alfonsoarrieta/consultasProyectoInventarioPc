
---
--- procedimiento para almacenar datos en la tabla funcionarios...
---
delimiter //
create procedure guardar_datos_funcionarios (in cedula varchar(20),in p_nombre varchar(20), in s_nombre varchar(15), 
 in p_apellido varchar(15),  in s_apellido varchar(15),  in cargo_func varchar(15),  in email varchar(45),  in celular varchar(12),  in telefono varchar(10) )
begin
insert into tbl_funcionarios
 values (cedula,lower(p_nombre),lower(s_nombre), lower(p_apellido), lower(s_apellido), lower(cargo_func), lower(email), celular, telefono);
end
//

delimiter ;
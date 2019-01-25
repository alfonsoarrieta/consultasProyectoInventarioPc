
---
--- procedimiento para almacenar datos en la tabla procesadores....
---
delimiter //
create procedure guardar_datos_procesador (in marca varchar(20),in velocidad varchar(20), in modelo varchar(20) )
begin
insert into tbl_procesadores values ("",lower(marca),lower(velocidad),lower(modelo));
end
//

delimiter ;
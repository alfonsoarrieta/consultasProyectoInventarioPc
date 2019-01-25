
---
--- procedimiento para almacenar datos en la tabla mother board...
---
delimiter //
create procedure guardar_datos_motherboard (in marca varchar(20),in descripcion varchar(20), in tecnologia varchar(15) )
begin
insert into tbl_motherboard values ("",lower(marca),lower(descripcion), lower(tecnologia));
end
//

delimiter ;
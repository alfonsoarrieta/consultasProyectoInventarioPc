
---
--- procedimiento para almacenar datos en la tabla discos Duros...
---
delimiter //
create procedure guardar_datos_discoduro (in marca varchar(20),in capacidad varchar(20), in tecnologia varchar(20) )
begin
insert into tbl_discosduros values ("",lower(marca),upper(capacidad),upper(tecnologia));
end
//

delimiter ;
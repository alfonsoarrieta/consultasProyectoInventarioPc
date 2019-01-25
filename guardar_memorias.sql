
---
--- procedimiento para almacenar datos en la tabla memoria Ram...
---
delimiter //
create procedure guardar_datos_memorias (in marca varchar(20),in tecnologia varchar(20), in capacidad varchar(20) )
begin
insert into tbl_memorias values ("",lower(marca),upper(tecnologia),upper(capacidad));
end
//

delimiter ;
---
--- procedimiento para almacenar datos en la tabla monitores...
---
delimiter //
create procedure guardar_datos_monitor (in marca varchar(20),in tecnologia varchar(20), in tamanio varchar(20) )
begin
insert into tbl_monitores values ("",lower(marca),lower(tecnologia),lower(tamanio));
end
//

delimiter ;
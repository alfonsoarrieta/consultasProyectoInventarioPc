
---
--- procedimiento para almacenar datos en la tabla mouse...
---
delimiter //
create procedure guardar_datos_mouse (in marca varchar(20),in tipo varchar(20), in tecnologia varchar(20) )
begin
insert into tbl_mouses values ("",lower(marca),upper(tipo),upper(tecnologia));
end
//

delimiter ;

---
--- procedimiento para almacenar datos en la tabla teclados...
---
delimiter //
create procedure guardar_datos_teclado (in marca varchar(20),in tecnologia varchar(20) )
begin
insert into tbl_teclados values ("",lower(marca),upper(tecnologia));
end
//

delimiter ;
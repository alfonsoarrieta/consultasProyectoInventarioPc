
---
--- procedimiento para almacenar datos en la tabla funcionarios...
---
delimiter //
create procedure guardar_datos_impresora (in marca varchar(20),in tecnologia varchar(20), in serie varchar(15), 
 in modelo varchar(15))
begin
insert into tbl_impresoras
 values ("",lower(marca),lower(tecnologia), lower(serie), lower(modelo));
end
//

delimiter ;
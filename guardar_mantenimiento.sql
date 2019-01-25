insert into tbl_mantenimiento values (cod_mantenimiento, cod_equipo, observacion, CURRENT_DATE())

delimiter //
create procedure guardar_mantenimiento(in cod_mantenimiento varchar(20),in observacion VARCHAR(250),in fecha date,in cod_equipo varchar(20))
begin
 insert into tbl_mantenimiento values (cod_mantenimiento,fecha,observacion,cod_equipo);
 
 end
//

delimiter ;
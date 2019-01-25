---
--- procedimiento para consultar reparaciones hechas a los equipos...
---
delimiter //
create procedure consultar_reparaciones (in codigo varchar(20))
begin
select fecha, serial_dispositivo,nombre_dispositivo
  from tbl_reparaciones where cod_equipo=codigo;
 
end
//

delimiter ;
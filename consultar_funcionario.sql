---
--- procedimiento para consulatar datos de funcionarios...
---
delimiter //
create procedure consultar_funcionarios (in ced varchar(20))
begin
select primer_nombre, segundo_nombre,primer_apellido,segundo_apellido, cargo,
		email, celular, telefono from tbl_funcionarios where cedula=ced;
 
end
//

delimiter ;
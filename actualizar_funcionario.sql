---
--- procedimiento para actualizar datos de funcionarios...
---
delimiter //
create procedure actualizar_funcionarios (in ced varchar(20),in p_nombre varchar(20),in s_nombre varchar(20), in p_apellido varchar(15), 
 in s_apellido varchar(25),  in cargo varchar(15), in email varchar(65), in celular varchar(40), in telefono varchar(10) )
begin
update tbl_usuarios
 set primer_nombre=p_nombre, segundo_nombre=s_nombre, primer_apellido=p_apellido, segundo_apellido=s_apellido,
		cargo=cargo, email=email, celular=celular, telefono=telefono where cedula=ced;
 
end
//

delimiter ;



---
--- procedimiento para almacenar datos en la tabla usuarios...
---
delimiter //
create procedure guardar_datos_usuarios (in cedula varchar(20),in nombre varchar(20), in apellido varchar(15), 
 in nombre_usuario varchar(25),  in contrasenia varchar(15),  in tipo_usuario varchar(40),  in email varchar(45),  in telefono varchar(10) )
begin
insert into tbl_usuarios
 values (cedula,lower(nombre),lower(apellido), lower(email), lower(telefono), lower(nombre_usuario), contrasenia,lower(tipo_usuario));
end
//

delimiter ;

alfonso_25
delimiter //
create procedure buscar_funcionarios (in ced varchar(20))
begin
select primer_nombre, primer_apellido, email,telefono from tbl_funcionarios where cedula=ced;
 
end
//

delimiter ;
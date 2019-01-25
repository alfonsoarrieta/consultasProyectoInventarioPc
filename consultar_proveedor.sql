---
--- procedimiento para consulatar datos de funcionarios...
---
delimiter //
create procedure consultar_proveedor (in codigo varchar(20))
begin
select entidad  from tbl_proveedores where codigo_proveedor=codigo;
 
end
//

delimiter ;
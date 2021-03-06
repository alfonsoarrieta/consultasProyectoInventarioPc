delimiter //
create procedure informe_equipo(in codigo int)
begin
select  f.cedula, f.primer_nombre, f.primer_apellido,f.cargo,em.marca_equipo, em.modelo_equipo, ef.fecha_entrega,em.fecha_garantia, mon.marca, mon.modelo, mon.tamano, em.serial_monitor, tec.marca, tec.tipo, em.serial_teclado, mo.marca, mo.tipo, mo.tecnologia, em.serial_mouse,mem.marca, mem.tecnologia, mem.capacidad, em.serial_memoriasram, dd.marca, dd.capacidad, dd.tecnologia, em.serial_discoduro, proc.marca, proc.tecnologia, proc.velocidad, em.serial_procesador, mb.marca, mb.descripcion, mb.tecnologia,em.serial_motherboard from tbl_funcionarios f, tbl_equipos_funcionarios ef, tbl_monitores mon,tbl_teclados tec, tbl_equipos_de_mesa em , tbl_mouses mo, tbl_memorias mem, tbl_discosduros dd, tbl_procesadores proc, tbl_motherboard mb	where ef.tbl_funcionarios_ceedula=f.cedula and ef.tbl_equipos_de_mesa_codigo_equipo=em.codigo_equipo and em.tbl_teclados_codigo_teclado=tec.codigo_teclado and em.tbl_monitores_codigo_monitor=mon.codigo_monitor and em.tbl_mouses_codigo_mouse=mo.codigo_mouse and mem.codigo_memoria=em.tbl_memorias_codigo_memoria and em.codigo_equipo and em.tbl_discosduros_codigo_discoduro=dd.codigo_discoduro and em.tbl_procesadores_codigo_procesador=proc.codigo_procesador and em.tbl_motherboard_codigo_motherboard=mb.codigo_motherboard and em.codigo_equipo=codigo;
end
//
delimiter ;

--
--Consulta  para caracterisitcas del equipo
--
------------------------------------------------------------------------------------------------	
select mon.marca, mon.modelo, mon.tamano, em.serial_monitor, tec.marca, tec.tipo, em.serial_teclado, mo.marca, mo.tipo, mo.tecnologia, em.serial_mouse,
  mem.marca, mem.tecnologia, mem.capacidad, em.serial_memoriasram, dd.marca, dd.capacidad, dd.tecnologia, em.serial_discoduro, proc.marca, proc.tecnologia, proc.velocidad, em.serial_procesador, mb.marca, mb.descripcion, mb.tecnologia,em.serial_motherboard 

		from tbl_monitores mon,tbl_teclados tec, tbl_equipos_de_mesa em , tbl_mouses mo, tbl_memorias mem, tbl_discosduros dd, tbl_procesadores proc, tbl_motherboard mb
		

				where em.tbl_teclados_codigo_teclado=tec.codigo_teclado and em.tbl_monitores_codigo_monitor=mon.codigo_monitor 
						and em.tbl_mouses_codigo_mouse=mo.codigo_mouse and mem.codigo_memoria=em.tbl_memorias_codigo_memoria and em.codigo_equipo and em.tbl_discosduros_codigo_discoduro=dd.codigo_discoduro and em.tbl_procesadores_codigo_procesador=proc.codigo_procesador and em.tbl_motherboard_codigo_motherboard=mb.codigo_motherboard and em.codigo_equipo=102030
		

		
	

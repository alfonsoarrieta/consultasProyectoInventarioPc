delimiter //
create procedure actualizar_equipo(in cod_equipo varchar(20),in ser_mb varchar(20),in ser_proc varchar(20), in ser_mtor varchar(15), 
 in ser_tec varchar(25),  in ser_mse varchar(15), in ser_dd varchar(65), in serial_memoriasram varchar(40))
begin
update tbl_equipos_de_mesa
 set serial_motherboard=ser_mb, serial_procesador=ser_proc, serial_monitor=ser_mtor, serial_teclado=ser_tec,serial_mouse=ser_mse, serial_discoduro=ser_dd, serial_memoriasram=serial_memoriasram 
	where codigo_equipo=cod_equipo;
 end
//

delimiter ;

serial monitor MJKNL
SERIAL TECLADO KLOJ90
SERIAL MOUSE NJHKL
SERIAL MEMORIA MJKIO
SERIAL DISCO MKJOP
SERIAL PROCESADOR HJNKUI
SERIAL BOARD MKJLO12HG

update tbl_equipos_de_mesa set serial_motherboard='MKJLO12HG',serial_procesador='HJNKUI',serial_monitor='MJKNL',serial_teclado='KLOJ90',serial_mouse='NJHKL',serial_discoduro='MKJOP',serial_memoriasram='MJKIO' where codigo_equipo=102030;
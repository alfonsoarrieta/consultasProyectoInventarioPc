-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2015 a las 00:20:04
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `proyecto2015_bda`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_equipo`(in cod_equipo varchar(20),in ser_mb varchar(20),in ser_proc varchar(20), in ser_mtor varchar(15), 
 in ser_tec varchar(25),  in ser_mse varchar(15), in ser_dd varchar(65), in serial_memoriasram varchar(40))
begin
update tbl_equipos_de_mesa
 set serial_motherboard=ser_mb, serial_procesador=ser_proc, serial_monitor=ser_mtor, serial_teclado=ser_tec,serial_mouse=ser_mse, serial_discoduro=ser_dd, serial_memoriasram=serial_memoriasram 
	where codigo_equipo=cod_equipo;
 end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_funcionarios`(in ced varchar(20),in p_nombre varchar(20),in s_nombre varchar(20), in p_apellido varchar(15), 
 in s_apellido varchar(25),  in cargo varchar(15), in email varchar(65), in celular varchar(40), in telefono varchar(10) )
begin
update tbl_usuarios
 set primer_nombre=p_nombre, segundo_nombre=s_nombre, primer_apellido=p_apellido, segundo_apellido=s_apellido,
		cargo=cargo, email=email, celular=celular, telefono=telefono where cedula=ced;
 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_funcionarios`(in ced varchar(20))
begin
select primer_nombre, primer_apellido, email,telefono from tbl_funcionarios where cedula=ced;
 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_funcionarios`(in ced varchar(20))
begin
select primer_nombre, segundo_nombre,primer_apellido,segundo_apellido, cargo,
		email, celular, telefono from tbl_funcionarios where cedula=ced;
 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_proveedor`(in codigo varchar(20))
begin
select entidad  from tbl_proveedores where codigo_proveedor=codigo;
 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_reparaciones`(in codigo varchar(20))
begin
select fecha, serial_dispositivo,nombre_dispositivo
  from tbl_reparaciones where cod_equipo=codigo;
 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_discoduro`(in marca varchar(20),in capacidad varchar(20), in tecnologia varchar(20) )
begin
insert into tbl_discosduros values ("",lower(marca),upper(capacidad),upper(tecnologia));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_funcionarios`(in cedula varchar(20),in p_nombre varchar(20), in s_nombre varchar(15), 
 in p_apellido varchar(15),  in s_apellido varchar(15),  in cargo_func varchar(15),  in email varchar(45),  in celular varchar(12),  in telefono varchar(10) )
begin
insert into tbl_funcionarios
 values (cedula,lower(p_nombre),lower(s_nombre), lower(p_apellido), lower(s_apellido), lower(cargo_func), lower(email), celular, telefono);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_impresora`(in marca varchar(20),in tecnologia varchar(20), in serie varchar(15), 
 in modelo varchar(15))
begin
insert into tbl_impresoras
 values ("",lower(marca),lower(tecnologia), lower(serie), lower(modelo));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_memorias`(in marca varchar(20),in tecnologia varchar(20), in capacidad varchar(20) )
begin
insert into tbl_memorias values ("",lower(marca),upper(tecnologia),upper(capacidad));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_monitor`(in marca varchar(20),in tecnologia varchar(20), in tamanio varchar(20) )
begin
insert into tbl_monitores values ("",lower(marca),lower(tecnologia),lower(tamanio));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_motherboard`(in marca varchar(20),in descripcion varchar(20), in tecnologia varchar(15) )
begin
insert into tbl_motherboard values ("",lower(marca),lower(descripcion), lower(tecnologia));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_mouse`(in marca varchar(20),in tipo varchar(20), in tecnologia varchar(20) )
begin
insert into tbl_mouses values ("",lower(marca),upper(tipo),upper(tecnologia));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_procesador`(in marca varchar(20),in velocidad varchar(20), in modelo varchar(20) )
begin
insert into tbl_procesadores values ("",lower(marca),lower(velocidad),lower(modelo));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_proveedor`(in codigo varchar(20),in entidad varchar(20))
begin
insert into tbl_proveedores
 values (codigo,lower(entidad));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_teclado`(in marca varchar(20),in tecnologia varchar(20) )
begin
insert into tbl_teclados values ("",lower(marca),upper(tecnologia));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_datos_usuarios`(in cedula varchar(20),in nombre varchar(20), in apellido varchar(15), 
 in nombre_usuario varchar(25),  in contrasenia varchar(15),  in tipo_usuario varchar(40),  in email varchar(45),  in telefono varchar(10) )
begin
insert into tbl_usuarios
 values (cedula,lower(nombre),lower(apellido), lower(email), lower(telefono), lower(nombre_usuario), contrasenia,lower(tipo_usuario));
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `guardar_mantenimiento`(in cod_mantenimiento varchar(20),in observacion varchar(250),in fecha date,in cod_equipo varchar(20))
begin
 insert into tbl_mantenimiento values (cod_mantenimiento,fecha,observacion,cod_equipo);
 
 end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `informe_equipo`(in codigo int)
begin
select  f.cedula, f.primer_nombre, f.primer_apellido,f.cargo,em.marca_equipo, em.modelo_equipo, ef.fecha_entrega,em.fecha_garantia, mon.marca, mon.modelo, mon.tamano, em.serial_monitor, tec.marca, tec.tipo, em.serial_teclado, mo.marca, mo.tipo, mo.tecnologia, em.serial_mouse,mem.marca, mem.tecnologia, mem.capacidad, em.serial_memoriasram, dd.marca, dd.capacidad, dd.tecnologia, em.serial_discoduro, proc.marca, proc.tecnologia, proc.velocidad, em.serial_procesador, mb.marca, mb.descripcion, mb.tecnologia,em.serial_motherboard from tbl_funcionarios f, tbl_equipos_funcionarios ef, tbl_monitores mon,tbl_teclados tec, tbl_equipos_de_mesa em , tbl_mouses mo, tbl_memorias mem, tbl_discosduros dd, tbl_procesadores proc, tbl_motherboard mb	where ef.tbl_funcionarios_ceedula=f.cedula and ef.tbl_equipos_de_mesa_codigo_equipo=em.codigo_equipo and em.tbl_teclados_codigo_teclado=tec.codigo_teclado and em.tbl_monitores_codigo_monitor=mon.codigo_monitor and em.tbl_mouses_codigo_mouse=mo.codigo_mouse and mem.codigo_memoria=em.tbl_memorias_codigo_memoria and em.codigo_equipo and em.tbl_discosduros_codigo_discoduro=dd.codigo_discoduro and em.tbl_procesadores_codigo_procesador=proc.codigo_procesador and em.tbl_motherboard_codigo_motherboard=mb.codigo_motherboard and em.codigo_equipo=codigo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `informe_mantenimiento`(in codigo_mnto int)
begin
select  f.cedula, f.primer_nombre, f.primer_apellido,f.cargo,mnto.observacion_dispositivo, mnto.fecha_mantenimiento, mon.marca, mon.modelo, mon.tamano, em.serial_monitor, tec.marca, tec.tipo, em.serial_teclado, mo.marca, mo.tipo, mo.tecnologia, em.serial_mouse,mem.marca, mem.tecnologia, mem.capacidad, em.serial_memoriasram, dd.marca, dd.capacidad, dd.tecnologia, em.serial_discoduro, proc.marca, proc.tecnologia, proc.velocidad, em.serial_procesador, mb.marca, mb.descripcion, mb.tecnologia,em.serial_motherboard from tbl_funcionarios f, tbl_equipos_funcionarios ef, tbl_monitores mon,tbl_teclados tec, tbl_equipos_de_mesa em , tbl_mouses mo, tbl_memorias mem, tbl_discosduros dd, tbl_procesadores proc, tbl_motherboard mb, tbl_mantenimiento mnto	where mnto.tbl_equipos_de_mesa_codigo_equipo=em.codigo_equipo and  ef.tbl_funcionarios_ceedula=f.cedula and ef.tbl_equipos_de_mesa_codigo_equipo=em.codigo_equipo and em.tbl_teclados_codigo_teclado=tec.codigo_teclado and em.tbl_monitores_codigo_monitor=mon.codigo_monitor and em.tbl_mouses_codigo_mouse=mo.codigo_mouse and mem.codigo_memoria=em.tbl_memorias_codigo_memoria and em.codigo_equipo and em.tbl_discosduros_codigo_discoduro=dd.codigo_discoduro and em.tbl_procesadores_codigo_procesador=proc.codigo_procesador and em.tbl_motherboard_codigo_motherboard=mb.codigo_motherboard and mnto.codigo_mantenimiento=codigo_mnto;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_discosduros`
--

CREATE TABLE IF NOT EXISTS `tbl_discosduros` (
`codigo_discoduro` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `tecnologia` char(8) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_discosduros`
--

INSERT INTO `tbl_discosduros` (`codigo_discoduro`, `marca`, `capacidad`, `tecnologia`) VALUES
(1, 'toshiba', '500 GB', 'SATA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_equipos_de_mesa`
--

CREATE TABLE IF NOT EXISTS `tbl_equipos_de_mesa` (
`codigo_equipo` int(11) NOT NULL,
  `fecha_adquirido` date NOT NULL,
  `fecha_garantia` date NOT NULL,
  `modelo_equipo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `marca_equipo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serial_motherboard` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serial_procesador` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serial_monitor` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serial_teclado` varchar(425) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serial_mouse` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serial_discoduro` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `serial_memoriasram` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tbl_motherboard_codigo_motherboard` int(11) NOT NULL,
  `tbl_procesadores_codigo_procesador` int(11) NOT NULL,
  `tbl_discosduros_codigo_discoduro` int(11) NOT NULL,
  `tbl_teclados_codigo_teclado` int(11) NOT NULL,
  `tbl_proveedores_codigo_proveedor` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tbl_memorias_codigo_memoria` int(11) NOT NULL,
  `tbl_mouses_codigo_mouse` int(11) NOT NULL,
  `tbl_monitores_codigo_monitor` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=102031 ;

--
-- Volcado de datos para la tabla `tbl_equipos_de_mesa`
--

INSERT INTO `tbl_equipos_de_mesa` (`codigo_equipo`, `fecha_adquirido`, `fecha_garantia`, `modelo_equipo`, `marca_equipo`, `serial_motherboard`, `serial_procesador`, `serial_monitor`, `serial_teclado`, `serial_mouse`, `serial_discoduro`, `serial_memoriasram`, `tbl_motherboard_codigo_motherboard`, `tbl_procesadores_codigo_procesador`, `tbl_discosduros_codigo_discoduro`, `tbl_teclados_codigo_teclado`, `tbl_proveedores_codigo_proveedor`, `tbl_memorias_codigo_memoria`, `tbl_mouses_codigo_mouse`, `tbl_monitores_codigo_monitor`) VALUES
(102030, '2015-04-02', '2018-04-04', '6001', 'HP', 'MKJLO12HG', 'HJNKUI', 'MJKNL', 'KLOJ921', 'HJUYIP', '2CEHJMIO', 'BHNJKUO', 1, 1, 1, 1, '101001', 1, 1, 1);

--
-- Disparadores `tbl_equipos_de_mesa`
--
DELIMITER //
CREATE TRIGGER `insertar_reparaciones` BEFORE UPDATE ON `tbl_equipos_de_mesa`
 FOR EACH ROW begin
declare cod_dispositivo int;
declare cod_equipo int;
declare serial_dispositivo varchar(50);
if(old.serial_motherboard<>new.serial_motherboard) then
	select tbl_motherboard_codigo_motherboard, serial_motherboard,codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
 insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,tbl_motherboard_codigo_motherboard,serial_motherboard,'Mother Board');
else
	if(old.serial_procesador<>new.serial_procesador) then
	select tbl_procesadores_codigo_procesador, serial_procesador,codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
		insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,cod_dispositivo,serial_dispositivo,'Procesador');
	else
		if(old.serial_monitor<>new.serial_monitor) then
		select tbl_monitores_codigo_monitor, serial_monitor,codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
		insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,cod_dispositivo,serial_dispositivo, 'Monitor');
		else
			if(old.serial_teclado<>new.serial_teclado)then
			select tbl_teclados_codigo_teclado, serial_teclado,codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
			insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,cod_dispositivo,serial_dispositivo,'Teclado');
			else
				if(old.serial_mouse<>new.serial_mouse) then
				select tbl_mouses_codigo_mouse, serial_mouse,codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
				insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,cod_dispositivo,serial_dispositivo,'Mouse');
				else
				if(old.serial_discoduro<>new.serial_discoduro) then
				select tbl_discosduros_codigo_discoduro, serial_discoduro, codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
				insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,cod_dispositivo,serial_dispositivo, 'Disco Duro');
				else
				select tbl_memorias_codigo_memoria, serial_memoriasram,codigo_equipo into cod_dispositivo,serial_dispositivo,cod_equipo from tbl_equipos_de_mesa;
				insert into tbl_reparaciones values(' ',CURDATE(),cod_equipo,cod_dispositivo,serial_dispositivo,'Memorias Ram');
				  end if ;
				end if;
			end if;
		end if;
	end if;
 end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_equipos_funcionarios`
--

CREATE TABLE IF NOT EXISTS `tbl_equipos_funcionarios` (
  `tbl_equipos_de_mesa_codigo_equipo` int(11) NOT NULL,
  `tbl_funcionarios_ceedula` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_entrega` date NOT NULL,
  `estado_entrega` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_retiro` date DEFAULT NULL,
  `estado_retiro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_equipos_funcionarios`
--

INSERT INTO `tbl_equipos_funcionarios` (`tbl_equipos_de_mesa_codigo_equipo`, `tbl_funcionarios_ceedula`, `fecha_entrega`, `estado_entrega`, `observacion`, `fecha_retiro`, `estado_retiro`, `estado`) VALUES
(102030, '1103112140', '2015-04-06', 'Buen Estado', 'el equipo cuenta con todas las caracteristicas', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_funcionarios`
--

CREATE TABLE IF NOT EXISTS `tbl_funcionarios` (
  `cedula` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `primer_nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` char(8) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_funcionarios`
--

INSERT INTO `tbl_funcionarios` (`cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `cargo`, `email`, `celular`, `telefono`) VALUES
('1103112140', 'alfonso', 'luis', 'arrieta', 'hernandez', 'tecnico 2', 'alfonsoluisarrieta25@hotmail.com', '3012968202', '2800990');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_funcionarios_impresoras`
--

CREATE TABLE IF NOT EXISTS `tbl_funcionarios_impresoras` (
  `tbl_impresoras_codigo_impresora` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tbl_funcionarios_cedula` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `estado_entrega` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `obeservacion` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `fecha_retiro` date DEFAULT NULL,
  `estado_retiro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_entrega` date NOT NULL,
  `serial_impresora` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_impresoras`
--

CREATE TABLE IF NOT EXISTS `tbl_impresoras` (
  `codigo_impresora` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `tecnologia` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `serie` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_impresoras`
--

INSERT INTO `tbl_impresoras` (`codigo_impresora`, `marca`, `tecnologia`, `serie`, `modelo`) VALUES
('1', 'hp', 'laser', 'printer', 'deskjet 500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mantenimiento`
--

CREATE TABLE IF NOT EXISTS `tbl_mantenimiento` (
`codigo_mantenimiento` int(11) NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `observacion_dispositivo` text COLLATE utf8_spanish_ci NOT NULL,
  `tbl_equipos_de_mesa_codigo_equipo` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=25089302 ;

--
-- Volcado de datos para la tabla `tbl_mantenimiento`
--

INSERT INTO `tbl_mantenimiento` (`codigo_mantenimiento`, `fecha_mantenimiento`, `observacion_dispositivo`, `tbl_equipos_de_mesa_codigo_equipo`) VALUES
(250893, '2015-05-20', 'se cambia el disco duro de serial MKJOP por el de serial 2CEHJMIO', 102030);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_memorias`
--

CREATE TABLE IF NOT EXISTS `tbl_memorias` (
`codigo_memoria` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tecnologia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_memorias`
--

INSERT INTO `tbl_memorias` (`codigo_memoria`, `marca`, `tecnologia`, `capacidad`) VALUES
(1, 'genius', 'DDR II', '4 GB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_monitores`
--

CREATE TABLE IF NOT EXISTS `tbl_monitores` (
`codigo_monitor` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tamano` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_monitores`
--

INSERT INTO `tbl_monitores` (`codigo_monitor`, `marca`, `modelo`, `tamano`) VALUES
(1, 'hp', '6001', '30 pulgadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_motherboard`
--

CREATE TABLE IF NOT EXISTS `tbl_motherboard` (
`codigo_motherboard` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tecnologia` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_motherboard`
--

INSERT INTO `tbl_motherboard` (`codigo_motherboard`, `marca`, `descripcion`, `tecnologia`) VALUES
(1, 'asrock', 'integrada', 'sata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mouses`
--

CREATE TABLE IF NOT EXISTS `tbl_mouses` (
`codigo_mouse` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tecnologia` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_mouses`
--

INSERT INTO `tbl_mouses` (`codigo_mouse`, `marca`, `tipo`, `tecnologia`) VALUES
(1, 'hp', 'USB', 'OPTICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_procesadores`
--

CREATE TABLE IF NOT EXISTS `tbl_procesadores` (
`codigo_procesador` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tecnologia` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `velocidad` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_procesadores`
--

INSERT INTO `tbl_procesadores` (`codigo_procesador`, `marca`, `tecnologia`, `velocidad`) VALUES
(1, 'intel', 'core i5', '2.4 ghz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedores`
--

CREATE TABLE IF NOT EXISTS `tbl_proveedores` (
  `codigo_proveedor` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `entidad` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_proveedores`
--

INSERT INTO `tbl_proveedores` (`codigo_proveedor`, `entidad`) VALUES
('101001', 'alcaldia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reparaciones`
--

CREATE TABLE IF NOT EXISTS `tbl_reparaciones` (
`codigo_reparaciones` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cod_equipo` int(11) NOT NULL,
  `cod_dispositivo` int(11) NOT NULL,
  `serial_dispositivo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_dispositivo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tbl_reparaciones`
--

INSERT INTO `tbl_reparaciones` (`codigo_reparaciones`, `fecha`, `cod_equipo`, `cod_dispositivo`, `serial_dispositivo`, `nombre_dispositivo`) VALUES
(2, '2015-05-20', 102030, 1, 'MKJOP', 'Disco Duro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_teclados`
--

CREATE TABLE IF NOT EXISTS `tbl_teclados` (
`codigo_teclado` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_teclados`
--

INSERT INTO `tbl_teclados` (`codigo_teclado`, `marca`, `tipo`) VALUES
(1, 'hp', 'USB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_usuario` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`cedula`, `nombre`, `apellidos`, `email`, `telefono`, `nombre_usuario`, `contrasenia`, `tipo_usuario`) VALUES
('1103112140', 'alfonso', 'arrieta', 'alfonsoluisarrieta25@hotmail.com', '2800990', 'alfonso', '661db5fa27d22dee0a92a2eaac25a146', 'ADMINISTRADOR');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_discosduros`
--
ALTER TABLE `tbl_discosduros`
 ADD PRIMARY KEY (`codigo_discoduro`);

--
-- Indices de la tabla `tbl_equipos_de_mesa`
--
ALTER TABLE `tbl_equipos_de_mesa`
 ADD PRIMARY KEY (`codigo_equipo`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_motherboard1_idx` (`tbl_motherboard_codigo_motherboard`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_procesadores1_idx` (`tbl_procesadores_codigo_procesador`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_discosduros1_idx` (`tbl_discosduros_codigo_discoduro`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_teclados1_idx` (`tbl_teclados_codigo_teclado`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_proveedores1_idx` (`tbl_proveedores_codigo_proveedor`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_memorias1_idx` (`tbl_memorias_codigo_memoria`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_mouses1_idx` (`tbl_mouses_codigo_mouse`), ADD KEY `fk_tbl_equipos_de_mesa_tbl_monitores1_idx` (`tbl_monitores_codigo_monitor`);

--
-- Indices de la tabla `tbl_equipos_funcionarios`
--
ALTER TABLE `tbl_equipos_funcionarios`
 ADD PRIMARY KEY (`tbl_equipos_de_mesa_codigo_equipo`,`tbl_funcionarios_ceedula`), ADD KEY `fk_tbl_equipos_funcionarios_tbl_equipos_de_mesa1_idx` (`tbl_equipos_de_mesa_codigo_equipo`), ADD KEY `fk_tbl_equipos_funcionarios_tbl_funcionarios1_idx` (`tbl_funcionarios_ceedula`);

--
-- Indices de la tabla `tbl_funcionarios`
--
ALTER TABLE `tbl_funcionarios`
 ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `tbl_funcionarios_impresoras`
--
ALTER TABLE `tbl_funcionarios_impresoras`
 ADD KEY `fk_tbl_funcionarios_impresoras_tbl_impresoras1_idx` (`tbl_impresoras_codigo_impresora`), ADD KEY `fk_tbl_funcionarios_impresoras_tbl_funcionarios1_idx` (`tbl_funcionarios_cedula`);

--
-- Indices de la tabla `tbl_impresoras`
--
ALTER TABLE `tbl_impresoras`
 ADD PRIMARY KEY (`codigo_impresora`);

--
-- Indices de la tabla `tbl_mantenimiento`
--
ALTER TABLE `tbl_mantenimiento`
 ADD PRIMARY KEY (`codigo_mantenimiento`), ADD KEY `fk_tbl_mantenimiento_tbl_equipos_de_mesa1_idx` (`tbl_equipos_de_mesa_codigo_equipo`);

--
-- Indices de la tabla `tbl_memorias`
--
ALTER TABLE `tbl_memorias`
 ADD PRIMARY KEY (`codigo_memoria`);

--
-- Indices de la tabla `tbl_monitores`
--
ALTER TABLE `tbl_monitores`
 ADD PRIMARY KEY (`codigo_monitor`);

--
-- Indices de la tabla `tbl_motherboard`
--
ALTER TABLE `tbl_motherboard`
 ADD PRIMARY KEY (`codigo_motherboard`);

--
-- Indices de la tabla `tbl_mouses`
--
ALTER TABLE `tbl_mouses`
 ADD PRIMARY KEY (`codigo_mouse`);

--
-- Indices de la tabla `tbl_procesadores`
--
ALTER TABLE `tbl_procesadores`
 ADD PRIMARY KEY (`codigo_procesador`);

--
-- Indices de la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
 ADD PRIMARY KEY (`codigo_proveedor`);

--
-- Indices de la tabla `tbl_reparaciones`
--
ALTER TABLE `tbl_reparaciones`
 ADD PRIMARY KEY (`codigo_reparaciones`), ADD KEY `fk_tbl_reparaciones_tbl_equipos_de_mesa1_idx` (`cod_equipo`);

--
-- Indices de la tabla `tbl_teclados`
--
ALTER TABLE `tbl_teclados`
 ADD PRIMARY KEY (`codigo_teclado`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
 ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_discosduros`
--
ALTER TABLE `tbl_discosduros`
MODIFY `codigo_discoduro` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_equipos_de_mesa`
--
ALTER TABLE `tbl_equipos_de_mesa`
MODIFY `codigo_equipo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102031;
--
-- AUTO_INCREMENT de la tabla `tbl_mantenimiento`
--
ALTER TABLE `tbl_mantenimiento`
MODIFY `codigo_mantenimiento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25089302;
--
-- AUTO_INCREMENT de la tabla `tbl_memorias`
--
ALTER TABLE `tbl_memorias`
MODIFY `codigo_memoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_monitores`
--
ALTER TABLE `tbl_monitores`
MODIFY `codigo_monitor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_motherboard`
--
ALTER TABLE `tbl_motherboard`
MODIFY `codigo_motherboard` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_mouses`
--
ALTER TABLE `tbl_mouses`
MODIFY `codigo_mouse` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_procesadores`
--
ALTER TABLE `tbl_procesadores`
MODIFY `codigo_procesador` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_reparaciones`
--
ALTER TABLE `tbl_reparaciones`
MODIFY `codigo_reparaciones` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_teclados`
--
ALTER TABLE `tbl_teclados`
MODIFY `codigo_teclado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_equipos_de_mesa`
--
ALTER TABLE `tbl_equipos_de_mesa`
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_discosduros1` FOREIGN KEY (`tbl_discosduros_codigo_discoduro`) REFERENCES `tbl_discosduros` (`codigo_discoduro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_memorias1` FOREIGN KEY (`tbl_memorias_codigo_memoria`) REFERENCES `tbl_memorias` (`codigo_memoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_monitores1` FOREIGN KEY (`tbl_monitores_codigo_monitor`) REFERENCES `tbl_monitores` (`codigo_monitor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_motherboard1` FOREIGN KEY (`tbl_motherboard_codigo_motherboard`) REFERENCES `tbl_motherboard` (`codigo_motherboard`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_mouses1` FOREIGN KEY (`tbl_mouses_codigo_mouse`) REFERENCES `tbl_mouses` (`codigo_mouse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_procesadores1` FOREIGN KEY (`tbl_procesadores_codigo_procesador`) REFERENCES `tbl_procesadores` (`codigo_procesador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_proveedores1` FOREIGN KEY (`tbl_proveedores_codigo_proveedor`) REFERENCES `tbl_proveedores` (`codigo_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_de_mesa_tbl_teclados1` FOREIGN KEY (`tbl_teclados_codigo_teclado`) REFERENCES `tbl_teclados` (`codigo_teclado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_equipos_funcionarios`
--
ALTER TABLE `tbl_equipos_funcionarios`
ADD CONSTRAINT `fk_tbl_equipos_funcionarios_tbl_equipos_de_mesa1` FOREIGN KEY (`tbl_equipos_de_mesa_codigo_equipo`) REFERENCES `tbl_equipos_de_mesa` (`codigo_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_equipos_funcionarios_tbl_funcionarios1` FOREIGN KEY (`tbl_funcionarios_ceedula`) REFERENCES `tbl_funcionarios` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_funcionarios_impresoras`
--
ALTER TABLE `tbl_funcionarios_impresoras`
ADD CONSTRAINT `fk_tbl_funcionarios_impresoras_tbl_funcionarios1` FOREIGN KEY (`tbl_funcionarios_cedula`) REFERENCES `tbl_funcionarios` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tbl_funcionarios_impresoras_tbl_impresoras1` FOREIGN KEY (`tbl_impresoras_codigo_impresora`) REFERENCES `tbl_impresoras` (`codigo_impresora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_mantenimiento`
--
ALTER TABLE `tbl_mantenimiento`
ADD CONSTRAINT `fk_tbl_mantenimiento_tbl_equipos_de_mesa1` FOREIGN KEY (`tbl_equipos_de_mesa_codigo_equipo`) REFERENCES `tbl_equipos_de_mesa` (`codigo_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_reparaciones`
--
ALTER TABLE `tbl_reparaciones`
ADD CONSTRAINT `fk_tbl_reparaciones_tbl_equipos_de_mesa1` FOREIGN KEY (`cod_equipo`) REFERENCES `tbl_equipos_de_mesa` (`codigo_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- CTRL + Enter ejecuta una linea de codigo ->RD
#CTRL + Enter ejecuta una linea de codigo ->RD
/*
CTRL + Enter ejecuta 
una inea de codigo ->RD
*/

create database 
libreria_MV;

-- 20260505 C3

use libreria_mv;

drop table estadosautores;
drop database libreria_mv;

show databases;
show tables;
describe autores;

insert into autores
(idAutorNum, autor_id, nombre, apellido, telefono, direccion, ciudad, codpost, idProvincia, idEstado)
values
(1,'172-32-1176','Horacio','Quiroga','','','Salto','1923',1,1);

INSERT INTO provincias 
(descripcion) 
VALUES
('Buenos Aires'),
('Catamarca'),
('Chaco'),
('Chubut'),
('Córdoba'),
('Corrientes'),
('Entre Ríos'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuquén'),
('Río Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santa Fe'),
('Santiago del Estero'),
('Tierra del Fuego'),
('Tucumán');

select * from autores;

select * from provincias;

insert into autores
(idAutorNum, autor_id, apellido, nombre, telefono, direccion, ciudad, codpost, idProvincia, idEstado)
values
(3,'213-46-8915','Bioy Casares','Adolfo','49867020','','Baires','8000',7,'1'),
(6,'238-95-7766','Vargas LLosa','Mario','45487723','','Lima','4705',4,'1');

INSERT INTO autores 
(autor_id, nombre, apellido, telefono, direccion, ciudad, codpost, idProvincia, idEstado)
VALUES
('123-45-6789', 'Jorge Luis', 'Borges', '1112345678', 'Av. Corrientes 1234', 'Buenos Aires', '1000', 1, 1),
('234-56-7890', 'Julio', 'Cortázar', '1123456789', 'Calle 8 567', 'La Plata', '1900', 1, 1),
('345-67-8901', 'Ernesto', 'Sábato', '1134567890', 'San Martín 456', 'Rojas', '2705', 1, 1),
('456-78-9012', 'Adolfo', 'Bioy Casares', '1145678901', 'Belgrano 789', 'Buenos Aires', '1000', 1, 1),
('567-89-0123', 'Ricardo', 'Piglia', '1156789012', 'Mitre 321', 'Adrogué', '1846', 1, 1),
('678-90-1234', 'Manuel', 'Puig', '1167890123', 'Rivadavia 654', 'General Villegas', '6230', 1, 1),
('789-01-2345', 'Roberto', 'Arlt', '1178901234', 'Alsina 987', 'Buenos Aires', '1000', 1, 1),
('890-12-3456', 'Leopoldo', 'Lugones', '1189012345', 'Colon 147', 'Villa de María', '5248', 5, 1),
('901-23-4567', 'Silvina', 'Ocampo', '1190123456', 'Urquiza 258', 'Buenos Aires', '1000', 1, 1),
('012-34-5678', 'Victoria', 'Ocampo', '1101234567', 'Callao 369', 'Buenos Aires', '1000', 1, 1);

INSERT INTO autores 
(autor_id, nombre, apellido,   ciudad, codpost, idProvincia, idEstado)
VALUES
('123-45-6799', 'Jose Luis', 'Marini', 'Buenos Aires', '1000', 1, 1);

describe autores;

select * from autores;

select idautornum,nombre,apellido
from autores;

select idautornum,nombre,apellido, 'Hola' 
from autores;

select idautornum,nombre,apellido, idautornum*1.10
from autores;

select idautornum,nombre,apellido, idautornum*1.10 as ConIva
from autores;

select idautornum,nombre as Name ,apellido as LastName, idautornum*1.10 as ConIva
from autores;

select * from autores
order by idautornum desc
limit 5;

select * from autores
order by ciudad
limit 8;

select * from autores
order by ciudad, apellido 
limit 8;

select * from autores
order by idprovincia desc, apellido;

select * from autores
order by ciudad, apellido 
limit 8
offset 2;

-- -------------------

alter table provincias ADD column pais varchar(100) null;

describe provincias;

# 20260508 - C4

alter table provincias ADD column primera varchar(100) null first;

alter table provincias ADD column medio varchar(100) null after idprovincia;

alter table provincias change descripcion nombre varchar(70);

alter table provincias modify nombre text null;

alter table provincias drop column medio, drop column pais, drop column primera;

alter table prov rename provincias;

alter table provincias drop primary key;

alter table provincias add primary key(idProvincia);

alter table autores drop foreign key autores_fk8;

alter table autores add constraint estadosAutores_fk
foreign key(idestado) references estadosautores(idestado);

select * from autores;

insert into estadosautores(descripcion)
values('Activo');

-- Importar desde CSV

select * from top_spotify;

-- Importar desde Script

select * from libros;

select * from editoriales;

select * from ventas;

select * from empleados;

select * from autores;

select * from libros
where categoria = 'novelas';

select * from libros
where categoria = 'novelas'
order by precio;

select * from libros
where categoria = 'novelas'
order by precio desc
limit 10;

select * from libros
where categoria = 'novelas'
order by precio desc
limit 10
offset 2;

/*
operadores de comparacion
= - Igual a
!= - <> - Distinto
> Mayor
< Menor
>= mayor o igual
<= Menor o Igual
*/

select * from libros
where categoria != 'novelas'
order by 3;

select * from libros
where precio > 20
order by precio;

select * from libros
where precio < 20
order by precio;

select * from libros
where precio >= 20
order by precio;

select * from libros
where precio <= 20
order by precio;

select * from libros
where titulo > 'P' -- Kevin - Alfabetico
order by titulo;

describe libros;

# 20260512 - C5

/*Operadores Logicos AND - OR*/
select * from libros
where categoria = 'novelas' and precio <=15;

select * from libros
where categoria = 'novelass' and precio <=15;

select * from libros
where categoria = 'novelas' or precio <=15;

select * from libros
where categoria = 'novelas' and precio =20 or categoria ='Cuentos'
order by 1;

select * from libros
where (categoria = 'novelas' and precio =20) or categoria ='Cuentos'
order by 1;

select * from libros
where categoria = 'novelas' and (precio =20 or categoria ='Cuentos')
order by 1;

select * from empleados
where fecha_ingreso between '1990-01-01' and '1994-03-20'
order by fecha_ingreso;

select * from ventas
where cantidad between 10 and 20
order by cantidad desc;

select * from ventas
where cantidad not between 10 and 20
order by cantidad desc;

select * from libros
order by 2;

select * from libros
where titulo like '%amor%'
order by 2;

select * from libros
where titulo like '%la%'
order by 2;

select * from libros
where titulo like 'la%'
order by 2;

select * from libros
where titulo like '%sis'
order by 2;

select * from libros
where titulo not like '%la%'
order by 2;

select * from libros
where comentarios is null
order by precio;

select * from libros
where comentarios is not null
order by precio;

select * from empleados;

select * from empleados where puesto_id = "2" or puesto_id = "5" or puesto_id = "12";

SELECT * from empleados WHERE puesto_id = 2 or puesto_id = 5 or puesto_id = 12;

select * from empleados where puesto_id in(12 , 2 , 5);

select puesto_id from puestos
where descripcion = 'diseñador' or descripcion = 'editor';

select * from empleados where puesto_id in(
	select puesto_id from puestos
	where descripcion = 'CEO' or descripcion like '%edit%'
);

-- Consulta de creacion de tabla ---

create table libros_copia
select * from libros;

select * from libros_copia;

create table libros_copia_novelas
select * from libros where categoria='novelas';

select * from libros_copia_novelas;

create table libros_copia_SoloEstructura
select * from libros
limit 0;

select * from libros_copia_SoloEstructura;

-- UPDATE / DELETE

SET SQL_SAFE_UPDATES = 0;

select * from libros;

update libros set comentarios='Algun comentario'
where comentarios is null;

update libros set comentarios='otro comentario', precio=precio*1.2
where categoria='novelas' and precio >10;

select * from ventas;

select * from ventas
where local_id=8042 and factura_nro=423;

delete from ventas
where local_id=8042 and factura_nro=423;

create table ventas_copia
select * from ventas;

select * from ventas_copia;

truncate ventas_copia;

create table autores_copia
select * from autores;

select * from autores_copia;

-- cambio tipo por el mismo para agregar AI y PK a la columna 1
alter table autores_copia modify idAutorNum int auto_increment primary key;

INSERT INTO autores_copia
(autor_id, nombre, apellido, telefono, direccion, ciudad, codpost, idProvincia, idEstado)
VALUES
('123-45-6753', 'Jorge Luis', 'Borges', '1112345678', 'Av. Corrientes 1234', 'Buenos Aires', '1000', 1, 1)
;

delete from autores_copia;

truncate autores_copia;

# 20260515 - C6

start transaction; -- Inicia Transaccion

update libros set comentarios='Commit'
where comentarios='';

select * from libros;

rollback; -- Finaliza Transaccion volviendo atras
commit; -- Finaliza  Transaccion confirmando los cambios

-- ----------- Funciones de agregado y agrupamiento ---------

select * from ventas;

select count(*) from ventas;

select count(local_id),count(*) from ventas;

select count(*), count(precio) from libros;

select sum(cantidad) from ventas;

select max(cantidad) from ventas;

select min(cantidad) from ventas;

select avg(cantidad) as FunProm, sum(cantidad)/count(*) as CuntaClasica from ventas;

select local_id , count(*) as CantidadLineas
from ventas
group by local_id;

select * from ventas;

select local_id , sum(cantidad) as CantidadVendida
from ventas
group by local_id;

select local_id ,  count(*) as CantidadLineas, sum(cantidad) as CantidadVendida
from ventas
group by local_id;

select * from ventas;

select local_id , factura_nro, count(*) as CantidadLineas
from ventas
group by local_id, factura_nro;


select local_id , sum(cantidad) as CantidadVendida
from ventas
group by local_id
having CantidadVendida > 80
;

select local_id , sum(cantidad) as CantidadVendida
from ventas
group by local_id
order by 2;


select local_id , sum(cantidad) as CantidadVendida
from ventas
where cantidad > 20
group by local_id
having sum(cantidad) > 80;

-- ----------- UNION --------------------------

create table  empleados_hist
select * from empleados;

select count(*) from empleados
order by 1;

select *,'' from empleados
union
select *,'' from empleados_hist
union
select *,'' from ventas
union
select * from libros;

select *, left(concat('B_',empleado_id),9), curdate() from empleados_hist;

update empleados_hist set 
empleado_id = left(concat('B_',empleado_id),9),
fecha_ingreso = current_date()
where empleado_id not in('PMA42628M', 'PSA89086M');

select * from empleados
union 
select * from empleados_hist;

select * from empleados
union all
select * from empleados_hist;

# 20260519 - C7

-- Antes del Join Errores con IA

select * from libros, editoriales;

select * from libros, editoriales
where libros.editorial_id = editoriales.editorial_id;

select * from libros
inner join editoriales on libros.editorial_id = editoriales.editorial_id;

select * from libros
inner join editoriales on libros.editorial_id = editoriales.editorial_id
inner join libroautor on libroautor.libro_id = libros.libro_id
inner join autores on autores.autor_id = libroautor.autor_id;

select 
	titulo,categoria, precio,
    editoriales.nombre as Editorial ,editoriales.ciudad, provincia,
    autores.nombre as Autor,apellido,autores.ciudad, idProvincia
from libros
inner join editoriales on libros.editorial_id = editoriales.editorial_id
inner join libroautor on libroautor.libro_id = libros.libro_id
inner join autores on autores.autor_id = libroautor.autor_id;

select 
	titulo,categoria, precio,
    ed.nombre as Editorial ,ed.ciudad, provincia,
    au.nombre as Autor,apellido,au.ciudad, idProvincia
from libros li
inner join editoriales ed on li.editorial_id = ed.editorial_id
inner join libroautor la on la.libro_id = li.libro_id
inner join autores au on au.autor_id = la.autor_id;

# 20260522 - C8

-- Todos de una tabla

select li.*,
	-- titulo,categoria, precio,
    ed.nombre as Editorial ,ed.ciudad, provincia,
    au.nombre as Autor,apellido,au.ciudad, idProvincia
from libros li
inner join editoriales ed on li.editorial_id = ed.editorial_id
inner join libroautor la on la.libro_id = li.libro_id
inner join autores au on au.autor_id = la.autor_id;

select * from editoriales;

insert into editoriales
values
('N10','Nueva 1','San Lorenzo','5','Argentina'),
('N20','Nueva 2','Tilcara','9','Argentina'),
('N30','NUeva3','Plotier','Ne','Argentina');

select * from editoriales ed
inner join libros li on li.editorial_id = ed.editorial_id;

select * from editoriales ed 
left join libros li on li.editorial_id = ed.editorial_id;

select * from editoriales ed 
right join libros li on li.editorial_id = ed.editorial_id
where ed.libro_id is null;

select ed.* from editoriales ed 
left join libros li on li.editorial_id = ed.editorial_id
where li.libro_id is null;

select ed.* from editoriales ed 
right join libros li on li.editorial_id = ed.editorial_id;
-- where li.libro_id is null;

select ed.* from  libros li
right join editoriales ed on li.editorial_id = ed.editorial_id
where li.libro_id is null;

-- Subconsulta

select * from ventas order by cantidad desc;

select avg(cantidad) as prom from ventas; -- 24.6316

select * from ventas 
where cantidad > 24.6316
order by cantidad desc;

select * from ventas 
where cantidad > (select avg(cantidad) from ventas)
order by cantidad desc;

-- Funciones integradas de texto

select nombre, Upper(nombre) as EnMayuscula, lower(nombre) as EnMinuscula 
from autores;

select concat(nombre,' ' , apellido, ' ' , telefono, ' ', ciudad)
from autores;

select concat('Datos Generales :  ' ,nombre,' - ' , apellido, ' - ' , telefono, ' - ', ciudad) as Concatenado
from autores;

select concat_ws(' - ' ,'Datos Generales :  ' ,nombre, apellido,  telefono, ciudad) as ConcatenadoWS
from autores;

select nombre, left(nombre,1)
from autores;

-- Inicial del nombre en mayuscual + . + apellido en mayuscula y Todo en al misma columna.
-- H.QUIROGA
-- A. B...

SELECT nombre, apellido , concat_ws(".", Upper(nombre), Upper(apellido)) as Concatenacion FROM autores;

Select concat(upper(left(nombre,1)), ',', upper(apellido)) from autores;

Select Upper(concat(left(nombre,1), ',', (apellido))) from autores;

SELECT nombre, apellido, concat_ws('.', UPPER(LEFT(nombre, 1)), UPPER(apellido)) AS Concatenacion 
FROM autores; 

select empleado_id, 
left(empleado_id,3) , 
substring(empleado_id,4,3),
right(empleado_id,3) 
from empleados;

-- 426 - Italia
-- 890 - España

select * from empleados
where  substring(empleado_id,4,3) = (select codigo from paises where pasi='España');

-- Paises
-- 'Pais' - 'Codigo'
-- 'España' - '890'

select titulo, char_length(titulo)
from libros
order by 2 desc;

select left(titulo,40), char_length(left(titulo,40))
from libros
order by 2 desc;

# 20260526 - C9
-- case - No tiene que ver con Funciones

select * from provincias;

select
 idProvincia, nombre,
 case
	when nombre = 'Buenos Aires' then 'BA'
    when nombre = 'Catamarca' then 'CT'
    when nombre = 'Entre Ríos' then 'ER'
    else 'Sin codigo de Provincia'
 end as CodigoProvincia
from provincias;

-- Seguimos con funciones de texto
-- Ltrim

select
 idProvincia, nombre, concat('     ',nombre) as ConEspacios,
 ltrim(concat('     ',nombre)) as SinEspacios
from provincias;

-- replace

select * from libros;

select
titulo, categoria ,replace(categoria,'Novelas','LasNovelas')
from libros;

select
titulo, replace(categoria,'Novelas','LasNovelas') as categoria
from libros;

select
titulo, replace(replace(categoria,'Novelas','LasNovelas'),'Ensayos','LosEnsayos') as categoria
from libros;

-- Funciones de fecha

select curdate();

select curtime();

select concat(curdate(),' ' , curtime()), now();

select now();

select * from libros;

select fecha_publicacion, year(fecha_publicacion) from libros;

select fecha_publicacion, month(fecha_publicacion) from libros;

select fecha_publicacion, day(fecha_publicacion), day(fecha_publicacion)+1 from libros;

select * from libros where year(fecha_publicacion) between 1990 and 1994;

select * from libros where year(fecha_publicacion) < 1990 ;

select titulo, fecha_publicacion, 
dayname(fecha_publicacion) as NombreDia,
monthname(fecha_publicacion) as NombreMes,
dayofweek(fecha_publicacion) as NumeroDia,
dayofyear(fecha_publicacion) as DiaDelAño
from libros;

select
	fecha_publicacion, datediff(curdate(),fecha_publicacion) as DiasTranscurridos
from libros;

select
	fecha_publicacion, timestampdiff(year,curdate(),fecha_publicacion) as TiempoTranscurrido
from libros;

select
	fecha_publicacion, timestampdiff(month,curdate(),fecha_publicacion) as TiempoTranscurrido
from libros;

select
	fecha_publicacion, timestampdiff(quarter,curdate(),fecha_publicacion) as TiempoTranscurrido
from libros;

select curdate() as FechaActual,
adddate(curdate(),interval 2 month) as 'A dos meses',
adddate(curdate(),interval 60 day) as 'A 60 dias',
adddate(curdate(),interval 1 year) as 'A 1 Año',
adddate(curdate(),interval -1 year) as '1 Año atras';

-- Funciones de numeros

select round(123.456), round(123.556);

select round(123.456,1), round(123.556,1);

select
	fecha_publicacion, abs(datediff(fecha_publicacion, curdate())) as DiasTranscurridos
from libros;

select pow(2,3); -- Potencia

select mod(10,3);

-- BckUp

-- C:\Program Files\MySQL\MySQL Workbench 8.0\mysqldump.exe

-- C:\Users\user\Documents\dumps\Dump20260526.sql







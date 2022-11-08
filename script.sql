-- cur3d_parcela
select count(1) from cur3d_parcela 

select count(distinct geom) from cur3d_parcela

select count(distinct smp) from cur3d_parcela

-- mindesarrollourbanoytransporte_codigourbanistico
select count(1) from mindesarrollourbanoytransporte_codigourbanistico 

select count(distinct the_geom) from mindesarrollourbanoytransporte_codigourbanistico

select count(distinct smp1) from mindesarrollourbanoytransporte_codigourbanistico

select count(1) 
from mindesarrollourbanoytransporte_codigourbanistico cod, cur3d_parcela par
where cod.smp1 = par.smp 

select smp, count(smp) from cur3d_parcela
group by smp
having count(1) > 1

union
select smp1, count(smp1) from mindesarrollourbanoytransporte_codigourbanistico
group by smp1 
having count(1) > 1

select smp, geom, count(smp) from cur3d_parcela
group by smp, geom 
having count(1) > 1

select * from cur3d_parcela where smp = '023-162-000'

select geom from cur3d_parcela where smp = '021-019-014a'

-- cur3d_superficieedificableplanta
select count(distinct smp) from cur3d_superficieedificableplanta 

select smp, count(smp) from cur3d_superficieedificableplanta
group by smp
having count(1) > 1

-- cur3d_superficieedificabletotal
select count(distinct smp) from cur3d_superficieedificabletotal 

select count(1) from cur3d_superficieedificabletotal 

select * from cur3d_superficieedificabletotal 

select smp, count(smp) from cur3d_superficieedificabletotal
group by smp
having count(1) > 1

select smp, fuente, superficie, count(smp) from cur3d_superficieedificabletotal
group by smp, fuente, superficie 
having count(1) > 1

select smp, fuente, superficie from cur3d_superficieedificabletotal where smp = '051-085-012'

select smp, fuente, superficie from cur3d_superficieedificabletotal where smp = '051-085-014a'

select smp, fuente, superficie from cur3d_superficieedificabletotal where smp = '051-026-027a'

select smp, fuente, superficie from cur3d_superficieedificabletotal where smp = '051-026-004b'

-- cur3d_rivolta

select count(1) from cur3d_rivolta 

select count(distinct smp) from cur3d_rivolta 

select smp, count(smp) from cur3d_rivolta
group by smp
having count(1) > 1
order by count desc

select smp, geom, count(smp) from cur3d_rivolta
group by smp, geom
having count(1) > 1

select smp, geom from cur3d_rivolta where smp = '009-072-001d'

-- cur3d_croquisparcela

select * from cur3d_croquisparcela

select count(1) from cur3d_croquisparcela -- diferencia de 3469 registros con respecto a mindesarrollourbanoytransporte_codigourbanistico

select count(distinct nomenclatura) from cur3d_croquisparcela

select nomenclatura, count(nomenclatura) from cur3d_croquisparcela
group by nomenclatura
having count(1) > 1

union
select smp1, count(smp1) from mindesarrollourbanoytransporte_codigourbanistico
group by smp1 
having count(1) > 1

select smp1, count(smp1) from mindesarrollourbanoytransporte_codigourbanistico
group by smp1 
having count(1) > 1

union
select nomenclatura, count(nomenclatura) from cur3d_croquisparcela
group by nomenclatura
having count(1) > 1

select * from cur3d_croquisparcela where nomenclatura = '023-162-000'

select distinct nomenclatura, count(1) from cur3d_croquisparcela
inner join
mindesarrollourbanoytransporte_codigourbanistico on nomenclatura != smp1
group by nomenclatura 

select nomenclatura, count(1) as counter from cur3d_croquisparcela
join
mindesarrollourbanoytransporte_codigourbanistico 
on cur3d_croquisparcela.nomenclatura = mindesarrollourbanoytransporte_codigourbanistico.smp1
group by nomenclatura 

-- cur3d_perimetromanzana

select * from cur3d_perimetromanzana 

select count(1) from cur3d_perimetromanzana 

select count(distinct sm) from cur3d_perimetromanzana 


-- cur3d_perimetromanzana

select * from cur3d_perimetromanzana  

select count(1) from  cur3d_perimetromanzana

select count(distinct sm) from  cur3d_perimetromanzana

-- cur3d_manzanaatipica

select * from cur3d_manzanaatipica 

select count(1) from  cur3d_manzanaatipica

select count(distinct sm) from  cur3d_manzanaatipica

select algoritmo.actualizarciudad3d_2()

select count(1) from public.cur3d_manzana cdm 
select count(1) from algoritmo.manzana m 
truncate table public.cur3d_manzana restart identity cascade;
truncate table public.cur3d_parcela  restart identity cascade;
truncate table public.cur3d_manzanaatipica  restart identity cascade;
truncate table public.mindesarrollourbanoytransporte_codigourbanistico  restart identity cascade;
truncate table public.cur3d_areaproteccionhistorica  restart identity cascade;
truncate table public.cur3d_superficieedificableplanta  restart identity cascade;
truncate table algoritmo.manzana  restart identity cascade;
truncate table algoritmo.parcela  restart identity cascade;

SELECT
	sm, tipo,
	st_force2d( st_transform(ST_SetSRID(geom,4326), 97433)),
	localtimestamp, localtimestamp, '', '', true,true, 'ALGORITMO'
FROM algoritmo.manzana

select st_asewkt(geom) from cur3d_manzana;

select st_asewkt(geom) from algoritmo.manzana;


INSERT INTO public.cur3d_manzana (sm, tipo, geom, timestamp_alta, timestamp_modificacion, observaciones_publicables, observaciones_privadas, publicable,verificado, fuente)	  
(SELECT sm, tipo, ST_SetSRID(geom, 97433), localtimestamp, localtimestamp, '', '', true,true, 'ALGORITMO' FROM algoritmo.manzana);

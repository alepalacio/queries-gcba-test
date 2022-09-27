select count(1) from cur3d_parcela 

select count(distinct geom) from cur3d_parcela

select count(distinct smp) from cur3d_parcela

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

select geom from cur3d_parcela where smp = '023-162-000'

select geom from cur3d_parcela where smp = '021-019-014a'

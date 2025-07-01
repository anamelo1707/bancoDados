--1)quantos filmes há em portugues?
select
	count(*)
from
	film f
inner join "language" l on
	f.language_id = l.language_id
where
	l."name" = 'português';

--2)quantos clientes alugaram o filme de id=7?
select
	count(*)
from
	customer c
inner join rental r on
	c.customer_id = r.customer_id
inner join inventory i on
	r.inventory_id = i.inventory_id
inner join film f on
	i.film_id = f.film_id
where
	i.film_id = 7;

--3)quantos alugueis foram feitoa no total?
select count(*) from rental r;

--4)qual foi a custo do filme de id=600?
select
	f.replacement_cost F
from
	film f
where
	f.film_id = 600;

--5)qual funcionario alugou mais filmes?
select
	s.first_name,
	s.last_name
from
	staff s
join rental r
on
	s.staff_id = r.staff_id
group by
	s.first_name ,
	s.last_name
order by
	count(r.rental_id) desc
limit 1;

--6)quantos funcionarios tem em cada loja?
select
	a.address, count(*)
from
	address a2 
inner join store s 
on
	a.address_id = sto.address_id 
inner join address a on
group by
	a.address;

--7)lste as seguintes colunas título do filme,idioma,custo...
select
	f.title as "titulo do filme",
	l."name" as "idioma",
	f.replacement_cost as "custo de reposicao",
	r.rental_date,
	c.first_name as "nome do cliente",
	s.first_name  as " nome do funcionario",
	s2.store_id as "id da loja",
	f.rental_rate as "valor do aluguel"
from
	film f
inner join "language" l on
	l.language_id = f.language_id
inner join inventory i on
	i.film_id = f.film_id
inner join rental r on
	r.inventory_id = i.inventory_id
inner join customer c on
	c.customer_id = r.customer_id 
inner join staff s on
    s.staff_id = r.staff_id 
inner join store s2 on
    s2.store_id = s.store_id 
order by
    r.rental_date desc  
limit 1 ;

--8)quantos atores que participaram do filme de id=1 começam...
select
	count(*)
from
	film_actor fa
where 
    fa.film_id =1;

--9)qual loja possui mais inventarios?
select
    count(i.inventory_id) 
from 
    store s
inner join staff s2 on
    s2.store_id = s.store_id 
inner join rental r on
    r.staff_id = s2.staff_id 
inner join inventory i on
    i.inventory_id = r.inventory_id
group by
    s.store_id 
order by 
    count(i.inventory_id) desc 
limit 1;

      












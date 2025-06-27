--1)quantos filmes há em portugues?
select count(*) from film f inner join "language" l on f.language_id = l.language_id 
where l."name" = 'português';

--2)quantos clientes alugaram o filme de id=7?
select count(*) from customer c
inner join rental r ON c.customer_id = r.customer_id
inner join inventory i on r.inventory_id = i.inventory_id
inner join film f on i.film_id = f.film_id 
where i.film_id =7;

--3)quantos alugueis foram feitoa no total?
select count(*) from rental r;

--4)qual foi a custo do filme de id=600?
select f.replacement_cost from film f
where f.film_id=600;

--5)qual funcionario alugou mais filmes?
select s.first_name, s.last_name from staff s join rental r
on s.staff_id = r.staff_id 
group by s.first_name , last_name
order by count(r.rental_id) desc
limit 1;

--6)quantos funcionarios tem em cada loja?
select a.address_id count(*) from staff sta inner join store sto 
on sta.store_id = sto.store_id 
inner join address a on
group by address_id;

--7)lste as seguintes colunas título do filme,idioma,custo...
select


--8)quantos atores que participaram do filme de id=1 começam...
select count(*) from film_actor fa 
where 

--9)qual loja possui mais inventarios?
--1
select * from film;

--2
select title from film;

--3
select * from film where length < 60;

--4
select * from customer where active =0;

--5

select first_name, last_name, address
from customer c, address a
where active = 1 and c.address_id = a.address_id;

--6
select first_name, last_name, a.address, co.country
from customer c, address a, city ct, country co
where c.address_id = a.address_id
		and a.city_id = ct.city_id
	and co.country = 'Brazil';
--7
select f.title, a.first_name, a.last_name
from film f, film_actor fa, actor a
where f.film_id = fa.film_id and a.actor_id = fa.actor_id

--8
select f.title, a.first_name, a.last_name
from film f, film_actor fa, actor a
where f.film_id = fa.film_id and a.actor_id = fa.actor_id
order by f.title

--9
select f.title, a.first_name, a.last_name
from film f, film_actor fa, actor a
where f.film_id = fa.film_id and a.actor_id = fa.actor_id
order by a.first_name

--10
select f.title, a.first_name, a.last_name
from film f, film_actor fa, actor a
where f.film_id = fa.film_id and a.actor_id = fa.actor_id
and a.first_name = 'NICK';

--11
select count(*) qtd_filmes from film;

--12
select avg(length)
from  film;

--13
select f.title, c.name
from film f, category c, film_category fc
where f.film_id = fc.film_id
	and fc.category_id = c.category_id;

--14
select c.name, count(*)
from film f, category c, film_category fc
where f.film_id = fc.film_id and fc.category_id = c.category_id
group by c.name

--15
select c.name, count(*)
from film f, category c, film_category fc
where f.film_id = fc.film_id and fc.category_id = c.category_id
group by c.name;

--16
select c.name, count(*) qtd
from film f, category c, film_category fc
where f.film_id = fc.film_id and fc.category_id = c.category_id
group by c.name
HAVING qtd < 57;


--17
select c.name, count(*) qtd, AVG(f.length)
from film f,category c, film_category fc
where f.film_id = fc.film_id and fc.category_id = c.category_id
group by c.name
having qtd < 57;

--18
select c.first_name, c.last_name,  count(*)
from customer c, rental r
where c.customer_id = r.customer_id
group by (c.customer_id)

--19
select c.email, c.last_name, count(*) qtd
from customer c, rental r
where c.customer_id = r.customer_id
group by (c.customer_id)
order by qtd desc;

--20
select c.first_name, c.last_name
from customer c
where exists (select 1
			 from rental r
			 where c.customer_id = r.customer_id and r.return_date IS NOT NULL);
             
--21             
select c.first_name, c.last_name
from customer c
where not exists(select 1
				from rental r
		where c.customer_id = r.customer_id and r.return_date is not NULL);
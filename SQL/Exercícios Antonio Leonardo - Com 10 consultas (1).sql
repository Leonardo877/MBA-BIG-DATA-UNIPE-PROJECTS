--Exercícios Antonio Leonardo




--1) Lista de todos os filmes onde o tema é ação

select f.title, c.name 
from film f, category c
where name = 'Action'


--2) Lista de filmes com o preço maior igual 0.99 e menor igual a 5.99

select title, amount  from film, payment
where amount >=0.99 and amount <=5.99
order by amount;



--3) Descrição do filme ZORRO ARK em que a atriz penelope GUINESS ATUOU

select description from actor, film
where first_name = 'PENELOPE'
and last_name = 'GUINESS'
and  title = 'ZORRO ARK'



--4) Verificando se no Brasil exibe o filme date speed e ali forever

select title, country from film, country
where country = 'Brazil'
and title in ('DATE SPEED', 'ALI FOREVER') 
ORDER BY title;



--5) Lista de cliente que moram no Brasil e que residence na cidade de sorocaba

select first_name, country, city from country, city, customer
where country = 'Brazil'
and city = 'Sorocaba'
order by first_name;




--6) Lista de cliente que moram no brasil e que estão ativos.


select first_name, email, country from customer, country
where active = '1'
and country = 'Brazil'
order by first_name;


--7) Lista de filmes de animação com duração de 3 horas

select title, rental_duration, name 
from film, category
where rental_duration = '3'
and name = 'Animation';


--8) Lista de filmes de comédia com o preço entre 0.99 e 3.99 ordenado do maior valor para o menor.

select amount, title, name
from payment, film, category
where name = 'Comedy'
and amount BETWEEN 0.99 and 3.99
order by amount desc;



--9) Verificando se  a CLIENTE do e-mail MARY.SMITH@sakilacustomer.org possui algum filme alugado no momento

select *
from customer c
where exists (select 1 from rental r
             where c.customer_id = r.customer_id and r.return_date IS NOT NULL)
and email = 'MARY.SMITH@sakilacustomer.org'


--10) Verificando as cidades no Brasil ontem o filme Alice Fantasia está com o valor menor igual a 6.99.

select title, city, country, amount
from film, city, payment, country
where title = 'ALICE FANTASIA'
and amount <= '6.99'
and country = 'Brazil'
order by amount;





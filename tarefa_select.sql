select actor from actor;
select actor from actor where first_name like 'Chris';
select actor from actor where first_name like 'Bette' and last_name like 'Nicholson';
select actor from actor limit 10;

select address from address;
select * from address where city_id = 500;
select * from address where district like 'Sind' and postal_code like '94018';
select address from address limit 10;

select category from category;
select f.title, c.category_id, c.name from category c inner join film_category fc on c.category_id = fc.category_id inner join film f on f.film_id = fc.film_id where c.category_id = 5; --listar apenas filmes de comédia category_id = 5
select f.title, c.category_id, c.name from category c inner join film_category fc on c.category_id = fc.category_id inner join film f on f.film_id = fc.film_id where c.category_id = 8 and title like '%Rocky%'; --listar filmes de familia com rocky no nome
select category from category limit 10;

select city from city;
select * from city where country_id = 44; -- lista cidades do país com o id igual a 44
select cou.country, ci.city, cou.country_id from city ci inner join country cou on ci.country_id = cou.country_id where cou.country = 'Argentina' and ci.city = 'Quilmes'; -- lista as cidade de quilmes na Argentina
select city from city limit 10;

select * from country;
select ci.city, cou.country from country cou inner join city ci on cou.country_id = ci.country_id where cou.country = 'Brazil'; -- lista todas as cidades do Brazil
select ci.city, cou.country from country cou inner join city ci on cou.country_id = ci.country_id where cou.country = 'Chile' and ci.city = 'Antofagasta'; --lista a cidade antofagasta no Chile
select country from country limit 10;

select customer from customer;
select customer from customer where first_name like 'Paula';
select * from customer where store_id = 1 and first_name like 'K%'and last_name like 'A%'; -- pega a pessoa que visitou a loja de id = 2 que tenha como primeira letra do nome K e primeira do sobrenome A
select customer from customer limit 10;

select film from film;
select * from film where rental_duration = 7; -- pega filme com 7 dias de aluguel
select film from film where title like '%War%' and description like '%Scientist%'; -- o usuario nao lembra muito sobre o filme, a não ser que tinha guerra no nome e um cientista como vilão
select film from film limit 10;

select film_actor from film_actor;
select f.title, f.description, f.film_id from film_actor fa inner join film f on fa.film_id = f.film_id where f.title = 'Reef Salute' limit 1; -- pega o filme Reef Salute
select a.first_name,a.last_name from film_actor fc inner join actor a on fc.actor_id = a.actor_id where a.first_name like 'Chris' and a.last_name like 'Bridges' limit 1; --encontra o ator chris bridges
select film_actor from film_actor limit 10;

select film_category from film_category;
select fc.category_id, c.name, f.film_id, f.title from film_category fc inner join category c on fc.category_id = c.category_id inner join film f on fc.film_id = f.film_id where fc.category_id = 8; --lista de filmes para a família
select fc.category_id, c.name, f.film_id, f.title, f.description, f.rating from film_category fc inner join category c on fc.category_id = c.category_id inner join film f on fc.film_id = f.film_id where fc.category_id = 6 and f.rating = 'PG-13'; --lista de documentarios para adolescentes e adultos
select film_category from film_category limit 10;

select * from inventory;
select  i.store_id, l.name, f.title from inventory i inner join film f on i.film_id = f.film_id inner join language l on f.language_id = l.language_id where i.store_id = 1 and f.title like 'Chainsaw%'; -- averiguar se a loja id 1 tem o filme Chainsaw
select f.title, f.length, f.rating from inventory i inner join film f on i.film_id = f.film_id where f.length <= 90 and f.rating = 'NC-17'; --filme com menos de 1h e meia de duracao para adultos
select inventory from inventory where inventory_id <= 10;

select language from language;
select l.language_id, l.name, f.title from language l inner join film f on  f.language_id = f.language_id where l.language_id = 3; --filmes dublados em japônes
select l.language_id, l.name, f.title, f.rating from language l inner join film f on  f.language_id = f.language_id where f.rating = 'G'; -- os pais tão buscando um filme para a família inteira
select language from language limit 5;

select payment from payment;
select r.rental_date, p.amount, c.first_name, c.last_name, c.customer_id from payment p inner join rental r on p.rental_id = r.rental_id inner join customer c on r.customer_id = c.customer_id where p.amount = 0.99; --clientes que pagaram 0.99 e a data que alugaram
select count(amount), staff_id, amount from payment where staff_id = 2 and  amount = 7.99 group by staff_id, amount; --contabiliza todos os pagamentos no valor de 7.99 realizados pelo funcionário com id 2
select payment from payment limit 10;

select rental from rental;
select f.title, r.customer_id from rental r inner join inventory i on r.inventory_id = i.inventory_id inner join film f on i.film_id = f.film_id; -- id do cliente e o filme que alugou
select f.title, c.name as categoria, c.category_id from rental r inner join inventory i on r.inventory_id = i.inventory_id inner join film f on i.film_id = f.film_id inner join film_category fc on fc.category_id = fc.category_id inner join category c on fc.category_id = c.category_id where c.category_id = 15; -- filmes da categoria sport e seus titulos
select rental from rental limit 10;

select staff from staff;
select sta.first_name, sta.last_name, pay.amount from staff sta inner join payment pay on sta.staff_id = pay.staff_id where sta.staff_id = 2; --todos os registros de cobranca realizados pelo do jon 
select sta.staff_id, sta.first_name, sta.last_name, r.customer_id, c.first_name, c.last_name from staff sta inner join rental r on sta.staff_id = r.staff_id inner join customer c on r.customer_id = c.customer_id where c.customer_id = 355; --registro de compras realizadas pelo cliente id 355
select staff from staff limit 1;

select store from store;
select sta.first_name, sta.last_name, sta.store_id from store s inner join staff sta on s.store_id = sta.store_id; --acessando os funcionários da loja e a qual loja pertencem
select s.store_id, a.address, a.district, c.city  from store s inner join address a on s.address_id = a.address_id inner join city c on a.city_id = c.city_id where store_id = 1; --endereco do estabelecimento id = 1
select store from store limit 1;


--Michael Sanzo
--Lab 5: The Joins (Three-quel)

--1) Cities of agents booking an order for a customer whose id is 'c006'. no subqueries.

select a.city --cities of agents
from orders o inner join agents a 
			on o.aid = a.aid --orders and agents data set
	      inner join customers c 
			on o.cid = c.cid --customers data set
where o.cid = 'c006'; --cid is 'c006'

--NY
--Tokyo
--Dallas

--2) Ids of products ordered through any agent who makes at least one order for a customer in Kyoto.
select distinct o.pid --product id
from orders o inner join agents a 
			on o.aid = a.aid --orders and agents data set
	      inner join customers c 
			on o.cid = c.cid --inforamtion from customers data set
where c.city = 'Kyoto'; --customer in Kyoto

--p01
--p07

--3) Show the names of customers who have never placed an order. 
--   Use a subquery.	

select name --name of customer
from customers
where cid in (select cid
	      from customers --cid from customers data set
			except --except join
	      select cid
	      from orders --cid from orders data set
	     );
	     

--Weyland

--4) Names of customers who have never placed an order w/ an outer join.

select distinct c.name --customer
from  orders o right outer join customers c 
				on c.cid = o.cid
where o.cid is null; --no match

--Weyland

--5) Names of customers who placed at least one order	through	an agent in their own city, along with	those agent(s')	names.	

select distinct c.name,
                a.name --customer name and agent name
from orders o inner join customers c 
			on o.cid = c.cid --informaiton from orders and customers table
	      inner join agents a 
			on o.aid = a.aid --information from agents table
where c.city = a.city

--Tiptop
--Otasi

--6) Names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not 
--the customer has ever placed an order with that agent.

select c.name,
       a.name,
       c.city --show name of customers, agents, city
from customers c inner join agents a 
			on c.city = a.city;

--7) Name and city of customers who live in the city that makes the fewest different kinds of products.

select count(pid), --counting the products
       p.city
from customers c inner join products p 
			on c.city = p.city --products and customers with the same city
where c.city = p.city
group by p.city

--4, Duluth
--6, Dallas



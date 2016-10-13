--Michael Sanzo
--Lab 6

--1. Display	the	name	and	city	of	customers	who	live	in	any	city	that	makes	the	most
--different	kinds	of	products.	(There	are	two	cities	that	make	the	most	different	
--products.	Return	the	name	and	city	of	customers	from	either	one	of	those.)	

SELECT c.name, ci.city --name and city of customers
FROM customers c, 
	    (SELECT MAX(x.difprod), x.city --different products
	     FROM (SELECT COUNT(city) AS difprod, city
	           FROM products p
		   GROUP BY city
	           ORDER BY COUNT(city)DESC--descending
		   ) AS x
	     GROUP BY x.city
	     ORDER BY max(x.difprod) DESC--descending
	     LIMIT 2
		   ) AS ci
WHERE c.city = ci.city;--city that makes most diverse products
--2. Display	the	names	of	products	whose	priceUSD	is	strictly	below	the	average	priceUSD,	
--in	reverse-alphabetical(Ascending) order.	

SELECT name--product names
FROM products p,
	    (SELECT (AVG (priceUSD)) --average price
		AS average
	     FROM products
	     ) 	AS price
WHERE p.priceUSD > price.average
ORDER BY name ASC;--reverse alphabetical
--3. Display	the	customer	name,	pid	ordered,	and	the	total	for	all	orders,	sorted	by	total	
--from	low	to	high.	

SELECT c.name, o.pid, o.totalUSD--customer name, pid, and usd
FROM customers c
INNER JOIN orders o ON --from orders
	(o.cid = c.cid)
ORDER BY o.totalUSD ASC;
--4. Display	all	customer	names	(in	alphabetical	order)	and	their	total	ordered,	and	
--nothing	more.	Use	coalesce	to	avoid	showing	NULLs.	

SELECT c.name, SUM (o.totalUSD)--add usd
FROM customers c, orders o
WHERE o.cid = c.cid
GROUP BY c.name
ORDER BY name ASC;--alphabetical
--5. Display	the	names	of	all	customers	who	bought	products	from	agents	based	in	New	
--York	along	with	the	names	of	the	products	they	ordered,	and	the	names	of	the	agents	
--who	sold	it	to	them.	

SELECT c.name, p.name, a.name--names of products, agents, customers
FROM orders o
INNER JOIN agents a ON --agent
	(a.aid = o.aid)
INNER JOIN products p ON --products they orders
	(p.pid = o.pid)
INNER JOIN customers c ON --customer
	(c.cid = o.cid)
WHERE o.aid IN (
	        SELECT a.aid--agents who did busiesns in new york
		FROM agents a
		WHERE city = 'New York'
		);
		
--6. Write	a	query	to	check	the	accuracy	of	the	dollars	column	in	the	Orders	table.	This	
--means	calculating	Orders.totalUSD	from	data	in	other	tables	and	comparing	those	
--values	to	the	values	in	Orders.totalUSD.	Display	all	rows	in	Orders	where	
--Orders.totalUSD	is	incorrect,	if	any.	

SELECT o.ordnum, (o.qty * p.priceUSD) AS accurateUSD, o.totalUSD--equation for right usd amount
FROM orders o
INNER JOIN products p ON --comparing it if it does not equal
	(p.pid = o.pid)
WHERE ((o.qty * p.priceUSD) <> o.totalUSD);
--7. What’s	the	difference	between	a	LEFT	OUTER	JOIN	and	a	RIGHT	OUTER	JOIN?	Give	
--example	queries	in	SQL	to	demonstrate.	(Feel	free	to	use	the	CAP	database	to	make	
--your	points	here.)

--OUTER joins compare two tables and returns data when a match is available or otherwise returns NULL values. Like with INNER join, this will duplicate rows in the 
--one table when it matches multiple records in the other table. OUTER joins tend to make result sets larger, because they won't by themselves remove any 
--records from the set. You must also qualify an OUTER join to determine when and where to add the NULL values:
	--LEFT OUTER JOIN means keep all records from the 1st table no matter what and insert NULL values when the 2nd table doesn't match.
	--RIGHT OUTER JOIN means the opposite: keep all records from the 2nd table no matter what and insert NULL values whent he 1st table doesn't match.











--Michael Sanzo
--Lab 4

--Get the cities of agents booking an order for a customer whose cid is 'c006'
SELECT city--city of agents
FROM Agents
WHERE aid IN ( SELECT aid--selecting customer 6
	       FROM Orders
	       WHERE cid = 'c006'
	       );	       
		
--Get the ids of products ordered through any agent who takes at least one order from a customer in Kyoto, sorted by pid from highest to lowest.
SELECT distinct pid--unique product
FROM Orders
WHERE cid IN(SELECT cid--kyoto 
	     FROM Customers
	     WHERE city = 'Kyoto'
	     )
ORDER BY pid DESC;--descending from high to low
--Get the ids and names of customers who did not place an order through agent a03 --was specific since ACME was twice
SELECT name, cid, city--id and names 
FROM Customers
WHERE cid IN (SELECT cid --as long as it wasn't through agent 3
	      FROM Orders
	      WHERE aid <> 'a03'  
	      );
			   
--Get the ids of customers who orderd both product p01 and p07
SELECT cid--p01
FROM Orders
WHERE pid = 'p01'
	intersect--ordered both products
SELECT cid--p01
FROM Orders
WHERE pid = 'p07';
		      
--Get the ids of products not ordered by any customers who placed any order through agent a08 in pid order from highest to lowest. 
SELECT distinct pid--unique ids of products
FROM Orders
WHERE aid IN (SELECT aid--not ordered through agent 8
	      FROM Agents
	      WHERE aid <> 'a08'
	      )
ORDER BY pid DESC;--descending from high to low
--Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York
SELECT name, discount, city--name discounts and city of customers
FROM Customers
WHERE cid IN (SELECT cid--customers
	      FROM Orders
	      WHERE aid IN (SELECT aid--orders from dallas or new york
	                    FROM agents
	                    WHERE city = 'Dallas'
	                    or city = 'New York'
	                    )
	     );
--Get all customers who have the same discccount as that of any customers in Dallas or London
SELECT *--all customers
FROM Customers
WHERE discount IN (SELECT discount--customers in dallas or london
		   FROM Customers
		   WHERE city = 'Dallas' 
			or city = 'London'
		   );
		 
---Tell me about check constraints
--	Check constraints are used to limit the value range within a column. If you define a check constraint on a single 
--column it allows only a certain values for this column. If you define a check constraint on a table it can 
--limit the value in certain columns based on vale in other columns in the row. Check constraints are good for databases
--because it is a tool that can be used to reject bad data balues going into tables. When you disable check constraints
--the load time can be much less, possibly significantly less. These constraints are very similar to foreign key constraints
--in that they control the values that are put in a column. The difference is how they determine which values are valid.
SELECT ordnum, totalUSD
FROM Orders

SELECT name, city
FROM Agents
WHERE name = 'Smith'

SELECT name, pid, priceUSD
FROM Products
WHERE quantity > 201000

SELECT name, city
FROM Customers
WHERE city = 'Duluth'

SELECT name
FROM Agents
WHERE city != 'New York' AND city != 'Duluth'

SELECT *
FROM Products
WHERE city != 'Dallas' AND city != 'Duluth' AND priceUSD >= 1

SELECT *
FROM Orders
WHERE mon IN ('feb', 'mar')

SELECT *
FROM Orders
WHERE totalUSD >= 600 AND mon = 'feb'

SELECT *
FROM Orders
WHERE cid = 'c005'


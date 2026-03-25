/*
Exercicio 2
1) SELECT
*/

-- 1. Liste todos os clientes
SELECT
	name

FROM
	customers;

-- 2. Liste FullName, Email, City
SELECT
	name AS FullName,
	email,
	city

FROM
	customers;

-- 3. Liste produtos ordenados por Price desc.
SELECT
	name,
	price

FROM
	products

ORDER BY
	price DESC;

-- 4. Liste as categorias distintas
SELECT DISTINCT
	category

FROM
	products;

-- 5. Liste os 5 produtos mais caros (TOP5) 
SELECT TOP 5
	name,
	price

From
	products

ORDER BY
	price DESC;


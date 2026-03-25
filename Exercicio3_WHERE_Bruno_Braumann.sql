/*
Exercicio 3
WHERE
*/

-- 6. Produtos com pre�o maior que 100 
SELECT
	name AS Nome_Produto,
	price AS Preco

FROM
	products

WHERE
	price > 100

ORDER BY -- opcional
	price DESC;

-- 7. Clientes da cidade Porto
SELECT
	name AS Nome_Cliente,
	city AS Cidade -- opcional para confirmar a cidade

FROM
	customers

WHERE
	city = 'Porto';

-- 8. Pedidos com status CANCELLED
SELECT
	order_id

FROM
	orders

WHERE
	status = 'CANCELLED';

-- (Opcional) 8. Pedidos com status CANCELLED - com nome cliente com uso de join
SELECT
	C.name AS Nome_Cliente,
	O.order_id

FROM
	orders O
	LEFT JOIN customers C ON O.customer_id = C.customer_id

WHERE
	status = 'CANCELLED';

-- (Opcional) 8. Pedidos com status CANCELLED - com nome cliente e produtos cancelados com uso de join
SELECT
	C.name AS Nome_Cliente,
	O.order_id,
	P.name AS Nome_Produto

FROM
	orders O
	LEFT JOIN customers C ON O.customer_id = C.customer_id
	LEFT JOIN order_items OI ON O.order_id = OI.order_id
	LEFT JOIN products P  ON P.product_id = OI.product_id

WHERE
	status = 'CANCELLED';

-- 9. Pedidos dos �ltimos 30 dias
SELECT
	order_id,
	order_date AS Data_Pedido

FROM 
	orders

Where
	order_date >= DATEADD (DAY, -30, GETDATE());

-- (Opcional) 9. Pedidos dos �ltimos 30 dias - com nome do cliente, produtos e quantidade por produto
SELECT
	C.name AS Nome_Cliente,
	O.order_id,
	P.name AS Nome_Produto,
	OI.quantity AS Quantidade,
	order_date AS Data_Pedido

FROM
	orders O
	LEFT JOIN customers C ON O.customer_id = C.customer_id
	LEFT JOIN order_items OI ON O.order_id = OI.order_id
	LEFT JOIN products P  ON P.product_id = OI.product_id

Where
	order_date >= DATEADD (DAY, -30, GETDATE());

-- 10. Produtos das categorias "Accessories" ou "Hardware"
SELECT
	name AS Nome_Produto,
	category AS Categoria

FROM
	products

WHERE
	category = 'Accessories'
	OR category = 'Hardware';

-- 11. Produtos com nome contendo �Course�
SELECT
	name AS Nome_Produto

FROM
	products

WHERE
	name LIKE '%Course%';

-- 12. Clientes com email terminando em �.com�
SELECT
	name AS Nome_Cliente,
	email AS Email_Cliente

FROM
	customers

WHERE
	email LIKE '%.com';


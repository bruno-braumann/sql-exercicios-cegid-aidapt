/*
Exerc�cio 4
GROUP BY / HAVING
*/

-- 13. Pre�o m�dio por categoria
SELECT
	category AS 'Categoria',
	AVG (price) AS 'Preco_Medio_Categoria'

FROM
	products

GROUP BY
	category

ORDER BY
	AVG (price) DESC;

-- 14. Quantidade de produtos por categoria
SELECT
	category AS 'Categoria',
	COUNT (product_id) AS 'Total_Produtos_Categoria'

FROM
	products

GROUP BY
	category

ORDER BY
	COUNT (product_id) DESC;

-- 15. Quantidade de pedidos por status
SELECT
	status AS 'Estado_Pedido', 
	COUNT (order_id) AS 'Total_Pedidos_Status' 

FROM
	orders

GROUP BY
	status

ORDER BY 
	COUNT (order_id) DESC;

-- 16. Total confirmado recebido (sum payments)
SELECT
	status AS 'Estado_Pagamento',
	SUM (amount) AS 'Total'

FROM
	payments

WHERE
	status = 'CONFIRMED'

GROUP BY
	status;

-- 17. Total pago por cliente
SELECT
	C.name AS 'Nome_Cliente',
	SUM (P.amount) as 'Total_Pago'

FROM
	customers C
	LEFT JOIN orders O ON C.customer_id = O.customer_id
	LEFT JOIN payments P on O.order_id = P.order_id

WHERE
	P.status = 'CONFIRMED'

GROUP BY
	C.name

ORDER BY
	SUM (P.amount) DESC;

-- 18. Clientes com total gasto > 300 (HAVING)
SELECT
	C.name AS 'Nome_Cliente',
	SUM (P.amount) as 'Total_Pago'

FROM
	customers C
	LEFT JOIN orders O ON C.customer_id = O.customer_id
	LEFT JOIN payments P on O.order_id = P.order_id

WHERE
	P.status = 'CONFIRMED'

GROUP BY
	C.name

HAVING
	SUM (P.amount) > 300

ORDER BY
	SUM (P.amount) DESC;

-- 19. Total de cada pedido (somar itens).
SELECT
	order_id,
	SUM (quantity) AS 'Total_Itens_Pedido', 
	SUM (quantity * unit_price) AS 'Total_Pedido' -- Se quisermos saber o valor total de cada pedido

FROM
	order_items

GROUP BY
	order_id

ORDER BY
	SUM (quantity) DESC;
	-- SUM (quantity * unit_price) DESC;


/*
Exercício 5
JOINS
*/

-- 20. INNER JOIN: pedidos + nome do cliente.
SELECT
	O.*,
	C.name AS 'Nome_Cliente'

FROM
	orders O
	INNER JOIN customers C ON O.customer_id = C.customer_id;


-- 21. INNER JOIN: itens + nome do produto
SELECT
	OI.*,
	OI.quantity * OI.unit_price AS 'Total_Item',
	P.name AS 'Nome_Produto'

FROM 
	order_items OI
	INNER JOIN products P ON OI.product_id = P.product_id;


-- 22. Total do pedido com nome do cliente
SELECT
	O.order_id, -- Se não colocar, obtenho o total de itens pedidos por cliente e não por pedido
	C.name AS 'Nome_Cliente',
	SUM (OI.quantity) AS 'Total_Itens_Pedido',
	SUM (OI.quantity * OI.unit_price) AS 'Valor_Total'

FROM orders O
	INNER JOIN customers C ON O.customer_id = C.customer_id
	INNER JOIN order_items OI ON O.order_id = OI.order_id

GROUP BY
	O.order_id, -- Não colocar se não usar em SELECT
	C.name

ORDER BY
	-- SUM (OI.quantity) DESC; -- Para ordenar por quantidade
	SUM (OI.quantity * OI.unit_price) DESC;


-- 23. Pagamentos com nome do cliente e status do pedido
SELECT
	O.order_id,
	C.name AS 'Nome_Cliente',
	P.amount AS 'Total_Pago',
	O.status AS 'Estado_Pedido'

FROM
	customers C
	INNER JOIN orders O ON C.customer_id = O.customer_id
	INNER JOIN payments P ON O.order_id = P.order_id

ORDER BY
	P.amount DESC;


-- 24. LEFT JOIN: clientes e seus pedidos
SELECT
	O.order_id,
	C.name AS 'Nome_Cliente',
	O.status AS 'Estado_Pedido',
	OI.quantity AS 'Quantidade_Pedido',
	P.name AS 'Nome_Produto'

FROM customers C
	LEFT JOIN orders O ON C.customer_id = O.customer_id
	LEFT JOIN order_items OI ON O.order_id = OI.order_id
	LEFT JOIN products P ON OI.product_id = P.product_id

ORDER BY
	O.order_id;


-- 25. Clientes que NÃO possuem pedidos (anti join)
SELECT
	C.name AS 'Nome_Cliente'

FROM customers C
	LEFT JOIN orders O ON C.customer_id = O.customer_id

WHERE
	O.order_id IS NULL;

-- Para verificar se há clientes sem pedidos. Se >= 1 os clientes já fizeram pedidos
SELECT 
	customer_id, 
	COUNT(order_id) AS 'Total_Pedidos' 
	
FROM orders 

GROUP BY customer_id;

-- 26. Pedidos SEM pagamento confirmado
SELECT 
	O.order_id, 
	C.name AS 'Nome_Cliente',
	O.status AS 'Estado_Pedido',
	P.status AS 'Estado_Pagamento'

FROM orders O 
	LEFT JOIN payments P ON O.order_id = P.order_id 
	AND P.status = 'CONFIRMED' 
	LEFT JOIN customers C ON O.customer_id = C.customer_id
	
WHERE 
	P.order_id IS NULL;


-- 27. Pedidos com mais de 2 itens
SELECT
	O.order_id,
	C.name AS 'Nome_Cliente',
	SUM (OI.quantity) AS 'Total_Produtos'
	
FROM orders O
	LEFT JOIN order_items OI ON O.order_id = OI.order_id
	LEFT JOIN customers C ON O.customer_id = C.customer_id
	
GROUP BY
	O.order_id,
	C.name
	
HAVING
	SUM (OI.quantity) > 2

ORDER BY
	SUM (OI.quantity) DESC;

-- (Opcional) 27. Pedidos com mais de 2 itens, indicando o nome do produto e a sua quantidade 
SELECT 
	OI.order_id,
	C.name AS 'Nome_Cliente',
	P.name AS 'Nome_Produto',
	OI.quantity AS 'Total_Produtos'

FROM order_items OI 
	LEFT JOIN products P ON OI.product_id = P.product_id 
	LEFT JOIN orders O ON OI.order_id = O.order_id
	LEFT JOIN customers C ON O.customer_id = C.customer_id
	
WHERE OI.order_id IN ( 
	SELECT order_id 
	FROM order_items 
	GROUP BY order_id 
	HAVING SUM(quantity) > 2 
	) 

ORDER BY 
	OI.order_id;
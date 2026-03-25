/*
Exercício 7
DELETE
*/

-- 32. Remover pagamentos FAILED.
SELECT -- Confirmar antes de eliminar
	*
FROM 
	payments
WHERE
	status = 'FAILED';


DELETE FROM 
	payments

WHERE
	status = 'FAILED';


-- 33. Remover pedidos CANCELLED (se não houver pagamentos confirmados).
SELECT -- Confirmar antes de eliminar
	* 
FROM orders
WHERE 
	status = 'CANCELLED'
	AND order_id NOT IN (
		SELECT order_id
		FROM payments
		WHERE status = 'CONFIRMED'
);


DELETE FROM orders
WHERE status = 'CANCELLED'
	and order_id NOT IN (
		SELECT order_id
		FROM payments
		WHERE status = 'CONFIRMED'
);


-- 34. Remover produtos inativos que nunca foram vendidos.
SELECT -- Confirmar antes de eliminar
	* 
FROM 
	products 
WHERE 
	active = 0 
	AND product_id NOT IN ( 
		SELECT product_id 
		FROM order_items 
	);


DELETE FROM products
WHERE 
	active = 0 
	AND product_id NOT IN ( 
		SELECT product_id 
		FROM order_items 
	);

-- 35. Remover clientes sem pedido.
SELECT -- Confirmar antes de eliminar
	*
FROM
	customers
WHERE
	customer_id NOT IN (
		SELECT customer_id
		FROM orders
	);


DELETE FROM 
	customers
WHERE
	customer_id NOT IN (
		SELECT customer_id
		FROM orders
	);
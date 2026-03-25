/*
Exerc�cio 6
UPDATE
*/

-- 28. Aumente em 10% produtos da categoria �Accessories�.
SELECT --  Simular antes de atualizar
	product_id,
	name,
	category,
	price AS 'Pre�o_Anterior',
	price * 1.10 AS 'Preco_Novo'
FROM
	products
WHERE 
	category = 'Accessories';


UPDATE products
	SET price = price * 1.10
	WHERE category = 'Accessories';


-- 29. Marque Active=0 para produtos com pre�o < 5.
SELECT -- Confirmar antes de atualizar
	*
FROM 
	products
WHERE
	price < 5;

-- 30. Alterar status de pedidos NEW para CANCELLED se tiverem mais de 7 dias
SELECT -- Confirmar antes de atualizar
	*
FROM
	orders
WHERE
	status = 'NEW'
	AND order_date < DATEADD (DAY, -7, GETDATE());


UPDATE orders
	SET status = 'CANCELLED'
	WHERE status = 'NEW'
			AND order_date < DATEADD (DAY, -7, GETDATE()); 		

-- 31. Corrigir o email de um cliente.
UPDATE customers
	SET email = 'bruno.costa@email.pt'
	WHERE customer_id = 2;

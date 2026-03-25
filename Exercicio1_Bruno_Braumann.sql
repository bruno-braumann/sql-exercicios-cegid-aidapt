/* Exercicio 1
Criar tabelas
*/

-- Tabela Customers
CREATE TABLE customers (
	customer_id INT IDENTITY (1,1) PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	email VARCHAR (50) UNIQUE NOT NULL,
	city VARCHAR (50),
	created_at DATETIME2 DEFAULT GETDATE ()
);

-- Tabela Products
CREATE TABLE products ( 
	product_id INT IDENTITY(1,1) PRIMARY KEY, 
	name VARCHAR(50) NOT NULL, 
	category VARCHAR(50) NOT NULL, 
	price DECIMAL(10,2) NOT NULL, 
	active BIT NOT NULL 
);

--Tabela Orders
CREATE TABLE orders ( 
	order_id INT IDENTITY(1,1) PRIMARY KEY, 
	customer_id INT NOT NULL, 
	order_date DATETIME2 NOT NULL, 
	status VARCHAR(20) NOT NULL, 
);

--Tabela Order Items
CREATE TABLE order_items ( 
	order_id INT NOT NULL, 
	product_id INT NOT NULL, 
	quantity INT NOT NULL, 
	unit_price DECIMAL(10,2) NOT NULL,  
);

--Tabela payments
CREATE TABLE payments ( 
	payment_id INT IDENTITY(1,1) PRIMARY KEY, 
	order_id INT NOT NULL, 
	payment_date DATETIME2 NOT NULL, 
	amount DECIMAL(10,2) NOT NULL, 
	method VARCHAR(20) NOT NULL, 
	status VARCHAR(20) NOT NULL, 
);

--Inserir dados tabela customers
INSERT INTO customers 
	(name, email, city)

	VALUES
		('Ana Silva',     'ana.silva@email.com',      'Porto'),
		('Bruno Costa',   'bruno.costa@email.com',    'Lisboa'),
		('Carla Souza',   'carla.souza@email.com',    'Madrid'),
		('Daniel Rocha',  'daniel.rocha@email.com',   'Porto'),
		('Eva Martins',   'eva.martins@email.com',    'Paris'),
		('Felipe Lima',   'felipe.lima@email.com',    'Porto'),
		('Gabriela Nunes','gabriela.nunes@email.com', 'Berlin'),
		('Hugo Mendes',   'hugo.mendes@email.com',    'Lisboa');

-- Verificar a introdução dos dados customers
SELECT *
FROM customers

--Inserir dados tabela products
INSERT INTO products
	(Name, Category, Price, Active)

	VALUES
		('Power BI Pro Course',     'Courses', 199.90, 1),
		('Excel Advanced Course',   'Courses', 149.90, 1),
		('SQL Server Fundamentals', 'Courses', 129.90, 1),
		('Keyboard',                'Hardware', 49.90, 1),
		('Mouse',                   'Hardware', 29.90, 1),
		('Notebook Stand',          'Accessories', 19.90, 1),
		('USB Hub',                 'Accessories', 15.00, 1),
		('Old Cable',               'Accessories', 3.50, 0),
		('Monitor 24"',             'Hardware', 120.00, 1),
		('Fabric Workshop',         'Courses', 299.90, 1);

-- Verificar a introdução dos dados products
SELECT *
FROM products

--Inserir dados tabela orders
INSERT INTO orders
	(Customer_ID, Order_Date, Status)

	VALUES
		(1, DATEADD(DAY,-10, Getdate()), 'PAID'),
		(2, DATEADD(DAY,-5,  Getdate()), 'NEW'),
		(3, DATEADD(DAY,-20, Getdate()), 'CANCELLED'),
		(4, DATEADD(DAY,-2,  Getdate()), 'SHIPPED'),
		(5, DATEADD(DAY,-40, Getdate()), 'PAID'),
		(6, DATEADD(DAY,-1,  Getdate()), 'NEW'),
		(7, DATEADD(DAY,-15, Getdate()), 'PAID'),
		(8, DATEADD(DAY,-3,  Getdate()), 'PAID'),
		(1, DATEADD(DAY,-60, Getdate()), 'SHIPPED'),
		(2, DATEADD(DAY,-12, Getdate()), 'PAID'),
		(3, DATEADD(DAY,-8,  Getdate()), 'NEW'),
		(4, DATEADD(DAY,-25, Getdate()), 'CANCELLED');

-- Verificar a introdução dos dados orders
SELECT *
FROM orders

--Inserir dados tabela order_items
INSERT INTO order_items
	(Order_ID, Product_ID, Quantity, Unit_Price)

	VALUES
		(1, 1, 1, 199.90),
		(1, 6, 2, 19.90),
		(2, 2, 1, 149.90),
		(2, 5, 1, 29.90),
		(3, 4, 1, 49.90),
		(4, 9, 1, 120.00),
		(4, 7, 2, 15.00),
		(5, 10, 1, 299.90),
		(5, 6, 1, 19.90),
		(6, 3, 1, 129.90),
		(7, 1, 1, 199.90),
		(7, 2, 1, 149.90),
		(8, 4, 1, 49.90),
		(8, 5, 1, 29.90),
		(8, 7, 2, 15.00),
		(9, 9, 2, 120.00),
		(10, 3, 1, 129.90),
		(10, 6, 1, 19.90),
		(11, 2, 2, 149.90),
		(12, 4, 1, 49.90);

-- Verificar a introdução dos dados order_items
SELECT *
FROM order_items

--Inserir dados tabela order_items
INSERT INTO payments
	(Order_ID, Payment_Date, Amount, Method, Status)

	VALUES
		(1, DATEADD(DAY,-9, Getdate()), 239.70, 'CARD', 'CONFIRMED'),
		(4, DATEADD(DAY,-2, Getdate()), 150.00, 'TRANSFER', 'CONFIRMED'),
		(5, DATEADD(DAY,-38, Getdate()), 319.80, 'PIX', 'CONFIRMED'),
		(7, DATEADD(DAY,-14, Getdate()), 349.80, 'CARD', 'CONFIRMED'),
		(8, DATEADD(DAY,-3, Getdate()), 124.90, 'CASH', 'CONFIRMED'),
		(9, DATEADD(DAY,-59, Getdate()), 240.00, 'PIX', 'CONFIRMED'),
		(10, DATEADD(DAY,-11, Getdate()), 149.80, 'CARD', 'FAILED');

-- Verificar a introdução dos dados payments
SELECT *
FROM payments
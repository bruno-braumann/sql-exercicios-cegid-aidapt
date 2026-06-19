# SQL Server — Practical Exercises

A collection of SQL exercises from the **Databases SQL** module of the AiDAPT course at Cegid Academy.
All scripts were developed and tested in **SQL Server (T-SQL)**.

---

## Repository Structure

| File | Topic | Content |
|---|---|---|
| `Exercicio1_Bruno_Braumann.sql` | Setup | CREATE TABLE + INSERT (test data) |
| `Exercicio2_SELECT_Bruno_Braumann.sql` | SELECT | Basic queries, ORDER BY, DISTINCT, TOP |
| `Exercicio3_WHERE_Bruno_Braumann.sql` | WHERE | Filters, LIKE, OR, DATEADD |
| `Exercicio4_GROUPBY_HAVING_Bruno_Braumann.sql` | GROUP BY / HAVING | Aggregations, SUM, AVG, COUNT, HAVING |
| `Exercicio5_JOINS_Bruno_Braumann.sql` | JOINs | INNER JOIN, LEFT JOIN, Anti Join |
| `Exercicio6_UPDATE_Bruno_Braumann.sql` | UPDATE | Conditional and unconditional updates |
| `Exercicio7_DELETE_Bruno_Braumann.sql` | DELETE | Record removal with filters and subqueries |

---

## Data Model

The project uses a fictional e-commerce database with 5 tables:

```
customers ──< orders ──< order_items >── products
                 └──< payments
```

| Table | Description |
|---|---|
| `customers` | Registered customers |
| `products` | Product catalogue |
| `orders` | Placed orders |
| `order_items` | Line items per order |
| `payments` | Payments associated with orders |

---

## Exercises

### Exercise 1 — Initial Setup

Create the following tables:

- `customers(customer_id, name, email, city, created_at)`
- `products(product_id, name, category, price, active)`
- `orders(order_id, customer_id, order_date, status)`
- `order_items(order_id, product_id, quantity, unit_price)`
- `payments(payment_id, order_id, payment_date, amount, method, status)`

**Relationships:**
- `orders.customer_id` → `customers.customer_id`
- `order_items.order_id` → `orders.order_id`
- `order_items.product_id` → `products.product_id`
- `payments.order_id` → `orders.order_id`

**INSERT:** Populate all tables with the provided test data.

---

### Exercise 2 — SELECT

1. List all customers.
2. List FullName, Email and City.
3. List products ordered by Price descending.
4. List distinct categories.
5. List the 5 most expensive products (TOP 5).

---

### Exercise 3 — WHERE

1. Products with price greater than 100.
2. Customers from the city "Porto".
3. Orders with status CANCELLED.
4. Orders from the last 30 days (using `DATEADD`).
5. Products in the "Accessories" or "Hardware" categories.
6. Products with a name containing "Course".
7. Customers with an email ending in ".com".

---

### Exercise 4 — GROUP BY and HAVING

1. Average price per category.
2. Number of products per category.
3. Number of orders per status.
4. Total confirmed revenue (sum of confirmed payments).
5. Total amount paid per customer.
6. Customers with total spend above 300 (using `HAVING`).
7. Total value of each order (sum of line items).

---

### Exercise 5 — JOINs

1. `INNER JOIN`: orders with customer name.
2. `INNER JOIN`: line items with product name.
3. Order total with customer name.
4. Payments with customer name and order status.
5. `LEFT JOIN`: customers and their orders.
6. Customers with no orders (anti join).
7. Orders with no confirmed payment.
8. Orders with more than 2 items.

---

### Exercise 6 — UPDATE

1. Increase the price of "Accessories" products by 10%.
2. Set `Active = 0` for products with price below 5.
3. Change the status of NEW orders to CANCELLED if they are more than 7 days old.
4. Correct the email address of a specific customer.

---

### Exercise 7 — DELETE

1. Remove FAILED payments.
2. Remove CANCELLED orders (only if they have no confirmed payments).
3. Remove inactive products that were never sold.
4. Remove customers with no orders.

---

## How to Use

1. Run **Exercise 1** first to create the tables and insert the test data.
2. Run the remaining exercises in numerical order.
3. Exercise 6 (UPDATE) and Exercise 7 (DELETE) **modify or delete data** — run with care.

> ⚠️ Scripts are written in **T-SQL** (SQL Server). Functions such as `GETDATE()`, `DATEADD()`, `IDENTITY` and `TOP` are specific to this dialect.

---

## Topics Covered

- `CREATE TABLE`, `INSERT INTO`
- `SELECT`, `DISTINCT`, `TOP`, `ORDER BY`
- `WHERE`, `LIKE`, `BETWEEN`, `IN`, `AND`, `OR`
- `GROUP BY`, `HAVING`, `SUM`, `AVG`, `COUNT`
- `INNER JOIN`, `LEFT JOIN`, subqueries
- `UPDATE` with conditions
- `DELETE` with filters and subqueries

---

## Technologies

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)

---

*AiDAPT Course — Cegid Academy | Module: Databases SQL*

*Curso AiDAPT — Módulo: Bases de Dados SQL*

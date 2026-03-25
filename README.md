# 🗄️ SQL Server — Exercícios Práticos

Repositório com os exercícios práticos do módulo de **Bases de Dados SQL** do curso AiDAPT.  
Todos os scripts foram desenvolvidos e testados em **SQL Server (T-SQL)**.

---

## 📁 Estrutura do Repositório

| Ficheiro | Tema | Conteúdo |
|---|---|---|
| `Exercicio1_Bruno_Braumann.sql` | Setup | CREATE TABLE + INSERT (dados de teste) |
| `Exercicio2_SELECT_Bruno_Braumann.sql` | SELECT | Consultas básicas, ORDER BY, DISTINCT, TOP |
| `Exercicio3_WHERE_Bruno_Braumann.sql` | WHERE | Filtros, LIKE, OR, DATEADD |
| `Exercicio4_GROUPBY_HAVING_Bruno_Braumann.sql` | GROUP BY / HAVING | Agregações, SUM, AVG, COUNT, HAVING |
| `Exercicio5_JOINS_Bruno_Braumann.sql` | JOINs | INNER JOIN, LEFT JOIN, Anti Join |
| `Exercicio6_UPDATE_Bruno_Braumann.sql` | UPDATE | Atualizações com e sem condições |
| `Exercicio7_DELETE_Bruno_Braumann.sql` | DELETE | Remoção de registos com filtros e subqueries |

---

## 🗂️ Modelo de Dados

O projeto usa uma base de dados de e-commerce fictícia com 5 tabelas:

```
customers ──< orders ──< order_items >── products
                 └──< payments
```

| Tabela | Descrição |
|---|---|
| `customers` | Clientes registados |
| `products` | Catálogo de produtos |
| `orders` | Encomendas realizadas |
| `order_items` | Itens de cada encomenda |
| `payments` | Pagamentos associados a encomendas |

---

## 📝 Exercícios

### Exercício 1 — Desafio Inicial

Crie as seguintes tabelas:

- `customers(customer_id, name, email, city, created_at)`
- `products(product_id, name, category, price, active)`
- `orders(order_id, customer_id, order_date, status)`
- `order_items(order_id, product_id, quantity, unit_price)`
- `payments(payment_id, order_id, payment_date, amount, method, status)`

**Relacionamentos / restrições:**
- `orders.customer_id` → `customers.customer_id`
- `order_items.order_id` → `orders.order_id`
- `order_items.product_id` → `products.product_id`
- `payments.order_id` → `orders.order_id`

**INSERT:** Popular todas as tabelas com os dados de teste fornecidos.

---

### Exercício 2 — SELECT: A Jornada Começa

1. Liste todos os clientes.
2. Liste FullName, Email e City.
3. Liste os produtos ordenados por Price descendente.
4. Liste as categorias distintas.
5. Liste os 5 produtos mais caros (TOP 5).

---

### Exercício 3 — WHERE?

6. Produtos com preço maior que 100.
7. Clientes da cidade "Porto".
8. Pedidos com status CANCELLED.
9. Pedidos dos últimos 30 dias (usar `DATEADD`).
10. Produtos das categorias "Accessories" ou "Hardware".
11. Produtos com nome contendo "Course".
12. Clientes com email terminando em ".com".

---

### Exercício 4 — GROUP BY e HAVING

13. Preço médio por categoria.
14. Quantidade de produtos por categoria.
15. Quantidade de pedidos por status.
16. Total confirmado recebido (soma dos pagamentos confirmados).
17. Total pago por cliente.
18. Clientes com total gasto superior a 300 (usar `HAVING`).
19. Total de cada pedido (somar itens).

---

### Exercício 5 — JOINs

20. `INNER JOIN`: pedidos com nome do cliente.
21. `INNER JOIN`: itens com nome do produto.
22. Total do pedido com nome do cliente.
23. Pagamentos com nome do cliente e status do pedido.
24. `LEFT JOIN`: clientes e os seus pedidos.
25. Clientes sem pedidos (anti join).
26. Pedidos sem pagamento confirmado.
27. Pedidos com mais de 2 itens.

---

### Exercício 6 — UPDATE

28. Aumente em 10% o preço dos produtos da categoria "Accessories".
29. Marque `Active = 0` para produtos com preço inferior a 5.
30. Alterar o status de pedidos NEW para CANCELLED se tiverem mais de 7 dias.
31. Corrigir o email de um cliente específico.

---

### Exercício 7 — DELETE

32. Remover pagamentos FAILED.
33. Remover pedidos CANCELLED (apenas se não tiverem pagamentos confirmados).
34. Remover produtos inativos que nunca foram vendidos.
35. Remover clientes sem pedidos.

---

## 🚀 Como Usar

1. Executar primeiro o **Exercício 1** para criar as tabelas e inserir os dados.
2. Correr os restantes exercícios pela ordem numérica.
3. Os scripts do Exercício 6 (UPDATE) e 7 (DELETE) **modificam ou eliminam dados** — executar com atenção.

> ⚠️ Os scripts foram escritos em **T-SQL** (SQL Server). Funções como `GETDATE()`, `DATEADD()`, `IDENTITY` e `TOP` são específicas deste dialeto.

---

## 📚 Temas Abordados

- `CREATE TABLE`, `INSERT INTO`
- `SELECT`, `DISTINCT`, `TOP`, `ORDER BY`
- `WHERE`, `LIKE`, `BETWEEN`, `IN`, `AND`, `OR`
- `GROUP BY`, `HAVING`, `SUM`, `AVG`, `COUNT`
- `INNER JOIN`, `LEFT JOIN`, subqueries
- `UPDATE` com condições
- `DELETE` com filtros e subqueries

---

## 🛠️ Tecnologias

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)

---

*Curso AiDAPT — Módulo: Bases de Dados SQL*

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

## 🚀 Como Usar

1. Executar primeiro o **Exercício 1** para criar as tabelas e inserir os dados
2. Correr os restantes exercícios pela ordem numérica
3. Os scripts do Exercício 6 (UPDATE) e 7 (DELETE) **modificam os dados** — executar com atenção

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

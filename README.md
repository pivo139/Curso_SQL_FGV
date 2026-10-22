# 📊 Análise de Dados Globais com SQL — Curso FGV

Este repositório contém os scripts de consultas SQL desenvolvidos e aprimorados durante e após a conclusão do curso **SQL (Structured Query Language)** da **Fundação Getulio Vargas (FGV)**.

O objetivo do projeto é aplicar conceitos essenciais de banco de dados relacional para investigar indicadores socioeconômicos globais (como expectativa de vida, mortalidade infantil, taxa de natalidade e PIB *per capita*) utilizando a base de dados do projeto **Gapminder** e dados do Banco Mundial que estão no curso da FGV.

---

## 🎯 Conteúdos Práticos Aplicados

- **Consultas e Filtros:** `SELECT`, `WHERE`, `BETWEEN`, `ORDER BY` e agrupamentos com `GROUP BY`.
- **Junções Relacionais (JOINs):**
  - `INNER JOIN` para relacionar tabelas com múltiplas chaves.
  - `LEFT JOIN` para garantir a inclusão de registros mesmo com ausência de correspondência.
- **Funções de Agregação:** `AVG()`, `MAX()`, `MIN()`, `ROUND()`.
- **Análise Demográfica:** Filtros temporais e agrupamentos regionais por categorias do Banco Mundial (`wb_regions`, `wb3income`).
- **Controle de Transações (DML):** Uso de `BEGIN TRANSACTION`, `COMMIT` e `ROLLBACK` para garantia de integridade de dados.

---

## 🛠️ Como Executar os Scripts

1. Clone este repositório:
   ```bash
   git clone [https://github.com/pivo139/Curso_SQL_FGV.git](https://github.com/pivo139/Curso_SQL_FGV.git)

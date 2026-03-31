-- =========================================
-- PROJETO: DataCafé Analytics
-- ETAPA: Consultas Analíticas
-- =========================================

-- =========================
-- 1. FATURAMENTO TOTAL
-- =========================
SELECT 
    SUM(valor_total) AS faturamento_total
FROM vendas;

-- =========================
-- 2. PRODUTO MAIS VENDIDO (QUANTIDADE)
-- =========================
SELECT 
    p.nome,
    SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.produto_id = p.produto_id
GROUP BY p.nome
ORDER BY total_vendido DESC
LIMIT 1;

-- =========================
-- 3. CLIENTE QUE MAIS COMPROU
-- =========================
SELECT 
    c.nome,
    SUM(v.valor_total) AS total_gasto
FROM vendas v
JOIN clientes c ON v.cliente_id = c.cliente_id
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 1;

-- =========================
-- 4. VENDAS POR CATEGORIA
-- =========================
SELECT 
    p.categoria,
    SUM(v.valor_total) AS faturamento
FROM vendas v
JOIN produtos p ON v.produto_id = p.produto_id
GROUP BY p.categoria;

-- =========================
-- 5. VENDAS POR DATA
-- =========================
SELECT 
    data,
    SUM(valor_total) AS total_dia
FROM vendas
GROUP BY data
ORDER BY data;

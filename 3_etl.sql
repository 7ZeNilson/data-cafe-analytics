-- =========================================
-- PROJETO: DataCafé Analytics
-- ETAPA: ETL (Extração, Transformação e Carga)
-- =========================================

-- =========================
-- 1. TABELA BRUTA (DADOS NÃO TRATADOS)
-- =========================
CREATE TABLE vendas_brutas (
    venda_id INTEGER,
    data TEXT,
    cliente TEXT,
    produto TEXT,
    quantidade TEXT,
    valor_total TEXT
);

-- =========================
-- 2. INSERÇÃO DE DADOS COM ERROS
-- =========================
INSERT INTO vendas_brutas VALUES (6, '2026-03-06', 'João Silva', 'Café Tradicional', '2', '21.00');
INSERT INTO vendas_brutas VALUES (7, '2026-03-07', 'Maria Souza', 'Café Premium', '1', '18.00');
INSERT INTO vendas_brutas VALUES (8, '2026-03-08', 'Carlos Lima', 'Cappuccino', 'erro', '36.00');
INSERT INTO vendas_brutas VALUES (9, '2026-03-09', 'Ana Costa', 'Café Orgânico', '2', NULL);
INSERT INTO vendas_brutas VALUES (10, '2026-03-10', 'Bruno Rocha', 'Produto Inexistente', '1', '10.00');

-- =========================
-- 3. TRANSFORMAÇÃO (LIMPEZA DOS DADOS)
-- =========================
SELECT *
FROM vendas_brutas
WHERE 
    quantidade != 'erro'
    AND valor_total IS NOT NULL;

-- =========================
-- 4. CARGA (LOAD) DOS DADOS TRATADOS
-- =========================
INSERT INTO vendas (venda_id, data, cliente_id, produto_id, quantidade, valor_total)
SELECT 
    vb.venda_id,
    vb.data,
    c.cliente_id,
    p.produto_id,
    CAST(vb.quantidade AS INTEGER),
    CAST(vb.valor_total AS REAL)
FROM vendas_brutas vb
JOIN clientes c ON vb.cliente = c.nome
JOIN produtos p ON vb.produto = p.nome
WHERE 
    vb.quantidade != 'erro'
    AND vb.valor_total IS NOT NULL;

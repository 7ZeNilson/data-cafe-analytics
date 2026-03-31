-- =========================================
-- PROJETO: DataCafé Analytics
-- ETAPA: Modelagem de Dados (3FN)
-- =========================================

-- =========================
-- TABELA: CLIENTES
-- =========================
CREATE TABLE clientes (
    cliente_id INTEGER PRIMARY KEY,
    nome TEXT,
    cidade TEXT,
    estado TEXT
);

-- =========================
-- TABELA: PRODUTOS
-- =========================
CREATE TABLE produtos (
    produto_id INTEGER PRIMARY KEY,
    nome TEXT,
    categoria TEXT,
    preco REAL
);

-- =========================
-- TABELA: VENDAS
-- =========================
CREATE TABLE vendas (
    venda_id INTEGER PRIMARY KEY,
    data DATE,
    cliente_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER,
    valor_total REAL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- =========================
-- INSERÇÃO DE DADOS - CLIENTES
-- =========================
INSERT INTO clientes VALUES (1, 'João Silva', 'Fortaleza', 'CE');
INSERT INTO clientes VALUES (2, 'Maria Souza', 'Recife', 'PE');
INSERT INTO clientes VALUES (3, 'Carlos Lima', 'Salvador', 'BA');
INSERT INTO clientes VALUES (4, 'Ana Costa', 'Fortaleza', 'CE');
INSERT INTO clientes VALUES (5, 'Bruno Rocha', 'Natal', 'RN');
INSERT INTO clientes VALUES (6, 'Fernanda Alves', 'Fortaleza', 'CE');
INSERT INTO clientes VALUES (7, 'Lucas Martins', 'João Pessoa', 'PB');
INSERT INTO clientes VALUES (8, 'Patrícia Gomes', 'Maceió', 'AL');
INSERT INTO clientes VALUES (9, 'Ricardo Santos', 'Teresina', 'PI');
INSERT INTO clientes VALUES (10, 'Juliana Ferreira', 'Aracaju', 'SE');

-- =========================
-- INSERÇÃO DE DADOS - PRODUTOS
-- =========================
INSERT INTO produtos VALUES (1, 'Café Tradicional', 'Café', 10.50);
INSERT INTO produtos VALUES (2, 'Café Premium', 'Café', 18.00);
INSERT INTO produtos VALUES (3, 'Cappuccino', 'Bebida', 12.00);
INSERT INTO produtos VALUES (4, 'Café Orgânico', 'Café', 22.00);
INSERT INTO produtos VALUES (5, 'Chocolate Quente', 'Bebida', 15.00);

-- =========================
-- INSERÇÃO DE DADOS - VENDAS
-- =========================
INSERT INTO vendas VALUES (1, '2026-03-01', 1, 1, 2, 21.00);
INSERT INTO vendas VALUES (2, '2026-03-02', 2, 2, 1, 18.00);
INSERT INTO vendas VALUES (3, '2026-03-03', 3, 3, 3, 36.00);
INSERT INTO vendas VALUES (4, '2026-03-04', 1, 2, 1, 18.00);
INSERT INTO vendas VALUES (5, '2026-03-05', 4, 4, 2, 44.00);

-- =========================
-- CONSULTA DE VALIDAÇÃO (JOIN)
-- =========================
SELECT 
    v.venda_id,
    v.data,
    c.nome AS cliente,
    p.nome AS produto,
    p.categoria,
    v.quantidade,
    v.valor_total
FROM vendas v
JOIN clientes c ON v.cliente_id = c.cliente_id
JOIN produtos p ON v.produto_id = p.produto_id;
